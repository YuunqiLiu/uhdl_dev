from copy       import deepcopy
from operator   import concat
from functools  import reduce

from .Container import Container
from .Interface import Interface

class Port(Interface):

    def __init__(self):
        Interface.__init__(self)
        self.__sub_port = Container(Interface)
        self.set_father(self.__sub_port)

    @property
    def sub_port(self):
        return self.__sub_port

    def new(self,**args):
        self.sub_port.new(**args)        
        for name,item in args.items():
            setattr(self,name,item)
    
    def reverse_direction(self):
        for item in self.sub_port():
            item.reverse_direction()

    def expand(self):
        '''将本port展开为一个wire形式，输出为List[Wire]'''
        result = reduce(concat,[p.expand() for p in self.sub_port()])
        result.sort()
        return result

    #=============================================================================================
    # inner function
    #=============================================================================================

    def __eq__(self,other):
        if not isinstance(other,Port):
            raise TypeError('Port can only use == with Port,but get a %s' % type(other))
        self.sub_port.sort()
        other.sub_port.sort()
        for self_sub_port,other_sub_port in zip(self.sub_port(),other.sub_port()):
            if self_sub_port != other_sub_port:
                return False
        return True

    def __str__(self):
        return "Port(sub=%d,port=,wire=)" % len(self.sub_port())

    #=============================================================================================
    # RTL gen 
    #=============================================================================================

    def gen_rtl_inst(self):
        '''生成端口实例化的RTL'''
        return reduce(concat,[p.gen_rtl_inst() for p in self.sub_port()])

    def gen_rtl_def(self):
        '''生成端口定义的RTL'''
        return reduce(concat,[p.gen_rtl_def() for p in self.sub_port()])

    def gen_rtl_io(self):
        '''生成信号声明的RTL'''
        return reduce(concat,[p.gen_rtl_io() for p in self.sub_port()])



    #def direction(self):
    #    direction_set = list(set([x.direction for x in self.sub_port()]))
    #    if len(direction_set) > 1:
    #        return self.MIX
    #    else:
    #        return direction_set[0]

    #def reverse(self):
    #    p = deepcopy(self)
    #    p.reverse_direction()
    #    return p

        #p = Port()
        #for item in self.sub_port():
        #    eval("p.new(%s=item.reverse())" % item.name)
    #    return p


    #def is_match(self,other):
    #    '''检查本port self与输入port other是否匹配。
    #    
    #    匹配指的是self与other包含的wire名称一一对应，且对应wire的位宽相同，但方向相反。
    #    
    #    '''
    #    return True if other.reverse() == self else False

    #def __lt__(self,other):
    #    return not self.__gt__(other)

    #__repr__ = __str__


    
    #def __gt__(self,other):
    #    if not isinstance(other,Interface):
    #        raise TypeError('Wire can only use > or < with Wire/Port,but get a %s.' % type(other))
    #    elif self.name == other.name:
    #        raise Exception()
    #    #elif self.direction == self.OUTPUT and other.direction == self.INPUT:
    #    #    return True
    #    #elif self.direction == self.INPUT and other.direction == self.OUTPUT:
    #    #    return False
    #    elif self.name > other.name:
    #        return True
    #    else:
    #        return False