from copy       import deepcopy
from enum       import Enum

from .Virtual   import Virtual
from .Component import Component
from .Port      import Port

#class LinkDirection(Enum):
#    Inner = 1
#    Outer = 2


#class PortExt(Virtual):
#
#    Inner = LinkDirection.Inner
#    Outer = LinkDirection.Outer
#
#    def __init__(self,port):
#        Virtual.__init__(self)
#        self.type = self.Inner if port.father_component is self.father else self.Outer
#        self.port = Port

class LinkNode(Virtual):

    def __init__(self):
        Virtual.__init__(self)
        self.input_port_list  = [] 
        self.mix_port_list    = []
        self.output_port_list = []


        #main_port,other_port = (port_A,port_B) if self.op_wrapper(port_A) > self.op_wrapper(port_B) else (port_B,port_A)
        #self.main_port       = main_port
        #self.other_port_list = [other_port]

    def in_link(self,*args):
        for item in args:
            if item in self.input_port_list or item in self.mix_port_list or item in self.output_port_list:
                return True
            else:
                return False
    
    def op_wrapper(self,port):
        if self.__is_inner(port):
            return port.reverse()
        else:
            return port

    def __is_inner(self,port):
        return True if port.father is self.father else False

    def add_port(self,*args):
        for item in args:
            if item in self.input_port_list or item in self.mix_port_list or item in self.output_port_list:
                pass
            elif self.op_wrapper(item).direction is Port.INPUT:
                self.__add_input(item)
            elif self.op_wrapper(item).direction is Port.MIX:
                self.__add_mix(item)
            elif self.op_wrapper(item).direction is Port.OUTPUT:
                self.__add_output(item)

    def __add_input(self,port):
        if (self.mix_port_list != []):
            raise ArithmeticError('This node has link with mix port,not allow a input port.')
        elif (self.output_port_list != []) and (self.output_port_list[0] != self.op_wrapper(port).reverse()):
            raise ArithmeticError('This node has link with output port %s,not match the input port %s.' %(self.output_port_list[0],self.op_wrapper(port)))
        elif (self.input_port_list != []) and (self.input_port_list[0] != self.op_wrapper(port)):
            raise ArithmeticError('This node has link with input port %s,not match the input port %s.' %(self.input_port_list[0],self.op_wrapper(port)))
        self.input_port_list.append(port)

    def __add_mix(self,port):
        if (self.input_port_list != []):
            raise ArithmeticError('This node has link with input port,not allow mix port.')
        elif (self.output_port_list != []):
            raise ArithmeticError('This node has link with output port,not allow output port.')
        elif len(self.mix_port_list)>= 2:
            raise ArithmeticError('This node has link with two mix port,not allow more mix port.')
        elif (self.mix_port_list != []) and (self.mix_port_list[0] != self.op_wrapper(port).reverse()):
            raise ArithmeticError('This node has link with a mix port %s,not match the input port %s.')
        self.mix_port_list.append(port)

    def __add_output(self,port):
        if (self.output_port_list != []):
            raise ArithmeticError('This node has link with a ouput port,not allow another output port.')
        elif (self.mix_port_list != []):
            raise ArithmeticError('This node has link with mix port(s),not allow output port.')
        elif (self.input_port_list != []) and (self.input_port_list[0] != self.op_wrapper(port).reverse()):
            raise ArithmeticError('This node had link with input port %s,not match the output port %s' %(self.input_port_list[0],self.op_wrapper(port)))
        self.output_port_list.append(port)
    
    
    #@classmethod
    #def build(cls,port_A,port_B):
    #    
    #    return LinkRecorder(main_port,other_port)

class LinkManager(Virtual):

    def __init__(self):
        Virtual.__init__(self)
        self.constraint_father_type(Component) 
        self.__recorder_list = []

    #def __call__(self):
    #    return self.__payload.values()
#
    #def sort(self):
    #    self.__list.sort()


    def link(self,port_A,port_B):
        self.__link_port_check(port_A)
        self.__link_port_check(port_B)

        



    def __link_port_check(self,port):
        if isinstance(port,Port):
            raise TypeError('The item to link should be a Port,but get a %s' % type(port))
        elif not (port.father_component is self.father or port.father_component in self.father.component()):
            raise ArithmeticError('the port to link is not in this component.')