`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Joel Fernandes
//////////////////////////////////////////////////////////////////////////////////

module sram(
		input [7:0] addr,
		inout [7:0] data,
		input clk,
		input rw
    );
	 reg [7:0] iram [255:0];
	 reg [7:0] data_latch;
	 
	 assign data = (rw == 0) ? data_latch : 8'bz;
	 
	 always @ ( posedge(clk))
	 begin
		if (rw == 0)
			begin
			data_latch <= iram[addr];
			end
		else if (rw == 1)
			begin
			iram[addr] <= data;
			end
		end
endmodule
