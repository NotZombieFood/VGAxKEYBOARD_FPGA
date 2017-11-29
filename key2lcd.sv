module key2lcd
	(
		input  letter_case,
		input  [7:0] scan_code,
		output logic [8:0] lcd_code
	);
	
always_comb begin
	if(letter_case == 1'b1)  // uppercase 
		begin
		case(scan_code)
			8'h45: lcd_code = 64;   // 0
			8'h16: lcd_code = 65;   // 1
			8'h1e: lcd_code = 66;   // 2
			8'h26: lcd_code = 67;   // 3
			8'h25: lcd_code = 68;   // 4
			8'h2e: lcd_code = 69;   // 5
			8'h36: lcd_code = 70;   // 6
			8'h3d: lcd_code = 71;   // 7
			8'h3e: lcd_code = 72;   // 8
			8'h46: lcd_code = 73;   // 9
			8'h1c: lcd_code = 1;   // a
			8'h32: lcd_code = 2;   // b
			8'h21: lcd_code = 3;   // c
			8'h23: lcd_code = 4;   // d
			8'h24: lcd_code = 5;   // e
			8'h2b: lcd_code = 6;   // f
			8'h34: lcd_code = 7;   // g
			8'h33: lcd_code = 8;   // h
			8'h43: lcd_code = 9;   // i
			8'h3b: lcd_code = 10;   // j
			8'h42: lcd_code = 11;   // k
			8'h4b: lcd_code = 12;   // l
			8'h3a: lcd_code = 13;   // m
			8'h31: lcd_code = 14;   // n
			8'h44: lcd_code = 15;   // o
			8'h4d: lcd_code = 16;   // p
			8'h15: lcd_code = 17;   // q
			8'h2d: lcd_code = 18;   // r
			8'h1b: lcd_code = 19;   // s
			8'h2c: lcd_code = 20;   // t
			8'h3c: lcd_code = 21;   // u
			8'h2a: lcd_code = 22;   // v
			8'h1d: lcd_code = 23;   // w
			8'h22: lcd_code = 24;   // x
			8'h35: lcd_code = 25;   // y
			8'h1a: lcd_code = 26;   // z
			8'h0e: lcd_code = 27;   // `
			8'h4e: lcd_code = 28;   // -
			8'h55: lcd_code = 29;   // =
			8'h54: lcd_code = 30;   // [
			8'h5b: lcd_code = 31;   // ]
			8'h5d: lcd_code = 32;   // \
			8'h4c: lcd_code = 33;   // ;
			8'h52: lcd_code = 34;   // '
			8'h41: lcd_code = 35;   // ,
			8'h49: lcd_code = 36;   // .
			8'h4a: lcd_code = 37;   // /
			8'h29: lcd_code = 0;   // space
			8'h5a: lcd_code = 9'h0C0;  // enter
			8'h66: lcd_code = 9'h108;   // backspace
			8'h0D: lcd_code = 9'h109;   // horizontal tab	
			
			default: lcd_code = 9'h12A; // *
		endcase
		end
	else   // lowercase
		begin
		case(scan_code)
			8'h45: lcd_code = 64;   // 0
			8'h16: lcd_code = 65;   // 1
			8'h1e: lcd_code = 66;   // 2
			8'h26: lcd_code = 67;   // 3
			8'h25: lcd_code = 68;   // 4
			8'h2e: lcd_code = 69;   // 5
			8'h36: lcd_code = 70;   // 6
			8'h3d: lcd_code = 71;   // 7
			8'h3e: lcd_code = 72;   // 8
			8'h46: lcd_code = 73;   // 9
			8'h1c: lcd_code = 38;   // A
			8'h32: lcd_code = 39;   // B
			8'h21: lcd_code = 40;   // C
			8'h23: lcd_code = 41;   // D
			8'h24: lcd_code = 42;   // E
			8'h2b: lcd_code = 43;   // F
			8'h34: lcd_code = 44;   // G
			8'h33: lcd_code = 45;   // H
			8'h43: lcd_code = 46;   // I
			8'h3b: lcd_code = 47;   // J
			8'h42: lcd_code = 48;   // K
			8'h4b: lcd_code = 49;  // L
			8'h3a: lcd_code = 50;   // M
			8'h31: lcd_code = 51;   // N
			8'h44: lcd_code = 52;   // O
			8'h4d: lcd_code = 53;   // P
			8'h15: lcd_code = 54;   // Q
			8'h2d: lcd_code = 55;   // R
			8'h1b: lcd_code = 56;   // S
			8'h2c: lcd_code = 57;   // T
			8'h3c: lcd_code = 58;   // U
			8'h2a: lcd_code = 59;   // V
			8'h1d: lcd_code = 60;   // W
			8'h22: lcd_code = 61;   // X
			8'h35: lcd_code = 62;   // Y
			8'h1a: lcd_code = 63;   // Z
			8'h0e: lcd_code = 27;   // `
			8'h4e: lcd_code = 28;   // -
			8'h55: lcd_code = 29;   // =
			8'h54: lcd_code = 30;   // [
			8'h5b: lcd_code = 31;   // ]
			8'h5d: lcd_code = 32;   // \
			8'h4c: lcd_code = 33;   // ;
			8'h52: lcd_code = 34;   // '
			8'h41: lcd_code = 35;   // ,
			8'h49: lcd_code = 36;   // .
			8'h4a: lcd_code = 37;   // /
			8'h29: lcd_code = 9'h120;   // space
			8'h5a: lcd_code = 9'h0C0;   // enter (jumpline)
			8'h66: lcd_code = 9'h108;   // backspace
			8'h0D: lcd_code = 9'h109;   // horizontal tab	
			
			default: lcd_code = 9'h120; // *
		endcase
		end
	end
endmodule
