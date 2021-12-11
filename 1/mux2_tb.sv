module mux2_tb;

    logic mux2_d0;
    logic mux2_d1;
    logic mux2_sel;
    logic mux2_z;

    mux2 uut (
        .d0(mux2_d0),
        .d1(mux2_d1),
        .sel(mux2_sel),
        .z(mux_z)
    );

    initial begin
        mux2_d0 = 0;
        mux2_d1 = 0;
        mux2_sel = 0;

        #80
        mux2_d0 = 0;
        mux2_d1 = 0;
        mux2_sel = 1;

        #80
        mux2_d0 = 0;
        mux2_d1 = 1;
        mux2_sel = 0;

        #80
        mux2_d0 = 0;
        mux2_d1 = 1;
        mux2_sel = 1;

        #80
        mux2_d0 = 1;
        mux2_d1 = 0;
        mux2_sel = 1;

        #80
        mux2_d0 = 1;
        mux2_d1 = 0;
        mux2_sel = 0;

        #80
        mux2_d0 = 1;
        mux2_d1 = 1;
        mux2_sel = 0;

        #80
        mux2_d0 = 1;
        mux2_d1 = 1;
        mux2_sel = 1;

    end
endmodule