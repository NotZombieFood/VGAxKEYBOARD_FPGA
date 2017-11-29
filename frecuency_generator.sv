module frecuency_generator
#(parameter x_pixels = 800,
parameter x_lines = 521,
parameter x_back_porch = 144,
parameter x_front_porch =784,
parameter y_pixels = 525,
parameter y_back_porch = 33,
parameter y_front_porch = 513
)(
input clk, rst,
output logic hsync, vsync,
output logic [9:0] x, y,
output logic vidon,
output logic blank
);

logic en_y;

//////////////////////Contador x///////////////////////////////////////////////////////////////////
always_ff @ (posedge clk | rst) begin
	if (rst)
		x <= 0;
	else begin
		if ( x == (x_pixels - 1) ) begin  //El contador llegó al final
			x <= 0;
			en_y <= 1;
		end
		else begin
			x <= x+1;
			en_y <= 0;
		end
	end
end
/////////////////////////señal hsync///////////////////////////////////////////////////////////////
always_comb begin
if ( x < 96 )
	hsync = 0;
else
	hsync = 1;
end

////////////////////////////////counter y /////////////////////////////////////////////////////////
always_ff @ (posedge clk | rst) begin
	if (rst)
		y <= 0;
	else if (en_y) begin
		if (y == (x_lines - 1))
			y <= 0;
		else
			y <= y + 1;
	end
	else
		y <= y;
end
///////////////////////////////señal vsync////////////////////////////////////////////////////////
always_comb begin
	if ( y < 2 )
		vsync = 0;
	else
		vsync = 1;
end

//////////////////////////////señal vidon/////////////////////////////////////////////////////
always_comb begin
	if ( ((x < x_front_porch) & (x >= x_back_porch)) & (( y < y_front_porch) & ( y >= y_back_porch)) ) begin
		vidon = 1;
		blank = 1;
		end
	else begin
		vidon = 0;
		blank = 0;
	end
end


endmodule
