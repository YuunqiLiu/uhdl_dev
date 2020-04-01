
from dsl.Component  import Component
from dsl.Value      import Combine
from dsl.Variable   import Input,Output,Wire,IOGroup,Parameter,UInt
#from dsl.Num        import UInt,SInt


def link(opl,opr):
    tmp =  opl
    tmp += opr

class sub1(Component):

    def __init__(self,DW=32):
        Component.__init__(self)
        self.DATA_WIDTH = Parameter(UInt(1))
        self.clk        = Input(UInt(1))
        self.rst        = Input(UInt(1))
        #self.rst += self.DATA_WIDTH

class io0(IOGroup):

    def __init__(self):
        IOGroup.__init__(self)
        self.clk    = Input(UInt(1))
        self.rst    = Input(UInt(1))
        #print(self.__dict__)

class test(Component):

    def __init__(self,DW=32):
        Component.__init__(self)
        self.op1    = Input(UInt(DW))
        self.op2    = Input(UInt(DW))
        self.op3    = Input(UInt(DW))
        self.res1   = Output(UInt(DW+1))
        self.res2   = Output(UInt(DW+1))
        self.cut    = Output(UInt(10))
        self.comb   = Output(UInt(DW*2))
        self.const  = Output(UInt(DW*2))

        self.ingroup = io0()
        self.outgroup = io0().reverse()

        self.sub1   = sub1()                      #实例化
        self.tmp    = Wire(UInt(DW))                    #定义Wire

        link(self.outgroup.exclude('rst'),self.ingroup.exclude('rst'))

        # tmp = self.outgroup.exclude('clk')
        # tmp += self.ingroup.exclude('clk')
        # self.outgroup['clk'] += self.ingroup['clk']

        self.tmp    += self.op1                   #赋值
        self.cut    += self.op1[9:0]              #截断
        self.comb   += Combine(self.op1,self.op2) #拼接
        self.const  += UInt(DW*2,64)             #常量
        self.res1   += self.tmp + self.op2        #二元运算
        self.res2   += self.op2 + self.op3

t = test()

#self.cut  += CutExpression(self.op1,9,0)
#t.set_father_to_sub()
 # for l in t.output_list:
 #     print(l)
 #     print(l.name)
 #     print(l.verilog_assignment)
 #     print(l.verilog_def)
 #     print(l.verilog_inst)
 #     print(l.verilog_outer_def)

#print(t.output_list)
#print('23333')

with open('result.v','w') as f:
    #for i in t.verilog_def:
    f.writelines([x+'\n' for x in t.verilog_def])

#print(t.verilog_def)
#print(t.verilog_inst)