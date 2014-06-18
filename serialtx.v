`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// A simple synchronous parallel in serial out (PISO) shift register
//
//////////////////////////////////////////////////////////////////////////////////
module serialtx(
    input [7:0] i_data,
    input i_latchen,
    input i_txen,
    input i_clk,
    output o_out
    );
reg [7:0] latch;
reg out;

assign o_out = out;

always @ (posedge i_clk)
begin
	if(i_latchen)
	begin
		latch = i_data;
	end
	
	if(i_txen)
	begin
		out = latch[7];
		latch = latch << 1;
	end
	else
		out = 'bZ;
end

endmodule
