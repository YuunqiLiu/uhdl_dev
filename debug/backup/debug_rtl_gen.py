from dsl import *

def print_list(x):
    for item in x:
        print(item)

class AXI4Port(Port):

    def __init__(self):
        Port.__init__(self)
        self.new(clk=Wire(INPUT,2))
        self.new(rst=Wire(INPUT,2))

class SubCom(Component):

    def __init__(self):
        Component.__init__(self,'subcom')
        self.new(clk=Wire(INPUT,1))
        self.new(axii=AXI4Port())
        self.new(axio=AXI4Port().reverse())


def debug_rtl_gen():

    top = Component('top')
    top.new(axii=AXI4Port())
    top.new(axio=AXI4Port().reverse())
    top.new(c1=SubCom())
    top.new(c2=SubCom())
    top.new(clk=Wire(INPUT,1))

    top.link(top.axii.exclude('rst'),top.c1.axii.exclude('rst'))
    #top.link(top.axii.exclude('clk'),top.c1.axii.exclude('rst'))

    top.link(top.c1.axio,top.c2.axii)
    top.link(top.c2.axio,top.axio)
    top.link(top.c1.clk,top.c2.clk,top.clk)

    top.output_path = './output'
    top.generate()
    #top.gen_vfile()
    #top.gen_flist()


    #print(top.vfile.file_list)
    #print_list(top.gen_rtl_def())
    #print(top.c1.gen_rtl_inst())
    #print_list(top.gen_rtl_inst())
    #c = Component('com')
    #p = Port()
    #p.new(clk=Wire(INPUT,1))
    #p.new(rst=Wire(INPUT,1))
    #c.new(axi=AXI4Port())
    #print(c.gen_rtl_inst())
    #print(c.gen_rtl_def())



if __name__ == "__main__":
    debug_rtl_gen()