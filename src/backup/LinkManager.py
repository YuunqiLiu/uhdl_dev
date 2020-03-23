from operator   import concat
from functools  import reduce

from .Interface import Interface
from .Entity    import Entity
from .Virtual   import Virtual
from .Port      import Port
#from .Wire      import Wire

class LinkNode(Virtual):

    def __init__(self):
        Virtual.__init__(self)
        self.input_port_list  = [] 
        self.output_port_list = []

    def in_node(self,*args):
        for item in args:
            if self.__in_list(item,self.input_port_list) or self.__in_list(item,self.output_port_list):
                return True
        return False

    def __op_wrapper(self,port):
        return port.reverse() if self.__is_inner(port) else port

    def __is_inner(self,port):
        return True if port.father_until_not(Interface) is self.father else False


    def add_port(self,*args):
        for item in args:
            if self.__in_list(item,self.input_port_list) or self.__in_list(item,self.output_port_list):
                pass
            elif self.__op_wrapper(item).direction is Port.INPUT:
                self.__add_input(item)
            elif self.__op_wrapper(item).direction is Port.OUTPUT:
                self.__add_output(item)
            else:
                raise Exception

    def __in_list(self,item,l):
        for i in l:
            if item is i:
                return True
        return False


    def __add_input(self,port):
        if (self.output_port_list != []) and (self.__op_wrapper(self.output_port_list[0]) != self.__op_wrapper(port).reverse()):
            raise ArithmeticError('This node has link with output port %s,not match the input port %s.' %(self.output_port_list[0],self.__op_wrapper(port)))
        elif (self.input_port_list != []) and (self.__op_wrapper(self.input_port_list[0]) != self.__op_wrapper(port)):
            raise ArithmeticError('This node has link with input port %s,not match the input port %s.' %(self.input_port_list[0],self.__op_wrapper(port)))
        self.input_port_list.append(port)

    def __add_output(self,port):
        if (self.output_port_list != []):
            raise ArithmeticError('This node has link with a ouput port,not allow another output port.')
        elif (self.input_port_list != []) and (self.__op_wrapper(self.input_port_list[0]) != self.__op_wrapper(port).reverse()):
            raise ArithmeticError('This node had link with input port %s,not match the output port %s' %(self.input_port_list[0],self.__op_wrapper(port)))
        self.output_port_list.append(port)


    #=============================================================================================
    # RTL gen 
    #=============================================================================================

    def __get_rtl_link_name(self,wire):
        return wire.name_before_not(Interface) if self.__is_inner(wire) else wire.name_until_not(Interface)

    def gen_rtl_link(self):
        return ["assign %s = %s;" %(self.__get_rtl_link_name(i),self.__get_rtl_link_name(self.output_port_list[0])) for i in self.input_port_list]


class LinkManager(Virtual):

    def __init__(self):
        Virtual.__init__(self)
        self.constraint_father_type(Entity) 
        self.__linknode_list = []

    #def __call__(self):
    #    return self.__payload.values()
    #
    #def sort(self):
    #    self.__list.sort()

    def __process_wire(self,*args):
        for linknode in self.__linknode_list:
            if linknode.in_node(*args):
                linknode.add_port(*args)
                return True
        new_node = LinkNode()
        self.set_father(new_node)
        new_node.add_port(*args)
        self.__linknode_list.append(new_node)

    def link(self,*args):
        for port in args:
            self.__link_port_check(port)
        exp = [p.expand() for p in args]
        for wire_tuple in zip(*exp):
            self.__process_wire(*wire_tuple)


    def __link_port_check(self,port):
        if not isinstance(port,Interface):
            raise TypeError('The item to link should be a Port,but get a %s' % type(port))
        elif not (port.father_component is self.father or port.father_component in self.father.component()):
            raise ArithmeticError('the port to link is not in this component.')


    #=============================================================================================
    # RTL gen 
    #=============================================================================================

    def gen_rtl_link(self):
        return reduce(concat,[l.gen_rtl_link() for l in self.__linknode_list],[])



    #print(wire_tuple)

    #def link(self,port_A,port_B):
    #    self.__link_port_check(port_A)
    #    self.__link_port_check(port_B)
    #    exp_A = port_A.expand()
    #    exp_B = port_B.expand()
    #    for wire_A,wire_B in zip(exp_A,exp_B):
    #        self.__process_wire(wire_A,wire_B)