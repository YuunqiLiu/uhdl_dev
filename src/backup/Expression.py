from .Virtual import Virtual
from .Value import *




class Expression(Virtual,Value):

    def __init__(self):
        super(Expression,self).__init__()

    @property
    def sig_attribute(self):
        raise NotImplementedError

    def check_lvalue(self,op):
        if not isinstance(op,LValue):
            raise ArithmeticError('Input %s can not be a Left Value.' % type(op))

    def check_rvalue(self,op):
        if not isinstance(op,RValue):
            raise ArithmeticError('Input %s can not be a Right Value.' % type(op))




#class Operator(Virtual):
#
#    def __init__(self):
#        Virtual.__init__(self)


#class OpAdd(Operator):

#    def __init__(self):
#        Operator.__init__(self)



class CutExpression(Expression):

    def __init__(self,op,hbound,lbound):
        super.__init__(self)
        self.check_rvalue(op)
        self.op     = op
        self.hbound = hbound
        self.lbound = lbound

    def string(self):
        return self.op.string() + '[%s:%s]' % ( self.hbound, self.lbound )


def OpCut(op,hbound,lbound):
    return CutExpression(op,hbound,lbound)




class AssignmentExpression(Expression):

    def __init__(self,opL,opR):
        super.__init__(self)
        self.check_lvalue(opL)
        self.check_rvalue(opR)
        self.opL = opL
        self.opR = opR

    def string(self):
        return self.opL.string() + ' = ' + self.opR.string()


def OpAssignment(opL,opR):
    return AssignmentExpression(opL,opR)




class AddExpression(Expression,RValue):

    def __init__(self,opL,opR):
        Expression.__init__(self)
        self.check_rvalue(opL)
        self.check_rvalue(opR)
        self.opL = opL
        self.opR = opR

    def string(self):
        return self.opL.string() + ' + ' + self.opR.string()


def OpAdd(opL,opR):
    return AddExpression(opL,opR)




class CombineExpression(Expression,RValue):

    def __init__(self,*op_list):
        Expression.__init__(self)
        for o in op_list:
            self.check_rvalue(o)
        self.op_list = op_list


    def string(self):
        return '{ ' + ', '.join([o.string() for o in self.op_list]) + ' }'


def OpCombine(*op_list):
    return CombineExpression(*op_list)
