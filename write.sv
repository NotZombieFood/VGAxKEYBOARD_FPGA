module write(
	input clk,
	input rst,
	input rst_2,
	input [9:0] teclado,
	input done,
	output [9:0] address,
	output en_mem,
	output [9:0] wr_data_mem
);
assign address = ((columna-1) + ((linea-1)*40));

logic ignorar;
logic puntero;
logic borrar;
logic [6:0] linea;
logic [9:0] columna;

always_ff @ (posedge clk) begin
		if (rst_2) begin
			en_mem <= 1;
			puntero <= 0;
			wr_data_mem <= 0;
			columna <= columna + 1;
			borrar <= 0;
		end
		else if (rst) begin
			en_mem <= 0;
			puntero <= 0;
			wr_data_mem<= 0;
			linea <= 1;
			columna <= 0;
			en_mem <= 0;
			borrar <= 0;
			ignorar <= 0;
		end
		else if (done) begin
			if (ignorar == 1)  begin       //Ignorar
				en_mem <= 0;
				ignorar <= 0;
			end
			else begin
				if (teclado == 9'h 0f0) begin  //Soltar tecla
					en_mem <= 0;
					ignorar <= 1;
				end
				else if (teclado == 9'h 0c0) begin   //Enter
					en_mem <= 0;
					columna <= 0;
					if (linea < 15) 
						linea <= linea +1;
					else
						linea <= 1;
				end
			/*	else if (teclado == 9'h 108) begin    //Borrar
					en_mem <= 1; 
					wr_data_mem <= 0;
					borrar <= 1;
				
				end*/
				else begin
				if (columna < 41)
						columna <= columna + 1;
					else begin
						columna <= 1;
						if (linea < 15) 
							linea <= linea + 1;
						else 
							linea <= 1;
					end
				if (teclado <26 ) begin
					en_mem <= 1;
					wr_data_mem <= teclado;
				end
				else 
					en_mem <= 0;
				end
			end
			
		end
		else begin
			en_mem <= 0;
			/*if (borrar) begin
				if (columna > 1)
					columna <= columna - 1;
				else begin
					columna <= 40;
					if (linea > 1) 
						linea <= linea - 1;
					else 
						linea <= 15;
				end
			end
			*/
		end
end

endmodule 