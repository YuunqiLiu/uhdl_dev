import os,sys

current_path = os.path.dirname(os.path.abspath(__file__))
sys.path.append(current_path)

# pylint: disable =unused-wildcard-import
from dsl            import *
# pylint: enable  =unused-wildcard-import


class Adder(Component):

    def __init__(self):
        super().__init__()
        self.DATA_WIDTH = Parameter(UInt(32,32))
        self.op1 = Input(UInt(self.DATA_WIDTH))
        self.opr = Input(UInt(self.DATA_WIDTH))