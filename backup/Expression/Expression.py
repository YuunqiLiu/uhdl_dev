from ..Virtual import Virtual



class Expression(Virtual):

    def __init__(self):
        Virtual.__init__(self)



class AddExpression(Expression):

    def __init__(self):
        Expression.__init__(self)



class CombineExpression(Expression):

    def __init__(self,*operation):
        Expression.__init__(self)
        self.operation = operation
