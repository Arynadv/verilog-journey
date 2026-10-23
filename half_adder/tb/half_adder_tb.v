`timescale 1ns / 1ps

module half_adder_tb;

    reg  a;
    reg  b;
    wire sum;
    wire carry;

    half_adder uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        $dumpfile("half_adder.vcd");
        $dumpvars(0, half_adder_tb);

        $display("Time\ta\tb\t|\tsum\tcarry");
        $display("---------------------------------");
        $monitor("%0t\t%b\t%b\t|\t%b\t%b", $time, a, b, sum, carry);

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $display("Simulation complete.");
        $finish;
    end

endmodule
