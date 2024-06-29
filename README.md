
![image](https://github.com/oAmirrezao/Digital_System_Design/assets/119684561/c8c27dce-f2e6-4e59-bcb7-64462d91dfd6)




# Parking

Our Project is a Parking that is capable of handling logic of a special parking for a university.


## Tools
In this section, you should mention the hardware or simulators utilized in your project.
- Modelsim
- Quartus


## Implementation Details

When posedge start happens, i.e. the start key is pressed, program values ​​are initialized.
Next, if we see the rising edge of the clock, it means that one hour has passed. For example, if we are at 10 o'clock and see the rising edge of the clock, it will be 11 o'clock.
Now, according to the time we are in, we decide what values ​​to give to our variables. If the hour was less than 13 (ie less than 12), the capacities do not change. If the hour was between [13, 15], according to the question, 50 cars will be added to the parking capacity of free cars every hour. For example, when the clock changes from 12 to 13, the free capacity changes from 200 people to 250 people. Finally, at 15:00, the free capacity is equal to 350 cars. Then, at 4:00 p.m., the capacity of free cars will increase to 500 cars. And after that hour, there will be no change in the capacity of the cars.
According to the logic we have implemented, the rising edge has priority over the rising edge of car_entered and car_exited. And naturally, this is not the only way to implement this program. Another can be taken.
Finally, if we see posedge car_entered or posedge car_exited, we act as described below.
If we see posedge car_entered or posedge car_exited, it means that a car is about to enter or leave the parking lot. (In the logic that we have implemented, it is possible for two cars to enter and exit at the same time. That is, one car can enter and another car can leave at the same time. Like real parking lots.)
If car_entered was equal to 1, we pay attention to its type, that is, whether that car belongs to the university staff or a free car. And according to the type of car and parking capacity for each section, we decide whether that car will enter the parking lot or not.
But for car_exited, because it doesn't matter if the parking lot is full, the car will leave it in any case, and according to the type of car (free or owned by the university), the capacity of that section will be increased by one.

(Note that according to the values ​​that the variables are supposed to store, their type and number of bits are determined. For example, because the maximum capacity at all hours for university cars or free cars is 500, a 9-bit register for them in We considered that they can store all the values.)


Feel free to use sub-topics for your projects. If your project consists of multiple parts (e.g. server, client, and embedded device), create a separate topic for each one.

## How to Run

To run the application first download the folder. then open it(file which its name is project) in modelsim app. then right click on any file and click on the compile all option. wait some seconds. then on top bar of modelsim click on Simulate option and click on start simulation option. then find the work folder and click on the plus next to the work folder. then click on ok and after some seconds add parts which you want to see from view on top bar of modelsim. for examle you can add wave. after that on top bar of modelsim find the Run_all option and click on it. that all.


and Here is a screenshot of running Modelsim:

![image](https://github.com/oAmirrezao/Digital_System_Design/assets/119684561/978f8285-1ed4-4f92-9cec-a59201c50e8d)

![image](https://github.com/oAmirrezao/Digital_System_Design/assets/119684561/9e976f68-e5c6-4f0f-bb9c-386fc6b02474)

![image](https://github.com/oAmirrezao/Digital_System_Design/assets/119684561/b75968df-bfe8-4e66-b4e5-043d7deee999)

![image](https://github.com/oAmirrezao/Digital_System_Design/assets/119684561/5e94c8ba-63f1-467c-b387-43b2d251aae1)

For the second part do following steps:
First after downloading quartus app open it. (I have been downloaded quartus II version)
then following window will show to you:
![image](https://github.com/oAmirrezao/Digital_System_Design/assets/119684561/e646f8a1-c012-4e6d-b5d5-a050bf17be7b)
Click on Next.
At the next window which is as follows put project path(any path you like) in the part 1. and put project name in the part 2 and 3.
![image](https://github.com/oAmirrezao/Digital_System_Design/assets/119684561/ec885cd9-5d4a-4e3c-82b5-5cd96e441246)
Click on Next. in the next window click on Next.
then in following window choose your device.(first sure that this device is installed in your system.)
![image](https://github.com/oAmirrezao/Digital_System_Design/assets/119684561/dc9ff292-c06f-4f0f-84cb-a1af3166768a)
And click Next. in the next window click on Next. Your projejct has been created.
Now in Quartus app go as follows:
![image](https://github.com/oAmirrezao/Digital_System_Design/assets/119684561/03e750ac-fea1-4101-8257-7461ff73f033)
Click on part 1 of previous image and make a Verilog HDL File. Copy parking verilog code of section 1 of this questions.(Don't copy test bench.)
And save the file.
Then right click on part 2 of previous image and click on Settings. In new window that will show click on General tab.
And then choose your FPGA from Device button that is in top right of this window. Then choose verilog file name as top level entity.
![image](https://github.com/oAmirrezao/Digital_System_Design/assets/119684561/82621ee6-3ed3-4f54-8d1c-a5c7477cae4b)
Then click on tools from navigation bar.
![image](https://github.com/oAmirrezao/Digital_System_Design/assets/119684561/6891bcbb-b75e-4b78-be33-1cba5d5df1cf)
And run Create timing netlist, Read SDC File and Updata Timing Netlist. Now the maximum frequency is in Report Fmax Summary. And Data delays are in Report Top Falling Paths.
![image](https://github.com/oAmirrezao/Digital_System_Design/assets/119684561/b6370ce2-a277-41fe-bea0-324e336fde49)




## Results
Finally, we implemented the parking project successfully and we can see the results in wave files and VCD files or through the console.
From this exercise, we conclude that the maximum frequency produced by the circuit is equal to the inverse of the minimum delay available in the circuit. 




## Related Links
 - [EDK II](https://github.com/tianocore/edk2)
 - [QEMU](https://www.qemu.org/)
 - [OVMF](https://github.com/tianocore/tianocore.github.io/wiki/OVMF)


## Authors
- [Amirreza Inanloo](https://github.com/oAmirrezao)
