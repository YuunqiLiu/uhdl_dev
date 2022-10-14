from pysrc.uhdl import *




class Sub1(Component):

    def __init__(self):
        super().__init__()
        self.out1 = Output(UInt(1))
        self.out2 = Output(UInt(1))

        self.in1 = Input(UInt(1))

        self.out1 += self.in1
        self.out2 += self.in1

class Sub2(Component):

    def __init__(self):
        super().__init__()
        self.in1 = In





test = UInt(3,1)

print(test)
print(test.father)