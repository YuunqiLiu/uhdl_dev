from dsl import *
from AXI4PortNoUQR import AXI4PortNoUQR


class AXI4PortNoUQR_A32_D64_I8_B4(AXI4PortNoUQR):

    def __init__(self):
        AXI4PortNoUQR.__init__(self,ADDR_WIDTH = 32,
                                    DATA_WIDTH = 64,
                                    ID_WIDTH   = 8,
                                    BLEN_WIDTH = 4)