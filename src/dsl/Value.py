import math
#from .Num import UInt

class Value():

    def __init__(self):
        super(Value,self).__init__()
        self._rvalue = None

    # += as circuit assignment
    def __iadd__(self,rvalue):
        if not isinstance(rvalue,Value):
            raise ArithmeticError('A left value expect assigned by a right value.')
        elif self.attribute != rvalue.attribute:
            raise ArithmeticError('Left value attribute/Right value attribute mismatch.')
        else:
            #print('%s get rvalue %s'  %(self,rvalue))
            object.__setattr__(self,'_rvalue',rvalue)
            #self.__rvalue = rvalue
        return self


    def __getitem__(self,s:slice):
        return CutExpression(self,s.start,s.stop)

    def Cut(self,hbound:int,lbound:int):
        return CutExpression(self,hbound,lbound)

    def __add__(self,rhs):
        return AddExpression(self,rhs)


    @property
    def is_lvalue(self) -> bool:
        return False

    @property
    def string(self):
        raise NotImplementedError

    @property
    def lstring(self):
        raise NotImplementedError

    @property
    def rstring(self):
        raise NotImplementedError


    @property
    def attribute(self):
        raise NotImplementedError

    @property
    def verilog_assignment(self) -> str:
        if not hasattr(self,'_rvalue') or self._rvalue is None:
            return []
        else:
            #if self._rvalue.string is None:
            #    print(self._rvalue)
            return ['assign ' + str(self.lstring) + ' = ' + str(self._rvalue.rstring)]


#class LValue(Value):
#class RValue(Value):
#    def __init__(self):
#        super(RValue,self).__init__()
#        pass

class Expression(Value):

    #@property
    #def is_lvalue(self):
    #    return False

    def __init__(self):
        super(Expression,self).__init__()

    # def check_lvalue(self,op:Value):
    #     if not op.is_lvalue:
    #         raise ArithmeticError('Input %s can not be a Left Value.' % type(op))

    def check_rvalue(self,op:Value):
        if not isinstance(op,Value):
            raise ArithmeticError('Input %s can not be a Right Value.' % type(op))


# class ConstExpression(Expression):
# 
#     def __init__(self,const,width):
#         super(ConstExpression,self).__init__()
#         self.const = const
#         self.width = width
# 
#     @property
#     def attribute(self) -> int:
#         return self.width
# 
#     @property
#     def string(self) -> str:
#         return str(self.const)
# 
# def Const(const,width):
#     return ConstExpression(const,width)


class CombineExpression(Expression):

    def __init__(self,*op_list):
        super(CombineExpression,self).__init__()
        self.op_list = op_list

    @property
    def attribute(self) -> int:
        return type(self.op_list[0].attribute)(sum([op.attribute.width for op in self.op_list]))

    @property
    def string(self) -> str:
        #', '.join([op.string for op in self.op_list])
        return '{%s}' % ', '.join([op.string for op in self.op_list])
    
    @property
    def rstring(self) -> str:
        #', '.join([op.string for op in self.op_list])
        return '{%s}' % ', '.join([op.rstring for op in self.op_list])




def Combine(*op_list):
    return CombineExpression(*op_list)



class CutExpression(Expression):

    def __init__(self,op:Value,hbound:int,lbound:int):
        super(CutExpression,self).__init__()
        if hbound > op.attribute.width or lbound <0:
            raise ArithmeticError('index out of range.')
        self.check_rvalue(op)
        self.op     = op
        self.hbound = hbound
        self.lbound = lbound

    @property
    def attribute(self) -> int:
        return type(self.op.attribute)(self.hbound - self.lbound + 1)

    @property
    def string(self) -> str:
        return self.op.string + '[%s:%s]' % ( self.hbound, self.lbound )
    
    @property
    def rstring(self) -> str:
        return self.op.rstring + '[%s:%s]' % ( self.hbound, self.lbound )


class TwoOpExpression(Expression):

    def __init__(self,opL:Value,opR:Value):
        super(TwoOpExpression,self).__init__()
        self.check_rvalue(opL)
        self.check_rvalue(opR)
        self.opL = opL
        self.opR = opR

    @property
    def attribute(self) -> int:
        raise NotImplementedError

    @property
    def string(self) -> str:
        raise NotImplementedError



class AddExpression(TwoOpExpression):

    @property
    def attribute(self) -> int:
        return type(self.opL.attribute)(max(self.opL.attribute.width,self.opR.attribute.width) + 1)

    @property
    def string(self) -> str:
        return '(%s + %s)'  % (self.opL.string ,self.opR.string)
    
    @property
    def rstring(self) -> str:
        return '(%s + %s)'  % (self.opL.rstring ,self.opR.rstring)



class MinusExpression(TwoOpExpression):

    @property
    def attribute(self) -> int:
        return type(self.opL.attribute)(max(self.opL.attribute.width,self.opR.attribute.width) + 1)

    @property
    def string(self) -> str:
        return '(%s - %s)'  % (self.opL.string ,self.opR.string)
    
    @property
    def rstring(self) -> str:
        return '(%s - %s)'  % (self.opL.rstring ,self.opR.rstring)


class TimesExpression(TwoOpExpression):

    @property
    def attribute(self) -> int:
        return type(self.opL.attribute)(self.opL.attribute.width + self.opR.attribute.width)

    @property
    def string(self) -> str:
        return '(%s * %s)'  % (self.opL.string ,self.opR.string)
    
    @property
    def rstring(self) -> str:
        return '(%s * %s)'  % (self.opL.rstring ,self.opR.rstring)


