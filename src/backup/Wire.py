from copy       import deepcopy

import re
from .Component import Component
from .Interface import Interface
from .Port      import Port

class Wire(Interface):

    def __init__(self,direction,data_width):
        Interface.__init__(self)
        self.constraint_father_type(Port,Component)
        self.__direction    = direction
        self.__data_width   = data_width
        self.__param_check()

    def __param_check(self):
        if not self.direction == self.INPUT and not self.direction == self.OUTPUT:
            raise TypeError('The direction of a Wire should be INPUT or OUTPUT,but get a \'%s %s\'.' % type(self.direction))
        elif not isinstance(self.data_width,int):
            raise TypeError('The data_width of a Wire should be int,but get a %s' % type(self.direction))
        elif self.data_width < 1 or not isinstance(self.data_width,int):
            raise ArithmeticError('The data_width of a Wire should be int and larger than 0,but the value is %d' % self.data_width)

    @property
    def direction(self):
        return self.__direction

    @property
    def data_width(self):
        return self.__data_width

    def reverse_direction(self):
        '''将该Wire的方向进行反向'''
        self.__direction = self.INPUT if self.direction == self.OUTPUT else self.OUTPUT

    def expand(self):
        return [self]

    #=============================================================================================
    # inner function
    #=============================================================================================

    def __eq__(self,other):
        if not isinstance(other,Wire):
            raise TypeError('Wire can only use == with another Wire,but get a %s.' % type(other))
        if (self.name == other.name) and (self.direction == other.direction) and (self.data_width == other.data_width):
            return True
        else:
            return False

    def __str__(self):
        return "Wire(%s,%s,%d)" %(self.name_until(Component),"INPUT" if self.direction == self.INPUT else "OUTPUT",self.data_width)


    #=============================================================================================
    # RTL gen 
    #=============================================================================================

    def gen_rtl_inst(self):
        '''生成端口实例化的RTL'''
        return [".%s(%s)" %(self.name_before(Component),self.name_until(Component))]

    def gen_rtl_def(self):
        '''生成端口定义的RTL'''
        return ["%s %s %s" %("input" if self.direction == self.INPUT else "output",'' if self.data_width==1 else '[%s:0]' % (self.data_width-1),self.name_before(Component))]

    def gen_rtl_io(self):
        '''生成信号声明的RTL'''
        return ["wire %s %s;" %('' if self.data_width==1 else '[%s:0]' % (self.data_width-1),self.name_until(Component))]

