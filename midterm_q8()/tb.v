module tb;
    reg start, clk, car_entered, is_uni_car_entered, car_exited, is_uni_car_exited;
    wire [8:0] uni_parked_car;
    wire [8:0] parked_care;
    wire [8:0] uni_vacated_space;
    wire [8:0] vacated_space;
    wire uni_is_vacated_space; 
    wire is_vacated_space;

    parking parking_inst (
        .start(start),
        .clk(clk),
        .car_entered(car_entered),
        .is_uni_car_entered(is_uni_car_entered),
        .car_exited(car_exited),
        .is_uni_car_exited(is_uni_car_exited),
        .uni_parked_car(uni_parked_car),
        .parked_care(parked_care),
        .uni_vacated_space(uni_vacated_space),
        .vacated_space(vacated_space),
        .uni_is_vacated_space(uni_is_vacated_space),
        .is_vacated_space(is_vacated_space)
    );

    initial begin
        clk = 0;
        forever #50 begin
            clk = ~clk;
            #1;
            clk = ~clk;
        end
    end
    integer i, j, k, l;
    initial begin
        // initial
        car_entered = 0;
        is_uni_car_entered = 0;
        car_exited = 0;
        is_uni_car_exited = 0;
        // start the program
        start = 1;
        #30;
        start = 0;
        #10;

        for (i = 0; i < 5; i = i + 1) begin
            car_entered = 1;
            is_uni_car_entered = 1;
            #3;
            car_entered = 0;
            #3;
        end
        #15;

        for (j = 0; j < 5; j = j + 1) begin
            car_entered = 1;
            is_uni_car_entered = 0;
            #3;
            car_entered = 0;
            #3;
        end
        #15;

        for (k = 0; k < 3; k = k + 1) begin
            car_exited = 1;
            is_uni_car_exited = 1;
            #3;
            car_exited = 0;
            #3;
        end
        #15;

        for (l = 0; l < 3; l = l + 1) begin
            car_exited = 1;
            is_uni_car_exited = 0;
            #3;
            car_exited = 0;
            #3;
        end
        #15;
        $stop();
    end

    initial begin
        $monitor($time, ": (clk = %b, start = %b, car_entered = %b, is_uni_car_entered = %b, car_exited = %b, is_uni_car_exited = %b)", clk, start, car_entered, is_uni_car_entered, car_exited, is_uni_car_exited,
            "(uni_parked_car = %d, parked_car = %d, uni_vacated_space = %d, vacated_space = %d, \n\t\t uni_is_vacated_space = %d, is_vacated_space = %d)\n", uni_parked_car, parked_care, uni_vacated_space, vacated_space, uni_is_vacated_space, is_vacated_space);
    end
endmodule