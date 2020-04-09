
from dsl import *


def debug_port_name():

    c = Component('com')

    p = Port()
    p.new(clk=Wire(INPUT,1))
    p.new(rst=Wire(INPUT,1))

    c.new(axi=p)

    print(c.axi.clk.interface_name)


if __name__ == "__main__":
    debug_port_name()