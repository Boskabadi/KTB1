function [sys,x0,str,ts] = tank_funct_2(t,x,u,flag)
  
switch flag,

  %%%%%%%%%%%%%%%%%%
  % Initialization %
  %%%%%%%%%%%%%%%%%%
  case 0,
    [sys,x0,str,ts]=mdlInitializeSizes();

  %%%%%%%%%%%%%%%
  % Derivatives %
  %%%%%%%%%%%%%%%
  case 1,
    sys=mdlDerivatives(t,x,u);

  %%%%%%%%%%%
  % Outputs %
  %%%%%%%%%%%
  case 3,
    sys=mdlOutputs(t,x,u);

  %%%%%%%%%%%%%%%%%%%
  % Unhandled flags %
  %%%%%%%%%%%%%%%%%%%
  case { 2, 4, 9 },
    sys = [];

  %%%%%%%%%%%%%%%%%%%%
  % Unexpected flags %
  %%%%%%%%%%%%%%%%%%%%
  otherwise
    DAStudio.error('Simulink:blocks:unhandledFlag', num2str(flag));

end
% end csfunc

%
%=============================================================================
% mdlInitializeSizes
% Return the sizes, initial conditions, and sample times for the S-function.
%=============================================================================
%
function [sys,x0,str,ts]=mdlInitializeSizes()
sizes = simsizes;
sizes.NumContStates  = 4;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 4;
sizes.NumInputs      = 5;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;

sys = simsizes(sizes);
x0  = [100 77.9147273128573 8.70229331707566 10.9999999999846];
str = [];
ts  = [0 0];

% end mdlInitializeSizes
%
%=============================================================================
% mdlDerivatives
% Return the derivatives for the continuous states.
%=============================================================================
%
function sys=mdlDerivatives(t,x,u)

 %states
 
 V = x(1);
 C_LAC_tank = x(2);
 C_N_tank = x(3);
 C_MEV_tank = x(4);
        
 % the inputs are
 
 Q_T = u(1);
 C_LAC_T = u(2);
 C_N_T = u(3);
 C_MEV_T = u(4);
 Q_OUT = u(5);
 
 % parameter values
         
 dVdt=Q_T-Q_OUT;
 dC_LAC_dt=(C_LAC_T*Q_T-C_LAC_tank*Q_OUT-C_LAC_tank*(Q_T-Q_OUT))/V;
 dC_N_dt=(C_N_T*Q_T-C_N_tank*Q_OUT-C_N_tank*(Q_T-Q_OUT))/V;
 dC_MEV_dt=(C_MEV_T*Q_T-C_MEV_tank*Q_OUT-C_MEV_tank*(Q_T-Q_OUT))/V;

sys = [dVdt;dC_LAC_dt;dC_N_dt;dC_MEV_dt];

% end mdlDerivatives

function sys=mdlOutputs(t,x,u)

sys = [x(1);x(2);x(3);x(4)];

% end mdlOutputs