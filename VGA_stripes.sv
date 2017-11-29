module VGA_stripes (
input [9:0] x, y,
input vidon,
output logic [7:0] red, green, blue
);

always_comb begin
	if (vidon) begin
		if ( y[4] ) begin
			red = 8'b 11111111;
			green = 0;
			blue = 0;
		end
		else begin
			red = 0;
			green = 0;
			blue = 8'b 11111111;
		end
	end
	else begin
		red = 0;
		green = 0;
		blue = 0;
	end
end

endmodule 