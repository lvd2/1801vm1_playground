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




	task load_mem(input string filename);

		int i;
		int fd;
		int fsize;
		int tmp;

		bit [15:0] array[];

		// open file
		fd = $fopen(filename,"rb");
		if( !fd )
		begin
			$display("Can't open file %s!",filename);
			$stop;
		end

		// get file size
		$fseek(fd,0,2);
		fsize=$ftell(fd);
		$rewind(fd);

		if( (fsize%2) || (fsize<4) || (fsize>(65536+4)) )
		begin
			$display("File %s length %d is bad!",filename,fsize);
			$display("Must be even, GE than 4, LE than 65540");
			$stop;
		end

		
		// load file
		array = new[fsize];

		for(i=0;i<fsize/2;i++)
		begin : read_file
			bit [15:0] tmp;
			$fread(tmp,fd);
			array[i] = {tmp[7:0],tmp[15:8]};
		end

for(i=0;i<fsize/2;i++) $display("%h ",array[i]);

		// check header
		if( array[1] != (fsize-4) )
		begin
			$display("File length %d (0x%04h) does not correspond to header length 0x%04h!",fsize,fsize,array[1]);
		end

		// load into RAM
		for(i=0;i<array[1]/2;i++)
		begin : load_mem
			int addr;

			addr = i+array[0]/2;

			mem[addr[14:0]] = array[2+i];
		end


	endtask
endmodule

