from dsl import *
from AXI4Port import AXI4Port


class AXI4PortNoUQR(AXI4Port):

    def __init__(self,
                 DATA_WIDTH   = 64,
                 ADDR_WIDTH   = 32,
                 ID_WIDTH     = 8,
                 BLEN_WIDTH   = 4
                 ):
        AXI4Port.__init__(self, DATA_WIDTH=DATA_WIDTH,
                                ADDR_WIDTH=ADDR_WIDTH,
                                ID_WIDTH=ID_WIDTH,
                                BLEN_WIDTH=BLEN_WIDTH,
                                USER_WIDTH=0,
                                QOS_WIDTH=0,
                                REGION_WIDTH=0)