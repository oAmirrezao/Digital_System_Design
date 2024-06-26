module parking(start, clk, car_entered, is_uni_car_entered, car_exited, is_uni_car_exited,
            uni_parked_car, parked_care, uni_vacated_space, vacated_space, uni_is_vacated_space, is_vacated_space);

    // we can make our program synchronous
    // by adding clock signal to our architecture
    integer hour = 8; 
    input start, clk, car_entered, is_uni_car_entered, car_exited, is_uni_car_exited;
    output reg [8:0] uni_parked_car;
    output reg [8:0] parked_care;
    output reg [8:0] uni_vacated_space;
    output reg [8:0] vacated_space;
    output reg uni_is_vacated_space; 
    output reg is_vacated_space;

    always @(posedge start or posedge clk or posedge car_entered or posedge car_exited) begin
        // hour 8 means 8 till 9
        // means this range : 8 = [8, 9]
        // after pressign start button
        // logic starts to execute
        // parking starts at 8 AM
        if (start) begin
            uni_parked_car = 0;
            parked_care = 0;
            uni_vacated_space = 500;
            vacated_space = 200;
            uni_is_vacated_space = 1;
            is_vacated_space = 1;
        end
        if (clk) begin
            hour = hour + 1;
            if (hour < 13) begin
                // do nothing
            end else if (hour < 16) begin
                // increment capacity for non uni cars
                // if more than 450 uni cars were in parking
                // means we must exit some of them
                // to can place other non uni cars
                if (uni_parked_car > (500 - (hour - 12) * 50)) begin
                    uni_parked_car = 500 - (hour - 12) * 50;
                    uni_vacated_space = 0;
                    vacated_space = vacated_space + 50;
                    uni_is_vacated_space = 0;
                    is_vacated_space = 1;
                end else begin
                    uni_vacated_space = uni_vacated_space - 50;
                    vacated_space = vacated_space + 50;
                    is_vacated_space = 1;
                end
            end else if (hour == 16) begin
                // non uni car capacity reaches to 500
                if (uni_parked_car > 200) begin
                    uni_parked_car = 200;
                    uni_vacated_space = 0;
                    vacated_space = vacated_space + 150;
                    uni_is_vacated_space = 0;
                    is_vacated_space = 1;
                end else begin
                    uni_vacated_space = uni_vacated_space - 150;
                    vacated_space = vacated_space + 150;
                    is_vacated_space = 1;
                end
            end else begin
                // do nothing
            end
        end else begin
        if (car_entered) begin
            if(is_uni_car_entered) begin
                if (uni_is_vacated_space) begin 
                    uni_vacated_space =  uni_vacated_space - 1;
                    uni_parked_car = uni_parked_car + 1;
                    if (uni_vacated_space-1 < 0) begin
                        uni_is_vacated_space = 0;
                    end
                end else begin
                    uni_vacated_space = uni_vacated_space;
                    uni_parked_car = uni_parked_car;
                end
            end else begin
                if (is_vacated_space) begin
                    vacated_space = vacated_space - 1;
                    parked_care = parked_care + 1;
                    if (vacated_space-1 < 0) begin
                        is_vacated_space = 0;
                    end
                end else begin
                    vacated_space = vacated_space;
                    parked_care = parked_care;
                end
            end
        end
        if (car_exited) begin
            if (is_uni_car_exited) begin
                uni_vacated_space = uni_vacated_space + 1;
                uni_parked_car = uni_parked_car - 1;
                uni_is_vacated_space = 1;
            end else begin
                vacated_space = vacated_space + 1;
                parked_care = parked_care - 1;
                is_vacated_space = 1;
            end
        end else begin
            // do nothing
        end
        end
    end
endmodule