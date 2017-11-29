module clock_divider (
input clk,
input rst,
output logic clk_25Mhz
);


always_ff @ (posedge clk) begin
	if (rst) 
		clk_25Mhz <= 0;
	else 
		clk_25Mhz <= ~clk_25Mhz;
end

endmodule 