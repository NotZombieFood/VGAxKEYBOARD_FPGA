module VGA(
input clk,
input rst,
input r, g, b,
input ps2d, ps2c,
input rst_2,
output[7:0]blue,
output BLANK_N,
output o_pixel_clk,
output [7:0] green,
output hsync,
output [7:0] red,
output SYNC_N,
output vsync,
output [7:0] lcd_data,
output RW, EN, RS, ON
);

logic pixel_clk;
logic [9:0] x, y;
logic vidon;
logic hsync_2, vsync_2;
logic doneKey;
logic letter_case;
logic [9:0] KeyData;
logic [31:0] teclado;
logic done;
logic en_mem;
logic [511:0] mem;
logic [9:0] wr_address_mem;
logic [9:0] rd_address_mem;
logic [511:0] wr_data_mem;
logic [9:0] columna;
logic [6:0] linea;
logic borrar;
logic [9:0] rd_rom;
logic [28:0] puntero;
logic [511:0] data_puntero;
logic en_mem_b;
logic poSDoneKey;

assign en_mem_b = 0;


////////////////////////////////////////////////////////////Teclado///////////////////////////////////
top keyb(.clk(clk), .rst(rst), .ps2d(ps2d), .ps2c(ps2c), .DATA(lcd_data), .RW(RW), .RS(RS), .EN(EN), .ON(ON), .keyboard(teclado), .done(done)); //.lt_c(letter_case), .kD(keyData) );

write write(.clk(clk), .rst(~rst), .rst_2(~rst_2), .teclado(teclado), .wr_data_mem(wr_data_mem), .done(done), .en_mem(en_mem), .address(wr_address_mem));



///////////////////////////////////////////////////Memorias/////////////////////////////////////
Ram_1 memory(.clock(clk),
.aclr(~rst),
.data(wr_data_mem),
.rdaddress(rd_address_mem),
.wraddress(wr_address_mem),
.wren(en_mem),
.q(rd_rom)
);


rom_1 rom_1(
.clk(clk),
.rst(~rst),
.address(rd_rom),
.data(mem)
);


clock_divider clk_2(
.clk(clk),
.rst(~rst),
.clk_25Mhz(pixel_clk)
);


assign o_pixel_clk = pixel_clk;

frecuency_generator f_640x480(
.clk(pixel_clk),
.rst(~rst),
.hsync(hsync),
.vsync(vsync),
.x(x),
.y(y),
.vidon(vidon),
.blank(BLANK_N)
);

/*VGA_stripes stripes(
.x(x),
.y(y),
.vidon(vidon),
//.red(red),
//.green(green),
//.blue(blue)
);
*/

/*back_ground_color bg(
.g(g),
.r(r),
.b(b),
.vidon(vidon),
.red(red),
.green(green),
.blue(blue)
);
*/

print print_1(
 .x(x),
 .y(y),
 .r(r),
 .b(b),
 .g(g),
 .clk(clk),
 .vidon(vidon),
 .mem(mem),
 .rd_address_mem(rd_address_mem),
 .red(red),
 .blue(blue),
 .green(green)
 );
 

endmodule