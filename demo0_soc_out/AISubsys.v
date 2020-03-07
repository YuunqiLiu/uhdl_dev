module AISubsys(
    input  acr_clk,
    input  acr_rst,
    output [31:0] axi_awaddr,
    output [3:0] axi_awlen,
    output [2:0] axi_awsize,
    output [1:0] axi_awburst,
    output  axi_awlock,
    output [3:0] axi_awcache,
    output [2:0] axi_awprot,
    output  axi_awvalid,
    input  axi_awready,
    output [63:0] axi_wdata,
    output [7:0] axi_wstrb,
    output  axi_wlast,
    output  axi_wvalid,
    input  axi_wready,
    input [7:0] axi_bid,
    input [1:0] axi_bresp,
    input  axi_bvalid,
    output  axi_bready,
    output [7:0] axi_arid,
    output [31:0] axi_araddr,
    output [3:0] axi_arlen,
    output [2:0] axi_arsize,
    output [1:0] axi_arburst,
    output  axi_arlock,
    output [3:0] axi_arcache,
    output [2:0] axi_arprot,
    output  axi_arvalid,
    input  axi_arready,
    input [7:0] axi_rid,
    input [63:0] axi_rdata,
    input [1:0] axi_rresp,
    input  axi_rlast,
    input  axi_rvalid,
    output  axi_rready
);

    wire  inst_ai_sram0_acr_clk;
    wire  inst_ai_sram0_acr_rst;
    wire [31:0] inst_ai_sram0_axi_awaddr;
    wire [3:0] inst_ai_sram0_axi_awlen;
    wire [2:0] inst_ai_sram0_axi_awsize;
    wire [1:0] inst_ai_sram0_axi_awburst;
    wire  inst_ai_sram0_axi_awlock;
    wire [3:0] inst_ai_sram0_axi_awcache;
    wire [2:0] inst_ai_sram0_axi_awprot;
    wire  inst_ai_sram0_axi_awvalid;
    wire  inst_ai_sram0_axi_awready;
    wire [63:0] inst_ai_sram0_axi_wdata;
    wire [7:0] inst_ai_sram0_axi_wstrb;
    wire  inst_ai_sram0_axi_wlast;
    wire  inst_ai_sram0_axi_wvalid;
    wire  inst_ai_sram0_axi_wready;
    wire [7:0] inst_ai_sram0_axi_bid;
    wire [1:0] inst_ai_sram0_axi_bresp;
    wire  inst_ai_sram0_axi_bvalid;
    wire  inst_ai_sram0_axi_bready;
    wire [7:0] inst_ai_sram0_axi_arid;
    wire [31:0] inst_ai_sram0_axi_araddr;
    wire [3:0] inst_ai_sram0_axi_arlen;
    wire [2:0] inst_ai_sram0_axi_arsize;
    wire [1:0] inst_ai_sram0_axi_arburst;
    wire  inst_ai_sram0_axi_arlock;
    wire [3:0] inst_ai_sram0_axi_arcache;
    wire [2:0] inst_ai_sram0_axi_arprot;
    wire  inst_ai_sram0_axi_arvalid;
    wire  inst_ai_sram0_axi_arready;
    wire [7:0] inst_ai_sram0_axi_rid;
    wire [63:0] inst_ai_sram0_axi_rdata;
    wire [1:0] inst_ai_sram0_axi_rresp;
    wire  inst_ai_sram0_axi_rlast;
    wire  inst_ai_sram0_axi_rvalid;
    wire  inst_ai_sram0_axi_rready;
    wire  inst_ai_sram1_acr_clk;
    wire  inst_ai_sram1_acr_rst;
    wire [31:0] inst_ai_sram1_axi_awaddr;
    wire [3:0] inst_ai_sram1_axi_awlen;
    wire [2:0] inst_ai_sram1_axi_awsize;
    wire [1:0] inst_ai_sram1_axi_awburst;
    wire  inst_ai_sram1_axi_awlock;
    wire [3:0] inst_ai_sram1_axi_awcache;
    wire [2:0] inst_ai_sram1_axi_awprot;
    wire  inst_ai_sram1_axi_awvalid;
    wire  inst_ai_sram1_axi_awready;
    wire [63:0] inst_ai_sram1_axi_wdata;
    wire [7:0] inst_ai_sram1_axi_wstrb;
    wire  inst_ai_sram1_axi_wlast;
    wire  inst_ai_sram1_axi_wvalid;
    wire  inst_ai_sram1_axi_wready;
    wire [7:0] inst_ai_sram1_axi_bid;
    wire [1:0] inst_ai_sram1_axi_bresp;
    wire  inst_ai_sram1_axi_bvalid;
    wire  inst_ai_sram1_axi_bready;
    wire [7:0] inst_ai_sram1_axi_arid;
    wire [31:0] inst_ai_sram1_axi_araddr;
    wire [3:0] inst_ai_sram1_axi_arlen;
    wire [2:0] inst_ai_sram1_axi_arsize;
    wire [1:0] inst_ai_sram1_axi_arburst;
    wire  inst_ai_sram1_axi_arlock;
    wire [3:0] inst_ai_sram1_axi_arcache;
    wire [2:0] inst_ai_sram1_axi_arprot;
    wire  inst_ai_sram1_axi_arvalid;
    wire  inst_ai_sram1_axi_arready;
    wire [7:0] inst_ai_sram1_axi_rid;
    wire [63:0] inst_ai_sram1_axi_rdata;
    wire [1:0] inst_ai_sram1_axi_rresp;
    wire  inst_ai_sram1_axi_rlast;
    wire  inst_ai_sram1_axi_rvalid;
    wire  inst_ai_sram1_axi_rready;
    wire  inst_ai_cpu_acr_clk;
    wire  inst_ai_cpu_acr_rst;
    wire [31:0] inst_ai_cpu_axi_awaddr;
    wire [3:0] inst_ai_cpu_axi_awlen;
    wire [2:0] inst_ai_cpu_axi_awsize;
    wire [1:0] inst_ai_cpu_axi_awburst;
    wire  inst_ai_cpu_axi_awlock;
    wire [3:0] inst_ai_cpu_axi_awcache;
    wire [2:0] inst_ai_cpu_axi_awprot;
    wire  inst_ai_cpu_axi_awvalid;
    wire  inst_ai_cpu_axi_awready;
    wire [63:0] inst_ai_cpu_axi_wdata;
    wire [7:0] inst_ai_cpu_axi_wstrb;
    wire  inst_ai_cpu_axi_wlast;
    wire  inst_ai_cpu_axi_wvalid;
    wire  inst_ai_cpu_axi_wready;
    wire [7:0] inst_ai_cpu_axi_bid;
    wire [1:0] inst_ai_cpu_axi_bresp;
    wire  inst_ai_cpu_axi_bvalid;
    wire  inst_ai_cpu_axi_bready;
    wire [7:0] inst_ai_cpu_axi_arid;
    wire [31:0] inst_ai_cpu_axi_araddr;
    wire [3:0] inst_ai_cpu_axi_arlen;
    wire [2:0] inst_ai_cpu_axi_arsize;
    wire [1:0] inst_ai_cpu_axi_arburst;
    wire  inst_ai_cpu_axi_arlock;
    wire [3:0] inst_ai_cpu_axi_arcache;
    wire [2:0] inst_ai_cpu_axi_arprot;
    wire  inst_ai_cpu_axi_arvalid;
    wire  inst_ai_cpu_axi_arready;
    wire [7:0] inst_ai_cpu_axi_rid;
    wire [63:0] inst_ai_cpu_axi_rdata;
    wire [1:0] inst_ai_cpu_axi_rresp;
    wire  inst_ai_cpu_axi_rlast;
    wire  inst_ai_cpu_axi_rvalid;
    wire  inst_ai_cpu_axi_rready;
    wire  inst_ai_dma_acr_clk;
    wire  inst_ai_dma_acr_rst;
    wire [31:0] inst_ai_dma_axi_awaddr;
    wire [3:0] inst_ai_dma_axi_awlen;
    wire [2:0] inst_ai_dma_axi_awsize;
    wire [1:0] inst_ai_dma_axi_awburst;
    wire  inst_ai_dma_axi_awlock;
    wire [3:0] inst_ai_dma_axi_awcache;
    wire [2:0] inst_ai_dma_axi_awprot;
    wire  inst_ai_dma_axi_awvalid;
    wire  inst_ai_dma_axi_awready;
    wire [63:0] inst_ai_dma_axi_wdata;
    wire [7:0] inst_ai_dma_axi_wstrb;
    wire  inst_ai_dma_axi_wlast;
    wire  inst_ai_dma_axi_wvalid;
    wire  inst_ai_dma_axi_wready;
    wire [7:0] inst_ai_dma_axi_bid;
    wire [1:0] inst_ai_dma_axi_bresp;
    wire  inst_ai_dma_axi_bvalid;
    wire  inst_ai_dma_axi_bready;
    wire [7:0] inst_ai_dma_axi_arid;
    wire [31:0] inst_ai_dma_axi_araddr;
    wire [3:0] inst_ai_dma_axi_arlen;
    wire [2:0] inst_ai_dma_axi_arsize;
    wire [1:0] inst_ai_dma_axi_arburst;
    wire  inst_ai_dma_axi_arlock;
    wire [3:0] inst_ai_dma_axi_arcache;
    wire [2:0] inst_ai_dma_axi_arprot;
    wire  inst_ai_dma_axi_arvalid;
    wire  inst_ai_dma_axi_arready;
    wire [7:0] inst_ai_dma_axi_rid;
    wire [63:0] inst_ai_dma_axi_rdata;
    wire [1:0] inst_ai_dma_axi_rresp;
    wire  inst_ai_dma_axi_rlast;
    wire  inst_ai_dma_axi_rvalid;
    wire  inst_ai_dma_axi_rready;
    wire  inst_ai_accelerator_acr_clk;
    wire  inst_ai_accelerator_acr_rst;
    wire [31:0] inst_ai_accelerator_axi_awaddr;
    wire [3:0] inst_ai_accelerator_axi_awlen;
    wire [2:0] inst_ai_accelerator_axi_awsize;
    wire [1:0] inst_ai_accelerator_axi_awburst;
    wire  inst_ai_accelerator_axi_awlock;
    wire [3:0] inst_ai_accelerator_axi_awcache;
    wire [2:0] inst_ai_accelerator_axi_awprot;
    wire  inst_ai_accelerator_axi_awvalid;
    wire  inst_ai_accelerator_axi_awready;
    wire [63:0] inst_ai_accelerator_axi_wdata;
    wire [7:0] inst_ai_accelerator_axi_wstrb;
    wire  inst_ai_accelerator_axi_wlast;
    wire  inst_ai_accelerator_axi_wvalid;
    wire  inst_ai_accelerator_axi_wready;
    wire [7:0] inst_ai_accelerator_axi_bid;
    wire [1:0] inst_ai_accelerator_axi_bresp;
    wire  inst_ai_accelerator_axi_bvalid;
    wire  inst_ai_accelerator_axi_bready;
    wire [7:0] inst_ai_accelerator_axi_arid;
    wire [31:0] inst_ai_accelerator_axi_araddr;
    wire [3:0] inst_ai_accelerator_axi_arlen;
    wire [2:0] inst_ai_accelerator_axi_arsize;
    wire [1:0] inst_ai_accelerator_axi_arburst;
    wire  inst_ai_accelerator_axi_arlock;
    wire [3:0] inst_ai_accelerator_axi_arcache;
    wire [2:0] inst_ai_accelerator_axi_arprot;
    wire  inst_ai_accelerator_axi_arvalid;
    wire  inst_ai_accelerator_axi_arready;
    wire [7:0] inst_ai_accelerator_axi_rid;
    wire [63:0] inst_ai_accelerator_axi_rdata;
    wire [1:0] inst_ai_accelerator_axi_rresp;
    wire  inst_ai_accelerator_axi_rlast;
    wire  inst_ai_accelerator_axi_rvalid;
    wire  inst_ai_accelerator_axi_rready;
    wire  inst_ai_corssbar_acr_clk;
    wire  inst_ai_corssbar_acr_rst;
    wire [31:0] inst_ai_corssbar_axii0_awaddr;
    wire [3:0] inst_ai_corssbar_axii0_awlen;
    wire [2:0] inst_ai_corssbar_axii0_awsize;
    wire [1:0] inst_ai_corssbar_axii0_awburst;
    wire  inst_ai_corssbar_axii0_awlock;
    wire [3:0] inst_ai_corssbar_axii0_awcache;
    wire [2:0] inst_ai_corssbar_axii0_awprot;
    wire  inst_ai_corssbar_axii0_awvalid;
    wire  inst_ai_corssbar_axii0_awready;
    wire [63:0] inst_ai_corssbar_axii0_wdata;
    wire [7:0] inst_ai_corssbar_axii0_wstrb;
    wire  inst_ai_corssbar_axii0_wlast;
    wire  inst_ai_corssbar_axii0_wvalid;
    wire  inst_ai_corssbar_axii0_wready;
    wire [7:0] inst_ai_corssbar_axii0_bid;
    wire [1:0] inst_ai_corssbar_axii0_bresp;
    wire  inst_ai_corssbar_axii0_bvalid;
    wire  inst_ai_corssbar_axii0_bready;
    wire [7:0] inst_ai_corssbar_axii0_arid;
    wire [31:0] inst_ai_corssbar_axii0_araddr;
    wire [3:0] inst_ai_corssbar_axii0_arlen;
    wire [2:0] inst_ai_corssbar_axii0_arsize;
    wire [1:0] inst_ai_corssbar_axii0_arburst;
    wire  inst_ai_corssbar_axii0_arlock;
    wire [3:0] inst_ai_corssbar_axii0_arcache;
    wire [2:0] inst_ai_corssbar_axii0_arprot;
    wire  inst_ai_corssbar_axii0_arvalid;
    wire  inst_ai_corssbar_axii0_arready;
    wire [7:0] inst_ai_corssbar_axii0_rid;
    wire [63:0] inst_ai_corssbar_axii0_rdata;
    wire [1:0] inst_ai_corssbar_axii0_rresp;
    wire  inst_ai_corssbar_axii0_rlast;
    wire  inst_ai_corssbar_axii0_rvalid;
    wire  inst_ai_corssbar_axii0_rready;
    wire [31:0] inst_ai_corssbar_axii1_awaddr;
    wire [3:0] inst_ai_corssbar_axii1_awlen;
    wire [2:0] inst_ai_corssbar_axii1_awsize;
    wire [1:0] inst_ai_corssbar_axii1_awburst;
    wire  inst_ai_corssbar_axii1_awlock;
    wire [3:0] inst_ai_corssbar_axii1_awcache;
    wire [2:0] inst_ai_corssbar_axii1_awprot;
    wire  inst_ai_corssbar_axii1_awvalid;
    wire  inst_ai_corssbar_axii1_awready;
    wire [63:0] inst_ai_corssbar_axii1_wdata;
    wire [7:0] inst_ai_corssbar_axii1_wstrb;
    wire  inst_ai_corssbar_axii1_wlast;
    wire  inst_ai_corssbar_axii1_wvalid;
    wire  inst_ai_corssbar_axii1_wready;
    wire [7:0] inst_ai_corssbar_axii1_bid;
    wire [1:0] inst_ai_corssbar_axii1_bresp;
    wire  inst_ai_corssbar_axii1_bvalid;
    wire  inst_ai_corssbar_axii1_bready;
    wire [7:0] inst_ai_corssbar_axii1_arid;
    wire [31:0] inst_ai_corssbar_axii1_araddr;
    wire [3:0] inst_ai_corssbar_axii1_arlen;
    wire [2:0] inst_ai_corssbar_axii1_arsize;
    wire [1:0] inst_ai_corssbar_axii1_arburst;
    wire  inst_ai_corssbar_axii1_arlock;
    wire [3:0] inst_ai_corssbar_axii1_arcache;
    wire [2:0] inst_ai_corssbar_axii1_arprot;
    wire  inst_ai_corssbar_axii1_arvalid;
    wire  inst_ai_corssbar_axii1_arready;
    wire [7:0] inst_ai_corssbar_axii1_rid;
    wire [63:0] inst_ai_corssbar_axii1_rdata;
    wire [1:0] inst_ai_corssbar_axii1_rresp;
    wire  inst_ai_corssbar_axii1_rlast;
    wire  inst_ai_corssbar_axii1_rvalid;
    wire  inst_ai_corssbar_axii1_rready;
    wire [31:0] inst_ai_corssbar_axii2_awaddr;
    wire [3:0] inst_ai_corssbar_axii2_awlen;
    wire [2:0] inst_ai_corssbar_axii2_awsize;
    wire [1:0] inst_ai_corssbar_axii2_awburst;
    wire  inst_ai_corssbar_axii2_awlock;
    wire [3:0] inst_ai_corssbar_axii2_awcache;
    wire [2:0] inst_ai_corssbar_axii2_awprot;
    wire  inst_ai_corssbar_axii2_awvalid;
    wire  inst_ai_corssbar_axii2_awready;
    wire [63:0] inst_ai_corssbar_axii2_wdata;
    wire [7:0] inst_ai_corssbar_axii2_wstrb;
    wire  inst_ai_corssbar_axii2_wlast;
    wire  inst_ai_corssbar_axii2_wvalid;
    wire  inst_ai_corssbar_axii2_wready;
    wire [7:0] inst_ai_corssbar_axii2_bid;
    wire [1:0] inst_ai_corssbar_axii2_bresp;
    wire  inst_ai_corssbar_axii2_bvalid;
    wire  inst_ai_corssbar_axii2_bready;
    wire [7:0] inst_ai_corssbar_axii2_arid;
    wire [31:0] inst_ai_corssbar_axii2_araddr;
    wire [3:0] inst_ai_corssbar_axii2_arlen;
    wire [2:0] inst_ai_corssbar_axii2_arsize;
    wire [1:0] inst_ai_corssbar_axii2_arburst;
    wire  inst_ai_corssbar_axii2_arlock;
    wire [3:0] inst_ai_corssbar_axii2_arcache;
    wire [2:0] inst_ai_corssbar_axii2_arprot;
    wire  inst_ai_corssbar_axii2_arvalid;
    wire  inst_ai_corssbar_axii2_arready;
    wire [7:0] inst_ai_corssbar_axii2_rid;
    wire [63:0] inst_ai_corssbar_axii2_rdata;
    wire [1:0] inst_ai_corssbar_axii2_rresp;
    wire  inst_ai_corssbar_axii2_rlast;
    wire  inst_ai_corssbar_axii2_rvalid;
    wire  inst_ai_corssbar_axii2_rready;
    wire [31:0] inst_ai_corssbar_axio0_awaddr;
    wire [3:0] inst_ai_corssbar_axio0_awlen;
    wire [2:0] inst_ai_corssbar_axio0_awsize;
    wire [1:0] inst_ai_corssbar_axio0_awburst;
    wire  inst_ai_corssbar_axio0_awlock;
    wire [3:0] inst_ai_corssbar_axio0_awcache;
    wire [2:0] inst_ai_corssbar_axio0_awprot;
    wire  inst_ai_corssbar_axio0_awvalid;
    wire  inst_ai_corssbar_axio0_awready;
    wire [63:0] inst_ai_corssbar_axio0_wdata;
    wire [7:0] inst_ai_corssbar_axio0_wstrb;
    wire  inst_ai_corssbar_axio0_wlast;
    wire  inst_ai_corssbar_axio0_wvalid;
    wire  inst_ai_corssbar_axio0_wready;
    wire [7:0] inst_ai_corssbar_axio0_bid;
    wire [1:0] inst_ai_corssbar_axio0_bresp;
    wire  inst_ai_corssbar_axio0_bvalid;
    wire  inst_ai_corssbar_axio0_bready;
    wire [7:0] inst_ai_corssbar_axio0_arid;
    wire [31:0] inst_ai_corssbar_axio0_araddr;
    wire [3:0] inst_ai_corssbar_axio0_arlen;
    wire [2:0] inst_ai_corssbar_axio0_arsize;
    wire [1:0] inst_ai_corssbar_axio0_arburst;
    wire  inst_ai_corssbar_axio0_arlock;
    wire [3:0] inst_ai_corssbar_axio0_arcache;
    wire [2:0] inst_ai_corssbar_axio0_arprot;
    wire  inst_ai_corssbar_axio0_arvalid;
    wire  inst_ai_corssbar_axio0_arready;
    wire [7:0] inst_ai_corssbar_axio0_rid;
    wire [63:0] inst_ai_corssbar_axio0_rdata;
    wire [1:0] inst_ai_corssbar_axio0_rresp;
    wire  inst_ai_corssbar_axio0_rlast;
    wire  inst_ai_corssbar_axio0_rvalid;
    wire  inst_ai_corssbar_axio0_rready;
    wire [31:0] inst_ai_corssbar_axio1_awaddr;
    wire [3:0] inst_ai_corssbar_axio1_awlen;
    wire [2:0] inst_ai_corssbar_axio1_awsize;
    wire [1:0] inst_ai_corssbar_axio1_awburst;
    wire  inst_ai_corssbar_axio1_awlock;
    wire [3:0] inst_ai_corssbar_axio1_awcache;
    wire [2:0] inst_ai_corssbar_axio1_awprot;
    wire  inst_ai_corssbar_axio1_awvalid;
    wire  inst_ai_corssbar_axio1_awready;
    wire [63:0] inst_ai_corssbar_axio1_wdata;
    wire [7:0] inst_ai_corssbar_axio1_wstrb;
    wire  inst_ai_corssbar_axio1_wlast;
    wire  inst_ai_corssbar_axio1_wvalid;
    wire  inst_ai_corssbar_axio1_wready;
    wire [7:0] inst_ai_corssbar_axio1_bid;
    wire [1:0] inst_ai_corssbar_axio1_bresp;
    wire  inst_ai_corssbar_axio1_bvalid;
    wire  inst_ai_corssbar_axio1_bready;
    wire [7:0] inst_ai_corssbar_axio1_arid;
    wire [31:0] inst_ai_corssbar_axio1_araddr;
    wire [3:0] inst_ai_corssbar_axio1_arlen;
    wire [2:0] inst_ai_corssbar_axio1_arsize;
    wire [1:0] inst_ai_corssbar_axio1_arburst;
    wire  inst_ai_corssbar_axio1_arlock;
    wire [3:0] inst_ai_corssbar_axio1_arcache;
    wire [2:0] inst_ai_corssbar_axio1_arprot;
    wire  inst_ai_corssbar_axio1_arvalid;
    wire  inst_ai_corssbar_axio1_arready;
    wire [7:0] inst_ai_corssbar_axio1_rid;
    wire [63:0] inst_ai_corssbar_axio1_rdata;
    wire [1:0] inst_ai_corssbar_axio1_rresp;
    wire  inst_ai_corssbar_axio1_rlast;
    wire  inst_ai_corssbar_axio1_rvalid;
    wire  inst_ai_corssbar_axio1_rready;
    wire [31:0] inst_ai_corssbar_axio2_awaddr;
    wire [3:0] inst_ai_corssbar_axio2_awlen;
    wire [2:0] inst_ai_corssbar_axio2_awsize;
    wire [1:0] inst_ai_corssbar_axio2_awburst;
    wire  inst_ai_corssbar_axio2_awlock;
    wire [3:0] inst_ai_corssbar_axio2_awcache;
    wire [2:0] inst_ai_corssbar_axio2_awprot;
    wire  inst_ai_corssbar_axio2_awvalid;
    wire  inst_ai_corssbar_axio2_awready;
    wire [63:0] inst_ai_corssbar_axio2_wdata;
    wire [7:0] inst_ai_corssbar_axio2_wstrb;
    wire  inst_ai_corssbar_axio2_wlast;
    wire  inst_ai_corssbar_axio2_wvalid;
    wire  inst_ai_corssbar_axio2_wready;
    wire [7:0] inst_ai_corssbar_axio2_bid;
    wire [1:0] inst_ai_corssbar_axio2_bresp;
    wire  inst_ai_corssbar_axio2_bvalid;
    wire  inst_ai_corssbar_axio2_bready;
    wire [7:0] inst_ai_corssbar_axio2_arid;
    wire [31:0] inst_ai_corssbar_axio2_araddr;
    wire [3:0] inst_ai_corssbar_axio2_arlen;
    wire [2:0] inst_ai_corssbar_axio2_arsize;
    wire [1:0] inst_ai_corssbar_axio2_arburst;
    wire  inst_ai_corssbar_axio2_arlock;
    wire [3:0] inst_ai_corssbar_axio2_arcache;
    wire [2:0] inst_ai_corssbar_axio2_arprot;
    wire  inst_ai_corssbar_axio2_arvalid;
    wire  inst_ai_corssbar_axio2_arready;
    wire [7:0] inst_ai_corssbar_axio2_rid;
    wire [63:0] inst_ai_corssbar_axio2_rdata;
    wire [1:0] inst_ai_corssbar_axio2_rresp;
    wire  inst_ai_corssbar_axio2_rlast;
    wire  inst_ai_corssbar_axio2_rvalid;
    wire  inst_ai_corssbar_axio2_rready;

    assign axi_araddr = inst_ai_corssbar_axio0_araddr;
    assign axi_arburst = inst_ai_corssbar_axio0_arburst;
    assign axi_arcache = inst_ai_corssbar_axio0_arcache;
    assign axi_arid = inst_ai_corssbar_axio0_arid;
    assign axi_arlen = inst_ai_corssbar_axio0_arlen;
    assign axi_arlock = inst_ai_corssbar_axio0_arlock;
    assign axi_arprot = inst_ai_corssbar_axio0_arprot;
    assign inst_ai_corssbar_axio0_arready = axi_arready;
    assign axi_arsize = inst_ai_corssbar_axio0_arsize;
    assign axi_arvalid = inst_ai_corssbar_axio0_arvalid;
    assign axi_awaddr = inst_ai_corssbar_axio0_awaddr;
    assign axi_awburst = inst_ai_corssbar_axio0_awburst;
    assign axi_awcache = inst_ai_corssbar_axio0_awcache;
    assign axi_awlen = inst_ai_corssbar_axio0_awlen;
    assign axi_awlock = inst_ai_corssbar_axio0_awlock;
    assign axi_awprot = inst_ai_corssbar_axio0_awprot;
    assign inst_ai_corssbar_axio0_awready = axi_awready;
    assign axi_awsize = inst_ai_corssbar_axio0_awsize;
    assign axi_awvalid = inst_ai_corssbar_axio0_awvalid;
    assign inst_ai_corssbar_axio0_bid = axi_bid;
    assign axi_bready = inst_ai_corssbar_axio0_bready;
    assign inst_ai_corssbar_axio0_bresp = axi_bresp;
    assign inst_ai_corssbar_axio0_bvalid = axi_bvalid;
    assign inst_ai_corssbar_axio0_rdata = axi_rdata;
    assign inst_ai_corssbar_axio0_rid = axi_rid;
    assign inst_ai_corssbar_axio0_rlast = axi_rlast;
    assign axi_rready = inst_ai_corssbar_axio0_rready;
    assign inst_ai_corssbar_axio0_rresp = axi_rresp;
    assign inst_ai_corssbar_axio0_rvalid = axi_rvalid;
    assign axi_wdata = inst_ai_corssbar_axio0_wdata;
    assign axi_wlast = inst_ai_corssbar_axio0_wlast;
    assign inst_ai_corssbar_axio0_wready = axi_wready;
    assign axi_wstrb = inst_ai_corssbar_axio0_wstrb;
    assign axi_wvalid = inst_ai_corssbar_axio0_wvalid;
    assign inst_ai_sram0_axi_araddr = inst_ai_corssbar_axio1_araddr;
    assign inst_ai_sram0_axi_arburst = inst_ai_corssbar_axio1_arburst;
    assign inst_ai_sram0_axi_arcache = inst_ai_corssbar_axio1_arcache;
    assign inst_ai_sram0_axi_arid = inst_ai_corssbar_axio1_arid;
    assign inst_ai_sram0_axi_arlen = inst_ai_corssbar_axio1_arlen;
    assign inst_ai_sram0_axi_arlock = inst_ai_corssbar_axio1_arlock;
    assign inst_ai_sram0_axi_arprot = inst_ai_corssbar_axio1_arprot;
    assign inst_ai_corssbar_axio1_arready = inst_ai_sram0_axi_arready;
    assign inst_ai_sram0_axi_arsize = inst_ai_corssbar_axio1_arsize;
    assign inst_ai_sram0_axi_arvalid = inst_ai_corssbar_axio1_arvalid;
    assign inst_ai_sram0_axi_awaddr = inst_ai_corssbar_axio1_awaddr;
    assign inst_ai_sram0_axi_awburst = inst_ai_corssbar_axio1_awburst;
    assign inst_ai_sram0_axi_awcache = inst_ai_corssbar_axio1_awcache;
    assign inst_ai_sram0_axi_awlen = inst_ai_corssbar_axio1_awlen;
    assign inst_ai_sram0_axi_awlock = inst_ai_corssbar_axio1_awlock;
    assign inst_ai_sram0_axi_awprot = inst_ai_corssbar_axio1_awprot;
    assign inst_ai_corssbar_axio1_awready = inst_ai_sram0_axi_awready;
    assign inst_ai_sram0_axi_awsize = inst_ai_corssbar_axio1_awsize;
    assign inst_ai_sram0_axi_awvalid = inst_ai_corssbar_axio1_awvalid;
    assign inst_ai_corssbar_axio1_bid = inst_ai_sram0_axi_bid;
    assign inst_ai_sram0_axi_bready = inst_ai_corssbar_axio1_bready;
    assign inst_ai_corssbar_axio1_bresp = inst_ai_sram0_axi_bresp;
    assign inst_ai_corssbar_axio1_bvalid = inst_ai_sram0_axi_bvalid;
    assign inst_ai_corssbar_axio1_rdata = inst_ai_sram0_axi_rdata;
    assign inst_ai_corssbar_axio1_rid = inst_ai_sram0_axi_rid;
    assign inst_ai_corssbar_axio1_rlast = inst_ai_sram0_axi_rlast;
    assign inst_ai_sram0_axi_rready = inst_ai_corssbar_axio1_rready;
    assign inst_ai_corssbar_axio1_rresp = inst_ai_sram0_axi_rresp;
    assign inst_ai_corssbar_axio1_rvalid = inst_ai_sram0_axi_rvalid;
    assign inst_ai_sram0_axi_wdata = inst_ai_corssbar_axio1_wdata;
    assign inst_ai_sram0_axi_wlast = inst_ai_corssbar_axio1_wlast;
    assign inst_ai_corssbar_axio1_wready = inst_ai_sram0_axi_wready;
    assign inst_ai_sram0_axi_wstrb = inst_ai_corssbar_axio1_wstrb;
    assign inst_ai_sram0_axi_wvalid = inst_ai_corssbar_axio1_wvalid;
    assign inst_ai_sram1_axi_araddr = inst_ai_corssbar_axio2_araddr;
    assign inst_ai_sram1_axi_arburst = inst_ai_corssbar_axio2_arburst;
    assign inst_ai_sram1_axi_arcache = inst_ai_corssbar_axio2_arcache;
    assign inst_ai_sram1_axi_arid = inst_ai_corssbar_axio2_arid;
    assign inst_ai_sram1_axi_arlen = inst_ai_corssbar_axio2_arlen;
    assign inst_ai_sram1_axi_arlock = inst_ai_corssbar_axio2_arlock;
    assign inst_ai_sram1_axi_arprot = inst_ai_corssbar_axio2_arprot;
    assign inst_ai_corssbar_axio2_arready = inst_ai_sram1_axi_arready;
    assign inst_ai_sram1_axi_arsize = inst_ai_corssbar_axio2_arsize;
    assign inst_ai_sram1_axi_arvalid = inst_ai_corssbar_axio2_arvalid;
    assign inst_ai_sram1_axi_awaddr = inst_ai_corssbar_axio2_awaddr;
    assign inst_ai_sram1_axi_awburst = inst_ai_corssbar_axio2_awburst;
    assign inst_ai_sram1_axi_awcache = inst_ai_corssbar_axio2_awcache;
    assign inst_ai_sram1_axi_awlen = inst_ai_corssbar_axio2_awlen;
    assign inst_ai_sram1_axi_awlock = inst_ai_corssbar_axio2_awlock;
    assign inst_ai_sram1_axi_awprot = inst_ai_corssbar_axio2_awprot;
    assign inst_ai_corssbar_axio2_awready = inst_ai_sram1_axi_awready;
    assign inst_ai_sram1_axi_awsize = inst_ai_corssbar_axio2_awsize;
    assign inst_ai_sram1_axi_awvalid = inst_ai_corssbar_axio2_awvalid;
    assign inst_ai_corssbar_axio2_bid = inst_ai_sram1_axi_bid;
    assign inst_ai_sram1_axi_bready = inst_ai_corssbar_axio2_bready;
    assign inst_ai_corssbar_axio2_bresp = inst_ai_sram1_axi_bresp;
    assign inst_ai_corssbar_axio2_bvalid = inst_ai_sram1_axi_bvalid;
    assign inst_ai_corssbar_axio2_rdata = inst_ai_sram1_axi_rdata;
    assign inst_ai_corssbar_axio2_rid = inst_ai_sram1_axi_rid;
    assign inst_ai_corssbar_axio2_rlast = inst_ai_sram1_axi_rlast;
    assign inst_ai_sram1_axi_rready = inst_ai_corssbar_axio2_rready;
    assign inst_ai_corssbar_axio2_rresp = inst_ai_sram1_axi_rresp;
    assign inst_ai_corssbar_axio2_rvalid = inst_ai_sram1_axi_rvalid;
    assign inst_ai_sram1_axi_wdata = inst_ai_corssbar_axio2_wdata;
    assign inst_ai_sram1_axi_wlast = inst_ai_corssbar_axio2_wlast;
    assign inst_ai_corssbar_axio2_wready = inst_ai_sram1_axi_wready;
    assign inst_ai_sram1_axi_wstrb = inst_ai_corssbar_axio2_wstrb;
    assign inst_ai_sram1_axi_wvalid = inst_ai_corssbar_axio2_wvalid;
    assign inst_ai_corssbar_axii0_araddr = inst_ai_cpu_axi_araddr;
    assign inst_ai_corssbar_axii0_arburst = inst_ai_cpu_axi_arburst;
    assign inst_ai_corssbar_axii0_arcache = inst_ai_cpu_axi_arcache;
    assign inst_ai_corssbar_axii0_arid = inst_ai_cpu_axi_arid;
    assign inst_ai_corssbar_axii0_arlen = inst_ai_cpu_axi_arlen;
    assign inst_ai_corssbar_axii0_arlock = inst_ai_cpu_axi_arlock;
    assign inst_ai_corssbar_axii0_arprot = inst_ai_cpu_axi_arprot;
    assign inst_ai_cpu_axi_arready = inst_ai_corssbar_axii0_arready;
    assign inst_ai_corssbar_axii0_arsize = inst_ai_cpu_axi_arsize;
    assign inst_ai_corssbar_axii0_arvalid = inst_ai_cpu_axi_arvalid;
    assign inst_ai_corssbar_axii0_awaddr = inst_ai_cpu_axi_awaddr;
    assign inst_ai_corssbar_axii0_awburst = inst_ai_cpu_axi_awburst;
    assign inst_ai_corssbar_axii0_awcache = inst_ai_cpu_axi_awcache;
    assign inst_ai_corssbar_axii0_awlen = inst_ai_cpu_axi_awlen;
    assign inst_ai_corssbar_axii0_awlock = inst_ai_cpu_axi_awlock;
    assign inst_ai_corssbar_axii0_awprot = inst_ai_cpu_axi_awprot;
    assign inst_ai_cpu_axi_awready = inst_ai_corssbar_axii0_awready;
    assign inst_ai_corssbar_axii0_awsize = inst_ai_cpu_axi_awsize;
    assign inst_ai_corssbar_axii0_awvalid = inst_ai_cpu_axi_awvalid;
    assign inst_ai_cpu_axi_bid = inst_ai_corssbar_axii0_bid;
    assign inst_ai_corssbar_axii0_bready = inst_ai_cpu_axi_bready;
    assign inst_ai_cpu_axi_bresp = inst_ai_corssbar_axii0_bresp;
    assign inst_ai_cpu_axi_bvalid = inst_ai_corssbar_axii0_bvalid;
    assign inst_ai_cpu_axi_rdata = inst_ai_corssbar_axii0_rdata;
    assign inst_ai_cpu_axi_rid = inst_ai_corssbar_axii0_rid;
    assign inst_ai_cpu_axi_rlast = inst_ai_corssbar_axii0_rlast;
    assign inst_ai_corssbar_axii0_rready = inst_ai_cpu_axi_rready;
    assign inst_ai_cpu_axi_rresp = inst_ai_corssbar_axii0_rresp;
    assign inst_ai_cpu_axi_rvalid = inst_ai_corssbar_axii0_rvalid;
    assign inst_ai_corssbar_axii0_wdata = inst_ai_cpu_axi_wdata;
    assign inst_ai_corssbar_axii0_wlast = inst_ai_cpu_axi_wlast;
    assign inst_ai_cpu_axi_wready = inst_ai_corssbar_axii0_wready;
    assign inst_ai_corssbar_axii0_wstrb = inst_ai_cpu_axi_wstrb;
    assign inst_ai_corssbar_axii0_wvalid = inst_ai_cpu_axi_wvalid;
    assign inst_ai_corssbar_axii1_araddr = inst_ai_dma_axi_araddr;
    assign inst_ai_corssbar_axii1_arburst = inst_ai_dma_axi_arburst;
    assign inst_ai_corssbar_axii1_arcache = inst_ai_dma_axi_arcache;
    assign inst_ai_corssbar_axii1_arid = inst_ai_dma_axi_arid;
    assign inst_ai_corssbar_axii1_arlen = inst_ai_dma_axi_arlen;
    assign inst_ai_corssbar_axii1_arlock = inst_ai_dma_axi_arlock;
    assign inst_ai_corssbar_axii1_arprot = inst_ai_dma_axi_arprot;
    assign inst_ai_dma_axi_arready = inst_ai_corssbar_axii1_arready;
    assign inst_ai_corssbar_axii1_arsize = inst_ai_dma_axi_arsize;
    assign inst_ai_corssbar_axii1_arvalid = inst_ai_dma_axi_arvalid;
    assign inst_ai_corssbar_axii1_awaddr = inst_ai_dma_axi_awaddr;
    assign inst_ai_corssbar_axii1_awburst = inst_ai_dma_axi_awburst;
    assign inst_ai_corssbar_axii1_awcache = inst_ai_dma_axi_awcache;
    assign inst_ai_corssbar_axii1_awlen = inst_ai_dma_axi_awlen;
    assign inst_ai_corssbar_axii1_awlock = inst_ai_dma_axi_awlock;
    assign inst_ai_corssbar_axii1_awprot = inst_ai_dma_axi_awprot;
    assign inst_ai_dma_axi_awready = inst_ai_corssbar_axii1_awready;
    assign inst_ai_corssbar_axii1_awsize = inst_ai_dma_axi_awsize;
    assign inst_ai_corssbar_axii1_awvalid = inst_ai_dma_axi_awvalid;
    assign inst_ai_dma_axi_bid = inst_ai_corssbar_axii1_bid;
    assign inst_ai_corssbar_axii1_bready = inst_ai_dma_axi_bready;
    assign inst_ai_dma_axi_bresp = inst_ai_corssbar_axii1_bresp;
    assign inst_ai_dma_axi_bvalid = inst_ai_corssbar_axii1_bvalid;
    assign inst_ai_dma_axi_rdata = inst_ai_corssbar_axii1_rdata;
    assign inst_ai_dma_axi_rid = inst_ai_corssbar_axii1_rid;
    assign inst_ai_dma_axi_rlast = inst_ai_corssbar_axii1_rlast;
    assign inst_ai_corssbar_axii1_rready = inst_ai_dma_axi_rready;
    assign inst_ai_dma_axi_rresp = inst_ai_corssbar_axii1_rresp;
    assign inst_ai_dma_axi_rvalid = inst_ai_corssbar_axii1_rvalid;
    assign inst_ai_corssbar_axii1_wdata = inst_ai_dma_axi_wdata;
    assign inst_ai_corssbar_axii1_wlast = inst_ai_dma_axi_wlast;
    assign inst_ai_dma_axi_wready = inst_ai_corssbar_axii1_wready;
    assign inst_ai_corssbar_axii1_wstrb = inst_ai_dma_axi_wstrb;
    assign inst_ai_corssbar_axii1_wvalid = inst_ai_dma_axi_wvalid;
    assign inst_ai_corssbar_axii2_araddr = inst_ai_accelerator_axi_araddr;
    assign inst_ai_corssbar_axii2_arburst = inst_ai_accelerator_axi_arburst;
    assign inst_ai_corssbar_axii2_arcache = inst_ai_accelerator_axi_arcache;
    assign inst_ai_corssbar_axii2_arid = inst_ai_accelerator_axi_arid;
    assign inst_ai_corssbar_axii2_arlen = inst_ai_accelerator_axi_arlen;
    assign inst_ai_corssbar_axii2_arlock = inst_ai_accelerator_axi_arlock;
    assign inst_ai_corssbar_axii2_arprot = inst_ai_accelerator_axi_arprot;
    assign inst_ai_accelerator_axi_arready = inst_ai_corssbar_axii2_arready;
    assign inst_ai_corssbar_axii2_arsize = inst_ai_accelerator_axi_arsize;
    assign inst_ai_corssbar_axii2_arvalid = inst_ai_accelerator_axi_arvalid;
    assign inst_ai_corssbar_axii2_awaddr = inst_ai_accelerator_axi_awaddr;
    assign inst_ai_corssbar_axii2_awburst = inst_ai_accelerator_axi_awburst;
    assign inst_ai_corssbar_axii2_awcache = inst_ai_accelerator_axi_awcache;
    assign inst_ai_corssbar_axii2_awlen = inst_ai_accelerator_axi_awlen;
    assign inst_ai_corssbar_axii2_awlock = inst_ai_accelerator_axi_awlock;
    assign inst_ai_corssbar_axii2_awprot = inst_ai_accelerator_axi_awprot;
    assign inst_ai_accelerator_axi_awready = inst_ai_corssbar_axii2_awready;
    assign inst_ai_corssbar_axii2_awsize = inst_ai_accelerator_axi_awsize;
    assign inst_ai_corssbar_axii2_awvalid = inst_ai_accelerator_axi_awvalid;
    assign inst_ai_accelerator_axi_bid = inst_ai_corssbar_axii2_bid;
    assign inst_ai_corssbar_axii2_bready = inst_ai_accelerator_axi_bready;
    assign inst_ai_accelerator_axi_bresp = inst_ai_corssbar_axii2_bresp;
    assign inst_ai_accelerator_axi_bvalid = inst_ai_corssbar_axii2_bvalid;
    assign inst_ai_accelerator_axi_rdata = inst_ai_corssbar_axii2_rdata;
    assign inst_ai_accelerator_axi_rid = inst_ai_corssbar_axii2_rid;
    assign inst_ai_accelerator_axi_rlast = inst_ai_corssbar_axii2_rlast;
    assign inst_ai_corssbar_axii2_rready = inst_ai_accelerator_axi_rready;
    assign inst_ai_accelerator_axi_rresp = inst_ai_corssbar_axii2_rresp;
    assign inst_ai_accelerator_axi_rvalid = inst_ai_corssbar_axii2_rvalid;
    assign inst_ai_corssbar_axii2_wdata = inst_ai_accelerator_axi_wdata;
    assign inst_ai_corssbar_axii2_wlast = inst_ai_accelerator_axi_wlast;
    assign inst_ai_accelerator_axi_wready = inst_ai_corssbar_axii2_wready;
    assign inst_ai_corssbar_axii2_wstrb = inst_ai_accelerator_axi_wstrb;
    assign inst_ai_corssbar_axii2_wvalid = inst_ai_accelerator_axi_wvalid;

    AISRAM inst_ai_sram0 (
        .acr_clk(inst_ai_sram0_acr_clk),
        .acr_rst(inst_ai_sram0_acr_rst),
        .axi_awaddr(inst_ai_sram0_axi_awaddr),
        .axi_awlen(inst_ai_sram0_axi_awlen),
        .axi_awsize(inst_ai_sram0_axi_awsize),
        .axi_awburst(inst_ai_sram0_axi_awburst),
        .axi_awlock(inst_ai_sram0_axi_awlock),
        .axi_awcache(inst_ai_sram0_axi_awcache),
        .axi_awprot(inst_ai_sram0_axi_awprot),
        .axi_awvalid(inst_ai_sram0_axi_awvalid),
        .axi_awready(inst_ai_sram0_axi_awready),
        .axi_wdata(inst_ai_sram0_axi_wdata),
        .axi_wstrb(inst_ai_sram0_axi_wstrb),
        .axi_wlast(inst_ai_sram0_axi_wlast),
        .axi_wvalid(inst_ai_sram0_axi_wvalid),
        .axi_wready(inst_ai_sram0_axi_wready),
        .axi_bid(inst_ai_sram0_axi_bid),
        .axi_bresp(inst_ai_sram0_axi_bresp),
        .axi_bvalid(inst_ai_sram0_axi_bvalid),
        .axi_bready(inst_ai_sram0_axi_bready),
        .axi_arid(inst_ai_sram0_axi_arid),
        .axi_araddr(inst_ai_sram0_axi_araddr),
        .axi_arlen(inst_ai_sram0_axi_arlen),
        .axi_arsize(inst_ai_sram0_axi_arsize),
        .axi_arburst(inst_ai_sram0_axi_arburst),
        .axi_arlock(inst_ai_sram0_axi_arlock),
        .axi_arcache(inst_ai_sram0_axi_arcache),
        .axi_arprot(inst_ai_sram0_axi_arprot),
        .axi_arvalid(inst_ai_sram0_axi_arvalid),
        .axi_arready(inst_ai_sram0_axi_arready),
        .axi_rid(inst_ai_sram0_axi_rid),
        .axi_rdata(inst_ai_sram0_axi_rdata),
        .axi_rresp(inst_ai_sram0_axi_rresp),
        .axi_rlast(inst_ai_sram0_axi_rlast),
        .axi_rvalid(inst_ai_sram0_axi_rvalid),
        .axi_rready(inst_ai_sram0_axi_rready));
    
    AISRAM inst_ai_sram1 (
        .acr_clk(inst_ai_sram1_acr_clk),
        .acr_rst(inst_ai_sram1_acr_rst),
        .axi_awaddr(inst_ai_sram1_axi_awaddr),
        .axi_awlen(inst_ai_sram1_axi_awlen),
        .axi_awsize(inst_ai_sram1_axi_awsize),
        .axi_awburst(inst_ai_sram1_axi_awburst),
        .axi_awlock(inst_ai_sram1_axi_awlock),
        .axi_awcache(inst_ai_sram1_axi_awcache),
        .axi_awprot(inst_ai_sram1_axi_awprot),
        .axi_awvalid(inst_ai_sram1_axi_awvalid),
        .axi_awready(inst_ai_sram1_axi_awready),
        .axi_wdata(inst_ai_sram1_axi_wdata),
        .axi_wstrb(inst_ai_sram1_axi_wstrb),
        .axi_wlast(inst_ai_sram1_axi_wlast),
        .axi_wvalid(inst_ai_sram1_axi_wvalid),
        .axi_wready(inst_ai_sram1_axi_wready),
        .axi_bid(inst_ai_sram1_axi_bid),
        .axi_bresp(inst_ai_sram1_axi_bresp),
        .axi_bvalid(inst_ai_sram1_axi_bvalid),
        .axi_bready(inst_ai_sram1_axi_bready),
        .axi_arid(inst_ai_sram1_axi_arid),
        .axi_araddr(inst_ai_sram1_axi_araddr),
        .axi_arlen(inst_ai_sram1_axi_arlen),
        .axi_arsize(inst_ai_sram1_axi_arsize),
        .axi_arburst(inst_ai_sram1_axi_arburst),
        .axi_arlock(inst_ai_sram1_axi_arlock),
        .axi_arcache(inst_ai_sram1_axi_arcache),
        .axi_arprot(inst_ai_sram1_axi_arprot),
        .axi_arvalid(inst_ai_sram1_axi_arvalid),
        .axi_arready(inst_ai_sram1_axi_arready),
        .axi_rid(inst_ai_sram1_axi_rid),
        .axi_rdata(inst_ai_sram1_axi_rdata),
        .axi_rresp(inst_ai_sram1_axi_rresp),
        .axi_rlast(inst_ai_sram1_axi_rlast),
        .axi_rvalid(inst_ai_sram1_axi_rvalid),
        .axi_rready(inst_ai_sram1_axi_rready));
    
    AICPU inst_ai_cpu (
        .acr_clk(inst_ai_cpu_acr_clk),
        .acr_rst(inst_ai_cpu_acr_rst),
        .axi_awaddr(inst_ai_cpu_axi_awaddr),
        .axi_awlen(inst_ai_cpu_axi_awlen),
        .axi_awsize(inst_ai_cpu_axi_awsize),
        .axi_awburst(inst_ai_cpu_axi_awburst),
        .axi_awlock(inst_ai_cpu_axi_awlock),
        .axi_awcache(inst_ai_cpu_axi_awcache),
        .axi_awprot(inst_ai_cpu_axi_awprot),
        .axi_awvalid(inst_ai_cpu_axi_awvalid),
        .axi_awready(inst_ai_cpu_axi_awready),
        .axi_wdata(inst_ai_cpu_axi_wdata),
        .axi_wstrb(inst_ai_cpu_axi_wstrb),
        .axi_wlast(inst_ai_cpu_axi_wlast),
        .axi_wvalid(inst_ai_cpu_axi_wvalid),
        .axi_wready(inst_ai_cpu_axi_wready),
        .axi_bid(inst_ai_cpu_axi_bid),
        .axi_bresp(inst_ai_cpu_axi_bresp),
        .axi_bvalid(inst_ai_cpu_axi_bvalid),
        .axi_bready(inst_ai_cpu_axi_bready),
        .axi_arid(inst_ai_cpu_axi_arid),
        .axi_araddr(inst_ai_cpu_axi_araddr),
        .axi_arlen(inst_ai_cpu_axi_arlen),
        .axi_arsize(inst_ai_cpu_axi_arsize),
        .axi_arburst(inst_ai_cpu_axi_arburst),
        .axi_arlock(inst_ai_cpu_axi_arlock),
        .axi_arcache(inst_ai_cpu_axi_arcache),
        .axi_arprot(inst_ai_cpu_axi_arprot),
        .axi_arvalid(inst_ai_cpu_axi_arvalid),
        .axi_arready(inst_ai_cpu_axi_arready),
        .axi_rid(inst_ai_cpu_axi_rid),
        .axi_rdata(inst_ai_cpu_axi_rdata),
        .axi_rresp(inst_ai_cpu_axi_rresp),
        .axi_rlast(inst_ai_cpu_axi_rlast),
        .axi_rvalid(inst_ai_cpu_axi_rvalid),
        .axi_rready(inst_ai_cpu_axi_rready));
    
    AIDMA inst_ai_dma (
        .acr_clk(inst_ai_dma_acr_clk),
        .acr_rst(inst_ai_dma_acr_rst),
        .axi_awaddr(inst_ai_dma_axi_awaddr),
        .axi_awlen(inst_ai_dma_axi_awlen),
        .axi_awsize(inst_ai_dma_axi_awsize),
        .axi_awburst(inst_ai_dma_axi_awburst),
        .axi_awlock(inst_ai_dma_axi_awlock),
        .axi_awcache(inst_ai_dma_axi_awcache),
        .axi_awprot(inst_ai_dma_axi_awprot),
        .axi_awvalid(inst_ai_dma_axi_awvalid),
        .axi_awready(inst_ai_dma_axi_awready),
        .axi_wdata(inst_ai_dma_axi_wdata),
        .axi_wstrb(inst_ai_dma_axi_wstrb),
        .axi_wlast(inst_ai_dma_axi_wlast),
        .axi_wvalid(inst_ai_dma_axi_wvalid),
        .axi_wready(inst_ai_dma_axi_wready),
        .axi_bid(inst_ai_dma_axi_bid),
        .axi_bresp(inst_ai_dma_axi_bresp),
        .axi_bvalid(inst_ai_dma_axi_bvalid),
        .axi_bready(inst_ai_dma_axi_bready),
        .axi_arid(inst_ai_dma_axi_arid),
        .axi_araddr(inst_ai_dma_axi_araddr),
        .axi_arlen(inst_ai_dma_axi_arlen),
        .axi_arsize(inst_ai_dma_axi_arsize),
        .axi_arburst(inst_ai_dma_axi_arburst),
        .axi_arlock(inst_ai_dma_axi_arlock),
        .axi_arcache(inst_ai_dma_axi_arcache),
        .axi_arprot(inst_ai_dma_axi_arprot),
        .axi_arvalid(inst_ai_dma_axi_arvalid),
        .axi_arready(inst_ai_dma_axi_arready),
        .axi_rid(inst_ai_dma_axi_rid),
        .axi_rdata(inst_ai_dma_axi_rdata),
        .axi_rresp(inst_ai_dma_axi_rresp),
        .axi_rlast(inst_ai_dma_axi_rlast),
        .axi_rvalid(inst_ai_dma_axi_rvalid),
        .axi_rready(inst_ai_dma_axi_rready));
    
    AIAccelerator inst_ai_accelerator (
        .acr_clk(inst_ai_accelerator_acr_clk),
        .acr_rst(inst_ai_accelerator_acr_rst),
        .axi_awaddr(inst_ai_accelerator_axi_awaddr),
        .axi_awlen(inst_ai_accelerator_axi_awlen),
        .axi_awsize(inst_ai_accelerator_axi_awsize),
        .axi_awburst(inst_ai_accelerator_axi_awburst),
        .axi_awlock(inst_ai_accelerator_axi_awlock),
        .axi_awcache(inst_ai_accelerator_axi_awcache),
        .axi_awprot(inst_ai_accelerator_axi_awprot),
        .axi_awvalid(inst_ai_accelerator_axi_awvalid),
        .axi_awready(inst_ai_accelerator_axi_awready),
        .axi_wdata(inst_ai_accelerator_axi_wdata),
        .axi_wstrb(inst_ai_accelerator_axi_wstrb),
        .axi_wlast(inst_ai_accelerator_axi_wlast),
        .axi_wvalid(inst_ai_accelerator_axi_wvalid),
        .axi_wready(inst_ai_accelerator_axi_wready),
        .axi_bid(inst_ai_accelerator_axi_bid),
        .axi_bresp(inst_ai_accelerator_axi_bresp),
        .axi_bvalid(inst_ai_accelerator_axi_bvalid),
        .axi_bready(inst_ai_accelerator_axi_bready),
        .axi_arid(inst_ai_accelerator_axi_arid),
        .axi_araddr(inst_ai_accelerator_axi_araddr),
        .axi_arlen(inst_ai_accelerator_axi_arlen),
        .axi_arsize(inst_ai_accelerator_axi_arsize),
        .axi_arburst(inst_ai_accelerator_axi_arburst),
        .axi_arlock(inst_ai_accelerator_axi_arlock),
        .axi_arcache(inst_ai_accelerator_axi_arcache),
        .axi_arprot(inst_ai_accelerator_axi_arprot),
        .axi_arvalid(inst_ai_accelerator_axi_arvalid),
        .axi_arready(inst_ai_accelerator_axi_arready),
        .axi_rid(inst_ai_accelerator_axi_rid),
        .axi_rdata(inst_ai_accelerator_axi_rdata),
        .axi_rresp(inst_ai_accelerator_axi_rresp),
        .axi_rlast(inst_ai_accelerator_axi_rlast),
        .axi_rvalid(inst_ai_accelerator_axi_rvalid),
        .axi_rready(inst_ai_accelerator_axi_rready));
    
    AICrossbar inst_ai_corssbar (
        .acr_clk(inst_ai_corssbar_acr_clk),
        .acr_rst(inst_ai_corssbar_acr_rst),
        .axii0_awaddr(inst_ai_corssbar_axii0_awaddr),
        .axii0_awlen(inst_ai_corssbar_axii0_awlen),
        .axii0_awsize(inst_ai_corssbar_axii0_awsize),
        .axii0_awburst(inst_ai_corssbar_axii0_awburst),
        .axii0_awlock(inst_ai_corssbar_axii0_awlock),
        .axii0_awcache(inst_ai_corssbar_axii0_awcache),
        .axii0_awprot(inst_ai_corssbar_axii0_awprot),
        .axii0_awvalid(inst_ai_corssbar_axii0_awvalid),
        .axii0_awready(inst_ai_corssbar_axii0_awready),
        .axii0_wdata(inst_ai_corssbar_axii0_wdata),
        .axii0_wstrb(inst_ai_corssbar_axii0_wstrb),
        .axii0_wlast(inst_ai_corssbar_axii0_wlast),
        .axii0_wvalid(inst_ai_corssbar_axii0_wvalid),
        .axii0_wready(inst_ai_corssbar_axii0_wready),
        .axii0_bid(inst_ai_corssbar_axii0_bid),
        .axii0_bresp(inst_ai_corssbar_axii0_bresp),
        .axii0_bvalid(inst_ai_corssbar_axii0_bvalid),
        .axii0_bready(inst_ai_corssbar_axii0_bready),
        .axii0_arid(inst_ai_corssbar_axii0_arid),
        .axii0_araddr(inst_ai_corssbar_axii0_araddr),
        .axii0_arlen(inst_ai_corssbar_axii0_arlen),
        .axii0_arsize(inst_ai_corssbar_axii0_arsize),
        .axii0_arburst(inst_ai_corssbar_axii0_arburst),
        .axii0_arlock(inst_ai_corssbar_axii0_arlock),
        .axii0_arcache(inst_ai_corssbar_axii0_arcache),
        .axii0_arprot(inst_ai_corssbar_axii0_arprot),
        .axii0_arvalid(inst_ai_corssbar_axii0_arvalid),
        .axii0_arready(inst_ai_corssbar_axii0_arready),
        .axii0_rid(inst_ai_corssbar_axii0_rid),
        .axii0_rdata(inst_ai_corssbar_axii0_rdata),
        .axii0_rresp(inst_ai_corssbar_axii0_rresp),
        .axii0_rlast(inst_ai_corssbar_axii0_rlast),
        .axii0_rvalid(inst_ai_corssbar_axii0_rvalid),
        .axii0_rready(inst_ai_corssbar_axii0_rready),
        .axii1_awaddr(inst_ai_corssbar_axii1_awaddr),
        .axii1_awlen(inst_ai_corssbar_axii1_awlen),
        .axii1_awsize(inst_ai_corssbar_axii1_awsize),
        .axii1_awburst(inst_ai_corssbar_axii1_awburst),
        .axii1_awlock(inst_ai_corssbar_axii1_awlock),
        .axii1_awcache(inst_ai_corssbar_axii1_awcache),
        .axii1_awprot(inst_ai_corssbar_axii1_awprot),
        .axii1_awvalid(inst_ai_corssbar_axii1_awvalid),
        .axii1_awready(inst_ai_corssbar_axii1_awready),
        .axii1_wdata(inst_ai_corssbar_axii1_wdata),
        .axii1_wstrb(inst_ai_corssbar_axii1_wstrb),
        .axii1_wlast(inst_ai_corssbar_axii1_wlast),
        .axii1_wvalid(inst_ai_corssbar_axii1_wvalid),
        .axii1_wready(inst_ai_corssbar_axii1_wready),
        .axii1_bid(inst_ai_corssbar_axii1_bid),
        .axii1_bresp(inst_ai_corssbar_axii1_bresp),
        .axii1_bvalid(inst_ai_corssbar_axii1_bvalid),
        .axii1_bready(inst_ai_corssbar_axii1_bready),
        .axii1_arid(inst_ai_corssbar_axii1_arid),
        .axii1_araddr(inst_ai_corssbar_axii1_araddr),
        .axii1_arlen(inst_ai_corssbar_axii1_arlen),
        .axii1_arsize(inst_ai_corssbar_axii1_arsize),
        .axii1_arburst(inst_ai_corssbar_axii1_arburst),
        .axii1_arlock(inst_ai_corssbar_axii1_arlock),
        .axii1_arcache(inst_ai_corssbar_axii1_arcache),
        .axii1_arprot(inst_ai_corssbar_axii1_arprot),
        .axii1_arvalid(inst_ai_corssbar_axii1_arvalid),
        .axii1_arready(inst_ai_corssbar_axii1_arready),
        .axii1_rid(inst_ai_corssbar_axii1_rid),
        .axii1_rdata(inst_ai_corssbar_axii1_rdata),
        .axii1_rresp(inst_ai_corssbar_axii1_rresp),
        .axii1_rlast(inst_ai_corssbar_axii1_rlast),
        .axii1_rvalid(inst_ai_corssbar_axii1_rvalid),
        .axii1_rready(inst_ai_corssbar_axii1_rready),
        .axii2_awaddr(inst_ai_corssbar_axii2_awaddr),
        .axii2_awlen(inst_ai_corssbar_axii2_awlen),
        .axii2_awsize(inst_ai_corssbar_axii2_awsize),
        .axii2_awburst(inst_ai_corssbar_axii2_awburst),
        .axii2_awlock(inst_ai_corssbar_axii2_awlock),
        .axii2_awcache(inst_ai_corssbar_axii2_awcache),
        .axii2_awprot(inst_ai_corssbar_axii2_awprot),
        .axii2_awvalid(inst_ai_corssbar_axii2_awvalid),
        .axii2_awready(inst_ai_corssbar_axii2_awready),
        .axii2_wdata(inst_ai_corssbar_axii2_wdata),
        .axii2_wstrb(inst_ai_corssbar_axii2_wstrb),
        .axii2_wlast(inst_ai_corssbar_axii2_wlast),
        .axii2_wvalid(inst_ai_corssbar_axii2_wvalid),
        .axii2_wready(inst_ai_corssbar_axii2_wready),
        .axii2_bid(inst_ai_corssbar_axii2_bid),
        .axii2_bresp(inst_ai_corssbar_axii2_bresp),
        .axii2_bvalid(inst_ai_corssbar_axii2_bvalid),
        .axii2_bready(inst_ai_corssbar_axii2_bready),
        .axii2_arid(inst_ai_corssbar_axii2_arid),
        .axii2_araddr(inst_ai_corssbar_axii2_araddr),
        .axii2_arlen(inst_ai_corssbar_axii2_arlen),
        .axii2_arsize(inst_ai_corssbar_axii2_arsize),
        .axii2_arburst(inst_ai_corssbar_axii2_arburst),
        .axii2_arlock(inst_ai_corssbar_axii2_arlock),
        .axii2_arcache(inst_ai_corssbar_axii2_arcache),
        .axii2_arprot(inst_ai_corssbar_axii2_arprot),
        .axii2_arvalid(inst_ai_corssbar_axii2_arvalid),
        .axii2_arready(inst_ai_corssbar_axii2_arready),
        .axii2_rid(inst_ai_corssbar_axii2_rid),
        .axii2_rdata(inst_ai_corssbar_axii2_rdata),
        .axii2_rresp(inst_ai_corssbar_axii2_rresp),
        .axii2_rlast(inst_ai_corssbar_axii2_rlast),
        .axii2_rvalid(inst_ai_corssbar_axii2_rvalid),
        .axii2_rready(inst_ai_corssbar_axii2_rready),
        .axio0_awaddr(inst_ai_corssbar_axio0_awaddr),
        .axio0_awlen(inst_ai_corssbar_axio0_awlen),
        .axio0_awsize(inst_ai_corssbar_axio0_awsize),
        .axio0_awburst(inst_ai_corssbar_axio0_awburst),
        .axio0_awlock(inst_ai_corssbar_axio0_awlock),
        .axio0_awcache(inst_ai_corssbar_axio0_awcache),
        .axio0_awprot(inst_ai_corssbar_axio0_awprot),
        .axio0_awvalid(inst_ai_corssbar_axio0_awvalid),
        .axio0_awready(inst_ai_corssbar_axio0_awready),
        .axio0_wdata(inst_ai_corssbar_axio0_wdata),
        .axio0_wstrb(inst_ai_corssbar_axio0_wstrb),
        .axio0_wlast(inst_ai_corssbar_axio0_wlast),
        .axio0_wvalid(inst_ai_corssbar_axio0_wvalid),
        .axio0_wready(inst_ai_corssbar_axio0_wready),
        .axio0_bid(inst_ai_corssbar_axio0_bid),
        .axio0_bresp(inst_ai_corssbar_axio0_bresp),
        .axio0_bvalid(inst_ai_corssbar_axio0_bvalid),
        .axio0_bready(inst_ai_corssbar_axio0_bready),
        .axio0_arid(inst_ai_corssbar_axio0_arid),
        .axio0_araddr(inst_ai_corssbar_axio0_araddr),
        .axio0_arlen(inst_ai_corssbar_axio0_arlen),
        .axio0_arsize(inst_ai_corssbar_axio0_arsize),
        .axio0_arburst(inst_ai_corssbar_axio0_arburst),
        .axio0_arlock(inst_ai_corssbar_axio0_arlock),
        .axio0_arcache(inst_ai_corssbar_axio0_arcache),
        .axio0_arprot(inst_ai_corssbar_axio0_arprot),
        .axio0_arvalid(inst_ai_corssbar_axio0_arvalid),
        .axio0_arready(inst_ai_corssbar_axio0_arready),
        .axio0_rid(inst_ai_corssbar_axio0_rid),
        .axio0_rdata(inst_ai_corssbar_axio0_rdata),
        .axio0_rresp(inst_ai_corssbar_axio0_rresp),
        .axio0_rlast(inst_ai_corssbar_axio0_rlast),
        .axio0_rvalid(inst_ai_corssbar_axio0_rvalid),
        .axio0_rready(inst_ai_corssbar_axio0_rready),
        .axio1_awaddr(inst_ai_corssbar_axio1_awaddr),
        .axio1_awlen(inst_ai_corssbar_axio1_awlen),
        .axio1_awsize(inst_ai_corssbar_axio1_awsize),
        .axio1_awburst(inst_ai_corssbar_axio1_awburst),
        .axio1_awlock(inst_ai_corssbar_axio1_awlock),
        .axio1_awcache(inst_ai_corssbar_axio1_awcache),
        .axio1_awprot(inst_ai_corssbar_axio1_awprot),
        .axio1_awvalid(inst_ai_corssbar_axio1_awvalid),
        .axio1_awready(inst_ai_corssbar_axio1_awready),
        .axio1_wdata(inst_ai_corssbar_axio1_wdata),
        .axio1_wstrb(inst_ai_corssbar_axio1_wstrb),
        .axio1_wlast(inst_ai_corssbar_axio1_wlast),
        .axio1_wvalid(inst_ai_corssbar_axio1_wvalid),
        .axio1_wready(inst_ai_corssbar_axio1_wready),
        .axio1_bid(inst_ai_corssbar_axio1_bid),
        .axio1_bresp(inst_ai_corssbar_axio1_bresp),
        .axio1_bvalid(inst_ai_corssbar_axio1_bvalid),
        .axio1_bready(inst_ai_corssbar_axio1_bready),
        .axio1_arid(inst_ai_corssbar_axio1_arid),
        .axio1_araddr(inst_ai_corssbar_axio1_araddr),
        .axio1_arlen(inst_ai_corssbar_axio1_arlen),
        .axio1_arsize(inst_ai_corssbar_axio1_arsize),
        .axio1_arburst(inst_ai_corssbar_axio1_arburst),
        .axio1_arlock(inst_ai_corssbar_axio1_arlock),
        .axio1_arcache(inst_ai_corssbar_axio1_arcache),
        .axio1_arprot(inst_ai_corssbar_axio1_arprot),
        .axio1_arvalid(inst_ai_corssbar_axio1_arvalid),
        .axio1_arready(inst_ai_corssbar_axio1_arready),
        .axio1_rid(inst_ai_corssbar_axio1_rid),
        .axio1_rdata(inst_ai_corssbar_axio1_rdata),
        .axio1_rresp(inst_ai_corssbar_axio1_rresp),
        .axio1_rlast(inst_ai_corssbar_axio1_rlast),
        .axio1_rvalid(inst_ai_corssbar_axio1_rvalid),
        .axio1_rready(inst_ai_corssbar_axio1_rready),
        .axio2_awaddr(inst_ai_corssbar_axio2_awaddr),
        .axio2_awlen(inst_ai_corssbar_axio2_awlen),
        .axio2_awsize(inst_ai_corssbar_axio2_awsize),
        .axio2_awburst(inst_ai_corssbar_axio2_awburst),
        .axio2_awlock(inst_ai_corssbar_axio2_awlock),
        .axio2_awcache(inst_ai_corssbar_axio2_awcache),
        .axio2_awprot(inst_ai_corssbar_axio2_awprot),
        .axio2_awvalid(inst_ai_corssbar_axio2_awvalid),
        .axio2_awready(inst_ai_corssbar_axio2_awready),
        .axio2_wdata(inst_ai_corssbar_axio2_wdata),
        .axio2_wstrb(inst_ai_corssbar_axio2_wstrb),
        .axio2_wlast(inst_ai_corssbar_axio2_wlast),
        .axio2_wvalid(inst_ai_corssbar_axio2_wvalid),
        .axio2_wready(inst_ai_corssbar_axio2_wready),
        .axio2_bid(inst_ai_corssbar_axio2_bid),
        .axio2_bresp(inst_ai_corssbar_axio2_bresp),
        .axio2_bvalid(inst_ai_corssbar_axio2_bvalid),
        .axio2_bready(inst_ai_corssbar_axio2_bready),
        .axio2_arid(inst_ai_corssbar_axio2_arid),
        .axio2_araddr(inst_ai_corssbar_axio2_araddr),
        .axio2_arlen(inst_ai_corssbar_axio2_arlen),
        .axio2_arsize(inst_ai_corssbar_axio2_arsize),
        .axio2_arburst(inst_ai_corssbar_axio2_arburst),
        .axio2_arlock(inst_ai_corssbar_axio2_arlock),
        .axio2_arcache(inst_ai_corssbar_axio2_arcache),
        .axio2_arprot(inst_ai_corssbar_axio2_arprot),
        .axio2_arvalid(inst_ai_corssbar_axio2_arvalid),
        .axio2_arready(inst_ai_corssbar_axio2_arready),
        .axio2_rid(inst_ai_corssbar_axio2_rid),
        .axio2_rdata(inst_ai_corssbar_axio2_rdata),
        .axio2_rresp(inst_ai_corssbar_axio2_rresp),
        .axio2_rlast(inst_ai_corssbar_axio2_rlast),
        .axio2_rvalid(inst_ai_corssbar_axio2_rvalid),
        .axio2_rready(inst_ai_corssbar_axio2_rready));
    
endmodule