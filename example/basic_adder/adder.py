import os,sys

current_path = os.path.dirname(os.path.abspath(__file__))
sys.path.append(current_path)

# pylint: disable =unused-wildcard-import
from dsl            import *
# pylint: enable  =unused-wildcard-import


class Adder(Component):

    def __init__(self):
        super().__init__()
        self.op1 = Input(UInt(31)) # define op1 as input [30:0] 
        self.op2 = Input(UInt(31))
        self.res = Output(UInt(32)) # define res as output [31:0]
        
        self.res += self.op1 + self.op2 #use += to assign circuit

a = Adder()
a.output_path = os.path.join(current_path,'vsrc')
a.generate_verilog(iteration=True)