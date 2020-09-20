# pylint: disable =unused-wildcard-import
from uhdl            import *
# pylint: enable  =unused-wildcard-import



class A(Component):

    def __init__(self):
        super().__init__()
        self.din = Input(UInt(1))
        self.dout = Output(UInt(1))

   
a = A()
a.compile()