% for A class sensors use simulink model sensor A, and change XXX in file and simulink

clc
clear all

%% sensor parameter
use2ndFcn=1; % select 2nd order (1) or 8th order (0) transfer function

min = 0; %lower measurement limit
max = 2; %upper measurement limit

%2nd order
T90_2 = 5; %response time minutes
T_2 = T90_2/(24*60)/3.89;

%8th order
T90_8 = 20; %response time minutes
T_8 = T90_8/(24*60)/11.7724;

std = 0.025; %standard deviation of noise
noiseseed = use2ndFcn; %noise seed for random generator (mean=0, std=1, sample=1 per minute)
usenoise = 0; %select noise or not (0=no noise, 1=use noise) for sensor
useideal = 1; %select ideal sensor or not (0=non-ideal, 1=ideal) for sensor
useidealac = 1; %select ideal actuator or not (0=non-ideal, 1=ideal) for sensor
%% sensor1 and actuator1 parameter
use2ndFcn_X=1; % select 2nd order (1) or 8th order (0) transfer function

min_X = 0; %lower measurement limit
max_X = 5100; %upper measurement limit

%2nd order
T90_X_2 = 5; %response time minutes
T_X_2 = T90_X_2/(24*60)/3.89;

%8th order
T90_X_8 = 20; %response time minutes
T_X_8 = T90_X_8/(24*60)/11.7724;

std_X = 0.025; %standard deviation of noise
noiseseed_X = use2ndFcn_X; %noise seed for random generator (mean=0, std=1, sample=1 per minute)
usenoise_X = 0; %select noise or not (0=no noise, 1=use noise) for sensor
useideal_X = 1; %select ideal sensor or not (0=non-ideal, 1=ideal) for sensor
useidealac_X = 1; %select ideal actuator or not (0=non-ideal, 1=ideal) for sensor

%% sensor2 and actuator2 parameter
use2ndFcn_XX=1; % select 2nd order (1) or 8th order (0) transfer function

min_XX = 0; %lower measurement limit
max_XX = 2; %upper measurement limit

%2nd order
T90_XX_2 = 5; %response time minutes
T_XX_2 = T90_XX_2/(24*60)/3.89;

%8th order
T90_XX_8 = 20; %response time minutes
T_XX_8 = T90_XX_8/(24*60)/11.7724;

std_XX = 0.025; %standard deviation of noise
noiseseed_XX = use2ndFcn_XX; %noise seed for random generator (mean=0, std=1, sample=1 per minute)
usenoise_XX = 0; %select noise or not (0=no noise, 1=use noise) for sensor
useideal_XX = 1; %select ideal sensor or not (0=non-ideal, 1=ideal) for sensor
useidealac_XX = 1; %select ideal actuator or not (0=non-ideal, 1=ideal) for sensor

%% sensor3 and actuator3 parameter
use2ndFcn_XXX=1; % select 2nd order (1) or 8th order (0) transfer function

min_XXX = 0; %lower measurement limit
max_XXX = 0.05; %upper measurement limit

%2nd order
T90_XXX_2 = 5; %response time minutes
T_XXX_2 = T90_XXX_2/(24*60)/3.89;

%8th order
T90_XXX_8 = 20; %response time minutes
T_XXX_8 = T90_XXX_8/(24*60)/11.7724;

std_XXX = 0.025; %standard deviation of noise
noiseseed_XXX = use2ndFcn_XXX; %noise seed for random generator (mean=0, std=1, sample=1 per minute)
usenoise_XXX = 0; %select noise or not (0=no noise, 1=use noise) for sensor
useideal_XXX = 1; %select ideal sensor or not (0=non-ideal, 1=ideal) for sensor
useidealac_XXX = 1; %select ideal actuator or not (0=non-ideal, 1=ideal) for sensor

%% sensor4 and actuator4 parameter
use2ndFcn_XXXX=1; % select 2nd order (1) or 8th order (0) transfer function

min_XXXX = 0; %lower measurement limit
max_XXXX = 1050; %upper measurement limit

%2nd order
T90_XXXX_2 = 5; %response time minutes
T_XXXX_2 = T90_XXXX_2/(24*60)/3.89;

%8th order
T90_XXXX_8 = 20; %response time minutes
T_XXXX_8 = T90_XXXX_8/(24*60)/11.7724;

std_XXXX = 0.025; %standard deviation of noise
noiseseed_XXXX = use2ndFcn_XXXX; %noise seed for random generator (mean=0, std=1, sample=1 per minute)
usenoise_XXXX = 0; %select noise or not (0=no noise, 1=use noise) for sensor
useideal_XXXX = 1; %select ideal sensor or not (0=non-ideal, 1=ideal) for sensor
useidealac_XXXX = 1; %select ideal actuator or not (0=non-ideal, 1=ideal) for sensor

%% sensor5 and actuator5 parameter
use2ndFcn_XXXXX=1; % select 2nd order (1) or 8th order (0) transfer function

min_XXXXX = 0; %lower measurement limit
max_XXXXX = 15; %upper measurement limit

%2nd order
T90_XXXXX_2 = 5; %response time minutes
T_XXXXX_2 = T90_XXXXX_2/(24*60)/3.89;

%8th order
T90_XXXXX_8 = 20; %response time minutes
T_XXXXX_8 = T90_XXXXX_8/(24*60)/11.7724;

std_XXXXX = 0.025; %standard deviation of noise
noiseseed_XXXXX = use2ndFcn_XXXXX; %noise seed for random generator (mean=0, std=1, sample=1 per minute)
usenoise_XXXXX = 0; %select noise or not (0=no noise, 1=use noise) for sensor
useideal_XXXXX = 1; %select ideal sensor or not (0=non-ideal, 1=ideal) for sensor
useidealac_XXXXX = 1; %select ideal actuator or not (0=non-ideal, 1=ideal) for sensor


% sim('sensor_b0')
% 
% plot(tout,XXXsensor(:,1)); hold on
% plot(tout,XXXsensor(:,5));
% xlim([9.8 10.2])
% ylim([0 15])


