`timescale 1ns/1ns


`define HALF_PERIOD (125.0) /* for 4 MHz */


module tb;

	reg clk;
	reg rst_n;

	wire dclo_n = rst_n;

	reg aclo_n;


	tri1 init_n;


	wire [15:0] ad_n;
	tri1 dout_n;
	tri1 din_n;
	wire wtbt_n;
	tri1 sync_n;
	tri1 rply_n;
	tri1 dmr_n;
	tri1 sack_n;
	tri1 dmgi_n;
	wire dmgo_n;
	tri1 iako_n;
	tri1 bsy_n;

	wire [15:0] ad = ~ad_n;

	tri1 [1:0] sel_n;


	reg [15:0] addr;






	// CLOCK
	initial
	begin
		clk = 1'b1;

		forever
		begin
			#`HALF_PERIOD clk = ~clk;
		end
	end


	// RESET
	initial
	begin
		rst_n = 1'b0;

		repeat (10) @(posedge clk);
		
		rst_n <= 1'b1;
	end


	// ACLO_N
	initial
	begin
		aclo_n <= 1'b0;

		wait( rst_n==1'b1)

		repeat (10) @(posedge clk);

		aclo_n <= 1'b1;
	end



	// address
	always @(negedge sync_n)
		addr <= ~ad_n;







	// start address
	wire [15:0] start = 16'd512;
	assign ad_n = (addr==16'o177716 && !din_n) ? (~start) : 16'hZZZZ;


	// infinite loop at address 512
	reg my_rply_n=1'b1;

	reg count=1'b0;

	always
	begin
		@(negedge sync_n);
		my_rply_n <= 1'b0;
		@(posedge (din_n&dout_n));
		my_rply_n <= 1'b1;
	end

	wire [15:0] jmp_minusPC = 16'o000147;
	assign ad_n = (addr==16'd512 && !din_n) ? (~jmp_minusPC) : 16'hZZZZ;
	assign rply_n = (addr==16'd512 && !sync_n) ? (count ? my_rply_n : din_n) : 1'bZ;

	always @(posedge sync_n)
		count <= ~count;









	// 1801BM1
	defparam vm1.core.VM1_CORE_MULG_VERSION=0;
	vm1 vm1
	(
		.pin_clk   (clk),
		.pin_pa_n  (2'b11),
		.pin_init_n(init_n),
		.pin_dclo_n(dclo_n),
		.pin_aclo_n(aclo_n),
		.pin_irq_n (1'b1),
		.pin_virq_n(1'b1),

		.pin_ad_n  (ad_n  ),
		.pin_dout_n(dout_n),
		.pin_din_n (din_n ),
		.pin_wtbt_n(wtbt_n),
		.pin_sync_n(sync_n),
		.pin_rply_n(rply_n),
		.pin_dmr_n (dmr_n ),
		.pin_sack_n(sack_n),
		.pin_dmgi_n(dmgi_n),
		.pin_dmgo_n(dmgo_n),
		.pin_iako_n(iako_n),
		.pin_sp_n  (1'b1),
		.pin_sel_n (sel_n),
		.pin_bsy_n (bsy_n )
	);

















endmodule

