from copy    import deepcopy
from abc     import abstractmethod


from .Entity import Entity
from enum    import Enum

class InterfaceDirection(Enum):
    INPUT  = 1
    OUTPUT = 2
    MIX    = 3


class Interface(Entity):
    
    def __init__(self):
        Entity.__init__(self)
        self.constraint_father_type(Entity)

    INPUT  = InterfaceDirection.INPUT
    OUTPUT = InterfaceDirection.OUTPUT
    MIX    = InterfaceDirection.MIX

    def is_match(self,other):
        '''判断输入的Interface和本Interface是否能进行互联'''
        return True if other.reverse() == self else False

    @abstractmethod
    def reverse_direction(self):
        '''将该Interface的方向进行反向'''
        pass

    def reverse(self):
        '''返回一个新Interface，这个Interface是本Interface的反向'''
        i = deepcopy(self)
        i.reverse_direction()
        return i

    @property
    def father_component(self):
        return self.father_until_not(Interface)

    #=============================================================================================
    # inner function
    #=============================================================================================

    def __gt__(self,other):
        if not isinstance(other,Interface):
            raise TypeError('%s should compare with a Port or a Wire,but get a %s' %(type(self),type(other)))
        elif self.name == other.name:
            raise Exception()
        elif self.name > other.name:
            return True
        else:
            return False

    def __lt__(self,other):
        return not self.__gt__(other)

    @abstractmethod
    def __eq__(self,other):
        pass

    @abstractmethod
    def __str__(self):
        pass

    __repr__ = __str__

    #=============================================================================================
    # RTL gen 
    #=============================================================================================

    @abstractmethod
    def gen_rtl_inst(self):
        '''生成端口实例化的RTL'''
        pass

    @abstractmethod
    def gen_rtl_def(self):
        '''生成端口定义的RTL'''
        pass

    @abstractmethod
    def gen_rtl_io(self):
        '''生成信号声明的RTL'''
        pass


