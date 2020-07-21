
from .Value import LValue

class Module():

    @property
    def lvalue_list(self):
        return [self.__dict__[k] for k in self.__dict__ if isinstance(self.__dict__[k],LValue)]



    def __init__(self):
        pass