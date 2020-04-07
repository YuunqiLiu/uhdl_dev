from dsl import *

class AXI4Port(Port):

    def __init__(self,
                 DATA_WIDTH   = 64,
                 ADDR_WIDTH   = 32,
                 ID_WIDTH     = 8,
                 BLEN_WIDTH   = 4,
                 USER_WIDTH   = 0,
                 QOS_WIDTH    = 0,
                 REGION_WIDTH = 0
                 ):
        Port.__init__(self)
        #Param Record
        self.DATA_WIDTH   = DATA_WIDTH
        self.ADDR_WIDTH   = ADDR_WIDTH
        self.ID_WIDTH     = ID_WIDTH
        self.BLEN_WIDTH   = BLEN_WIDTH
        self.USER_WIDTH   = USER_WIDTH
        self.QOS_WIDTH    = QOS_WIDTH
        self.REGION_WIDTH = REGION_WIDTH

        #AW Channel
        self.new(awaddr   = Wire(OUTPUT,self.ADDR_WIDTH))
        self.new(awlen    = Wire(OUTPUT,self.BLEN_WIDTH))
        self.new(awsize   = Wire(OUTPUT,3))
        self.new(awburst  = Wire(OUTPUT,2))
        self.new(awlock   = Wire(OUTPUT,1))
        self.new(awcache  = Wire(OUTPUT,4))
        self.new(awprot   = Wire(OUTPUT,3))
        self.new(awvalid  = Wire(OUTPUT,1))
        self.new(awready  = Wire(INPUT,1))
        if self.USER_WIDTH > 0:
            self.new(awuser = Wire(OUTPUT,self.USER_WIDTH))
        if self.QOS_WIDTH > 0:
            self.new(awqos = Wire(OUTPUT,self.QOS_WIDTH))
        if self.REGION_WIDTH > 0:
            self.new(awregion = Wire(OUTPUT,self.REGION_WIDTH))

        #W Channel
        self.new(wdata  = Wire(OUTPUT,self.DATA_WIDTH))
        self.new(wstrb  = Wire(OUTPUT,int(self.DATA_WIDTH/8)))
        self.new(wlast  = Wire(OUTPUT,1))
        self.new(wvalid = Wire(OUTPUT,1))
        self.new(wready = Wire(INPUT,1))
        if self.USER_WIDTH > 0:
            self.new(wuser = Wire(OUTPUT,self.USER_WIDTH))

        #B Channel
        self.new(bid    = Wire(INPUT,self.ID_WIDTH))
        self.new(bresp  = Wire(INPUT,2))
        self.new(bvalid = Wire(INPUT,1))
        self.new(bready = Wire(OUTPUT,1))
        if self.USER_WIDTH > 0:
            self.new(buser  = Wire(INPUT,self.USER_WIDTH))

        #AR Channel
        self.new(arid    = Wire(OUTPUT,self.ID_WIDTH))
        self.new(araddr  = Wire(OUTPUT,self.ADDR_WIDTH))
        self.new(arlen   = Wire(OUTPUT,self.BLEN_WIDTH))
        self.new(arsize  = Wire(OUTPUT,3))
        self.new(arburst = Wire(OUTPUT,2))
        self.new(arlock  = Wire(OUTPUT,1))
        self.new(arcache = Wire(OUTPUT,4))
        self.new(arprot  = Wire(OUTPUT,3))
        self.new(arvalid = Wire(OUTPUT,1))
        self.new(arready = Wire(INPUT,1))
        if self.USER_WIDTH > 0:
            self.new(aruser = Wire(INPUT,self.USER_WIDTH))
        if self.REGION_WIDTH > 0:
            self.new(arregion= Wire(OUTPUT,self.REGION_WIDTH)) 
        if self.QOS_WIDTH > 0:
            self.new(arqos = Wire(OUTPUT,self.QOS_WIDTH))

        #R Channel
        self.new(rid    = Wire(INPUT,self.ID_WIDTH))
        self.new(rdata  = Wire(INPUT,self.DATA_WIDTH))
        self.new(rresp  = Wire(INPUT,2))
        self.new(rlast  = Wire(INPUT,1))
        self.new(rvalid = Wire(INPUT,1))
        self.new(rready = Wire(OUTPUT,1))
        if self.USER_WIDTH > 0:
            self.new(ruser = Wire(INPUT,self.USER_WIDTH))