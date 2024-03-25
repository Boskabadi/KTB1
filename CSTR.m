function [sys,X_0,str,ts] = CSTR(t,x,u,flag,X_0)

switch flag
    case 0 % initialization;
        sizes = simsizes;
        sizes.NumContStates = 5;
        sizes.NumDiscStates = 0;
        sizes.NumOutputs = 6;
        sizes.NumInputs = 6;
        sizes.DirFeedthrough = 0;
        sizes.NumSampleTimes = 1;
        sys = simsizes(sizes);
        % [36.6608550329467 7.35314939552497 1.48827808348809 0.0992985308159667]
        X_0 = [5000 106.351163614666 14.8096563646109 2.51553709810012 1.20000000000003];
        %X_0 = [90; 0.104; 20; 4; 0];
        str = [];
        ts = [0 0];
    case 1 % derivatives
        % states
        V = x(1);
        C_X_S = x(2);
        C_LAC_S = x(3);
        C_N_S = x(4);
        C_MEV_S = x(5);
        
        % inputs
        
        C_X_F = u(1);
        C_LAC_F = u(2);
        C_N_F = u(3);
        C_MEV_F = u(4);
        Q_IN = u(5);
        Q_OUT = u(6);
        % q_max_MEV = u(7);
        
        % parameter values
        mu_max=0.120; %1/h biomass maximum growth rate
        q_max_MEV=1.9e-4; %g_MEV/g_X/h
        K_MEV=5.42e-6; %g_MEV/g_LAC/g_X/h
        Y_X_LAC=0.483; %g_X/g_LAC
        Y_X_N=20.06; %g_X/g_N
        Y_MEV_LAC=7.06e-4; %g_MEV/g_LAC
        K_LAC=1.63; %g_LAC/g_X 
        K_N=8.84e-2; %g_LAC/g_X
        K_LAC_MEV=13.23; %g_LAC/g_X
        K_I_N=0.158; %g_N/l
        K_I_N_MEV=9.65e-2; %g_N/l
        
        %% "CHANGE ALSO THE d,R AT THE BOTTOM"
        d=0.9; %m diameter of the reactor 
        A=pi/4*d^2; %m^2 tranversal section
        
        mu_1=(mu_max*C_LAC_S/(C_LAC_S+K_LAC*C_X_S)*C_N_S/(C_N_S+K_N*C_X_S));
        Y_LAC_X=1/Y_X_LAC;

        mu_2=(mu_max*C_LAC_S/(C_LAC_S+K_LAC*C_X_S)*C_N_S/(C_N_S+K_N*C_X_S)*K_I_N/(K_I_N+C_N_S));
        Y_LAC_MEV=1/Y_MEV_LAC;

        mu_3=(q_max_MEV*C_LAC_S/(C_LAC_S+K_LAC_MEV*C_X_S)*K_I_N_MEV/(K_I_N_MEV+C_N_S));
        Y_N_X=1/Y_X_N;
        
        h=(V/1000)/A;
        %Q_OUT=(h/R)*1000; %L/h
        %Q_OUT=Q_IN; %L/h

        % state derivatives

        dVdt=(Q_IN-Q_OUT);
        dC_X_Sdt=(mu_1*C_X_S+(Q_IN*C_X_F-Q_OUT*C_X_S-C_X_S*(Q_IN-Q_OUT))/V);
        dC_LAC_Sdt=((-Y_LAC_X*mu_2-Y_LAC_MEV*mu_3)*C_X_S+(Q_IN*C_LAC_F-Q_OUT*C_LAC_S-C_LAC_S*(Q_IN-Q_OUT))/V);
        dC_N_Sdt=((-Y_N_X*mu_1)*C_X_S+(Q_IN*C_N_F-Q_OUT*C_N_S-C_N_S*(Q_IN-Q_OUT))/V);
        dC_MEV_Sdt=((mu_3+K_MEV*C_LAC_S)*C_X_S+(Q_IN*C_MEV_F-Q_OUT*C_MEV_S-C_MEV_S*(Q_IN-Q_OUT))/V);
        
        sys = [dVdt;dC_X_Sdt;dC_LAC_Sdt;dC_N_Sdt;dC_MEV_Sdt];
    case 3 % outputs;
        d=0.9; %m diameter of the reactor
        A=pi/4*d^2; %m^2 tranversal section
        h=(x(1)/1000)/A;
        %Q_OUT=(h/R)*1000; %L/h
        %Q_OUT=2.888; %L/h

        sys = [x(1);x(2);x(3);x(4);x(5);h];
        
        % Valori stazionario (R=280,d=0.4):
        % h=[0.716 m], Q_IN=Q_OUT=[2.558 L/h], C_MEV_S=[0.0985 g/L], V=[90 L]
        
    case {2, 4, 9}
        sys = [];
    otherwise
        error(['unhandled flag = ',num2str(flag)]);
end