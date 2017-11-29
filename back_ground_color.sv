module back_ground_color(
input r, g, b,
input vidon,
output logic[7:0] red, green, blue
);

always_comb begin
	if (vidon) begin
		if (r)
			red = 255;
		else
			red = 0;
		if (b)
			blue = 255;
		else
			blue = 0;
		if (g)
			green = 255;
		else 
			green = 0;
	end
	else begin
		red = 0;
		green = 0;
		blue = 0;
	end
end

endmodule 