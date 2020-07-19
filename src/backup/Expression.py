from .Value import *
from .Variable import *

class Expression(Value):

    #@property
    #def is_lvalue(self):
    #    return False

    def __init__(self):
        super().__init__()
        #super(Expression,self).__init__()

    # def check_lvalue(self,op:Value):
    #     if not op.is_lvalue:
    #         raise ArithmeticError('Input %s can not be a Left Value.' % type(op))

    def check_rvalue(self,op:Value):
        if not isinstance(op,Value):
            raise ArithmeticError('Input %s can not be a Right Value.' % type(op))



class If(Expression):
    pass


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
        super().__init__()
        #super(CombineExpression,self).__init__()
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
        super().__init__()
        #super(CutExpression,self).__init__()
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
        super().__init__()
        #super(TwoOpExpression,self).__init__()
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



class SubExpression(TwoOpExpression):

    @property
    def attribute(self) -> int:
        return type(self.opL.attribute)(max(self.opL.attribute.width,self.opR.attribute.width) + 1)

    @property
    def string(self) -> str:
        return '(%s - %s)'  % (self.opL.string ,self.opR.string)
    
    @property
    def rstring(self) -> str:
        return '(%s - %s)'  % (self.opL.rstring ,self.opR.rstring)


class MulExpression(TwoOpExpression):

    @property
    def attribute(self) -> int:
        return type(self.opL.attribute)(self.opL.attribute.width + self.opR.attribute.width)

    @property
    def string(self) -> str:
        return '(%s * %s)'  % (self.opL.string ,self.opR.string)
    
    @property
    def rstring(self) -> str:
        return '(%s * %s)'  % (self.opL.rstring ,self.opR.rstring)


class EqualExpression(TwoOpExpression):

    @property
    def attribute(self) -> int:
        return UInt(1)
        #type(self.opL.attribute)(self.opL.attribute.width + self.opR.attribute.width)

    @property
    def string(self) -> str:
        return '(%s == %s)'  % (self.opL.string ,self.opR.string)
    
    @property
    def rstring(self) -> str:
        return '(%s == %s)'  % (self.opL.rstring ,self.opR.rstring)