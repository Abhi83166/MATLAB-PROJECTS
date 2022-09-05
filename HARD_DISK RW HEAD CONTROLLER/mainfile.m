%{ 
Program for the hard-disk RW head controller
By- ABHISHEK KUMAR JHA TP042929

%}

%{ 

Typical parameters taken for disk drive reader and writer.
PARAMETER               SYMBOL            TYPICAL VALUE
1) Inertia of arm
   and read head.         J                1 N.m.s^2/rad
2) Friction.              b                20 kg/m/s    
3) Amplifier.             Ka               10-1000
4) Armature resistance.   R                1 ohm
5) Motor constant.        Km               5 N.m/A
6) Armature inductance.   L                1 mH

%}

J=1;
b=20;
Ka=100;
Ka1=400;
Ka2=700;
R=1;
Km=5;
L=0.001;
%Numerator is the variable for Laplace transformation of Numerator
Numerator=(Km*Ka);
%Denominator is the variable for Laplace transformation of Denominator
Denominator=[J*R (b*R)+(Km^2) Ka*Km];
%Step variable is the value stored for the transfer function of the Laplace
%transformation
%Below four variables are for the comparison between Different Ka values.
Numerator1=(Km*Ka1);
Denominator1=[J*R (b*R)+(Km^2) Ka1*Km];
Numerator2=(Km*Ka2);
Denominator2=[J*R (b*R)+(Km^2) Ka2*Km];
%Step responses for different Ka Values
Step=tf(Numerator,Denominator);
Step1=tf(Numerator1,Denominator1);
Step2=tf(Numerator2,Denominator2);
%stepplot function used for the step response graph plot of the transfer
%function variable
stepplot(Step,Step1,Step2)
%stepinfo function used for the information of the parameters such as Rise
%time,SettlingTime,SettlingMin, SettlingMax ,Overshoot ,Undershoot,Peak
%and peaktime
S=stepinfo(Step)
S1=stepinfo(Step1)
S2=stepinfo(Step2)
%Making a for loop for the different Values of the PID controller
for i=1:3
 if i==1
 Kp=500;
 Ki=1;
 Kd=30;

Gc=pid(Kp,Ki,Kd);
Result= feedback(Gc*Step,1);
stepinfo(Result)
 end
if i==2
 Kp=1000;
 Ki=1;
 Kd=50;
Gc=pid(Kp,Ki,Kd);
Result1= feedback(Gc*Step,1);

stepinfo(Result1) 
end
if i==3
 Kp=5000;
 Ki=1;
 Kd=500;
Gc=pid(Kp,Ki,Kd);
Result2= feedback(Gc*Step,1);
stepinfo(Result2)
end

end    
%A plot to show teh comparison between the PID values
stepplot(Result,Result1,Result2)



