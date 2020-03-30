import math
import re
from functools  import reduce
from operator   import concat

from copy       import copy
from .Root      import Root
from .Value     import *

class Variable(Root):

    def __init__(self):
        super(Variable,self).__init__()

    @property
    def name_until_component(self):
        return self.name_until_not(Variable)

    @property
    def name_before_component(self):
        return self.name_before_not(Variable)
            
    def __gt__(self,other):
        if not isinstance(other,Variable):
            raise TypeError('%s should compare with a Variable,but get a %s' %(type(self),type(other)))
        elif self.name == other.name:
            raise Exception()
        elif self.name > other.name:
            return True
        else:
            return False

    def __lt__(self,other):
        return not self.__gt__(other)


class SingleVar(Variable,Value):

    def __init__(self,width=1):
        super(SingleVar,self).__init__()
        self.__width = width

    @property
    def width(self):
        return self.__width

    @property
    def string(self):
        return self.name_before_component #self.__name

    @property
    def attribute(self):
        return self.__width





class WireSig(SingleVar):
    pass


class Reg(SingleVar):
    pass


class Wire(WireSig):

    #=============================================================================================
    # RTL gen 
    #=============================================================================================

    # @property
    # def verilog_inst(self):
    #     '''生成端口实例化的RTL'''
    #     return [".%s(%s)" %(self.name_before(Component),self.name_until(Component))]

    @property
    def verilog_def(self):
        '''生成端口定义的RTL'''
        return ['wire [%s:0] %s' % ((self.attribute-1),self.name_before_component)]


class IOSig(WireSig):

    @property
    def verilog_inst(self):
        '''生成端口实例化的RTL'''
        return [".%s(%s)" %(self.name_before_component,self.name_until_component)]

    @property
    def verilog_outer_def(self):
        '''生成信号声明的RTL'''
        return ["wire %s %s" %('' if self.attribute==1 else '[%s:0]' % (self.attribute-1),self.name_until_component)]

    @property
    def _iosig_type_prefix(self):
        raise NotImplementedError

    @property
    def verilog_def(self):
        return ['%s %s %s' % (self._iosig_type_prefix,'' if self.attribute==1 else '[%s:0]' %(self.attribute-1),self.name_before_component)]


class Input(IOSig):

    @property
    def is_lvalue(self):
        pass

    @property
    def _iosig_type_prefix(self):
        return 'input'

    def reverse(self):
        return Output(self.width)


class Output(IOSig):

    @property
    def is_lvalue(self):
        pass

    @property
    def _iosig_type_prefix(self):
        return 'output'

    def reverse(self):
        return Input(self.width)


class Inout(IOSig):

    @property
    def _iosig_type_prefix(self):
        return 'inout'

    def reverse(self):
        return Inout(self.width)


class Constant(WireSig):
    
    def __init__(self,num):
        self.__width = math.ceil(math.log(num,2))
        self.__value = num

    def string(self):
        return str(self.__value)


class Parameter(SingleVar):

    def __init__(self):
        pass


class GroupVar(Variable):

    def exclude(self,*str_list):
        pass


class IOGroup(GroupVar):

    def __init__(self):
        super(IOGroup,self).__init__()
        self._rvalue = None

    @property
    def io_list(self) -> list:
        return sorted([self.__dict__[k] for k in self.__dict__ if isinstance(self.__dict__[k],IOSig)])

    # += as circuit assignment
    def __iadd__(self,rvalue):
        if not isinstance(rvalue,IOGroup):
            raise ArithmeticError('A IOGroup expect assigned by a IOGroup.')
        # elif self.attribute != rvalue.attribute:
        #     raise ArithmeticError('Left value attribute/Right value attribute mismatch.')
        else:
            for iol,ior in zip(self.io_list,rvalue.io_list):
                if isinstance(iol,Input):
                    ior += iol
                else:
                    iol += ior
            #print('%s get rvalue %s'  %(self,rvalue))
            object.__setattr__(self,'_rvalue',rvalue)
            #self.__rvalue = rvalue
        return self

    def exclude(self,*args):
        result = copy(self)
        for a in args:
            delattr(result,a)
        return result

    def __getitem__(self,*args):
        result = copy(self)
        for a in args:
            delattr(result,a)
        return result


    @property
    def verilog_assignment(self) -> str:
        return reduce(concat,[x.verilog_assignment for x in self.io_list if x.verilog_assignment is not None],[])


    @property
    def verilog_def(self):
        return reduce(concat,[x.verilog_def for x in self.io_list if x.verilog_def is not None],[])


    def reverse(self):
        reverse = IOGroup()
        for i in self.io_list:
            setattr(reverse,i.name,i.reverse())
        return reverse



    #def __setattr__(self,name,value):
    #    if not isinstance():
    #        pass




    # @property
    # def gen_rtl_io(self):
    #     '''生成信号声明的RTL'''
    #     return ["wire %s %s;" %('' if self.data_width==1 else '[%s:0]' % (self.data_width-1),self.name_until(Component))]

#from .Entity    import Entity
#from .Virtual import Virtual
#from .Component import Component
        #self.__name = None
        #if self.__name is None:
        #self.__get_name()

    #@property
    #def name(self):
    #    return self.__name

    #def __get_name(self):
    #    x = inspect.currentframe()
    #    while 1:
    #        for line in inspect.getframeinfo(x)[3]:
    #            m = re.search(r'([a-zA-Z0-9][a-zA-Z0-9_]*)\s*=\s*([a-zA-Z0-9][a-zA-Z0-9_]*)',line)
    #            if m:
    #                self.__name = m.group(1)
    #                return 
    #        x = x.f_back
