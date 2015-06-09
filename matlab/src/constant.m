%% This program is to store the constant values that are used through out the design

%%---------------------------------------------------------------------
%% Constants for this G.729 encoder 
%%---------------------------------------------------------------------
C_Fs        = 8e3;              % Sampling frequency is 8 KHz 
C_F0        = 60;               % F0 is 60 Hz for calculating  
C_Ts        = 1/C_Fs;           % Sampling Time interval
C_10ms      = 10e-3;            % 10 Milli Second is the frame interval  
C_Frm_sz    = C_10ms/C_Ts;      % Number of samples that spans a frame 
C_Lag_wdw   = 3* C_Frm_sz;      % Number of samples that spans a lag window 
C_Sb_Frm_sz = C_Frm_sz/2;       % Number of samples that spans a subframe 

%%---------------------------------------------------------------------
%% Windowing constants that is used for widowing the samples before
%% auto-correlation 
%%---------------------------------------------------------------------
for n=0:C_Lag_wdw-1
  if(n<200)
    C_wlp(n+1) = 0.54 - (0.46*cos(2*pi*n/399));
  else 
    C_wlp(n+1) = cos(2*pi*(n-200)/159);
	end
end

%%---------------------------------------------------------------------
%% Constants for the Wlag
%%---------------------------------------------------------------------
C_wlag(1) = 1.0001;
for n=1:10
  C_wlag(n+1) = exp((-1/2)*2*pi*(C_F0/C_Fs));
end
