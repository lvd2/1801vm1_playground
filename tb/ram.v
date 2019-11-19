module ram
(
	input  wire        clk,

	inout  wire [15:0] ad_n,
	input  wire [ 1:0] sel_n,
	input  wire        sync_n,
	input  wire        dout_n,
	input  wire        din_n,
	input  wire        wtbt_n,
	output wire        rply_n
);
	reg [15:0] addr;

	reg selected;


	reg [15:0] mem [0:32767];


	initial
	begin : clr_mem
		int i;
		for(i=0;i<32768;i++)
			mem[i] <= 16'd0;
	end




	// address latching
	always @(negedge sync_n)
		addr <= ~ad_n;

	// whether memory is selected (not internal CPU ports)
	always @(negedge sync_n)
		selected <= (sel_n==2'b11);


	// rply_n generation
	assign rply_n = (selected && !sync_n) ? (din_n & dout_n) : 1'bZ;


	// data read
	assign ad_n = (selected && !sync_n && !din_n) ? (~mem[addr[15:1]]) : 16'hZZZZ;

	// data write
	always @*
	if( selected && !sync_n && !dout_n )
	begin
		if( wtbt_n==1'b1 ) // word write
			mem[addr[15:1]] <= ~ad_n;
		else
		begin // byte write
			if( addr[0]==1'b0 )
				mem[addr[15:1]][ 7:0] <= ~ad_n[ 7:0];
			else
				mem[addr[15:1]][15:8] <= ~ad_n[15:8];
		end
	end

endmodule

