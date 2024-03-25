
clc;
clear;
close all;

%scenarios
%% Fault 1 to 4 implemented on one input variable, therefore it is impossible for them to occure at the same time
%Continous steady state for lactose  %0:inactive; 
%Fault 1                             %1:active; 
%Fault 2                             %2:active; 
%Fault 3                             %3:active; 
%Fault 4                             %4:active;
set_param('KTB1_F/Clac', 'Value', '1');

%% Fault 5 to 8 implemented on one input variable, therefore it is impossible for them to occure at the same time
%Continous steady state for Adenine  %0:inactive;
%Fault 5                             %1:active; 
%Fault 6                             %2:active; 
%Fault 7                             %3:active; 
%Fault 8                             %4:active;
set_param('KTB1_F/Cn', 'Value', '0');
%% Fault 9 to 12

%Fault 9      %0:inactive;  1:active
set_param('KTB1_F/RFC', 'Value', '0');
%Fault 10     %0:inactive;  1:active
set_param('KTB1_F/ClovC', 'Value', '0');
%Fault 11     %0:inactive;  1:active
set_param('KTB1_F/ClovrC', 'Value', '0');
%Fault 12     %0:inactive;  1:active
set_param('KTB1_F/TC', 'Value', '0');
%run
sim('KTB1_F.slx')

