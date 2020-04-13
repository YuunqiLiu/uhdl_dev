
from .Value import Value
from .Variable import Input,Output

def assign(opl:Value,opr:Value):
    tmp = opl
    tmp += opr

def smart_assign(op1:Value,op2:Value,outer=False):
    if isinstance(op1,Input) and isinstance(op2,Output):
        if outer:
            tmp = op1
            tmp += op2
        else:
            tmp = op2
            tmp += op1
    elif isinstance(op1,Output) and isinstance (op2,Input):
        if outer:
            tmp = op2
            tmp += op1
        else:
            tmp = op1
            tmp += op2
    else:
        raise Exception()