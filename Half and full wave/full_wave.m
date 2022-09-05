t = 0:0.01:1;                 %% Define the time interval t.
R = 50000;C =250*10^(-6);     %% Define the value of Resistance R and capacitance C.
Vm = 100;                     %% Maximum value of source voltage.
Vs = Vm*sin(160*pi*t);        %% Source voltage with frequency (160*pi)
PP = 2*Vm                     %% Peak to peak voltage (PP)
DC = (2*Vm)/pi                %% Output DC voltage (DC)
T = R*C                       %% Discharge time (T)
Tr = (2*pi)/(160*pi) 


plot(t, DC) 