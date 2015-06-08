%% This program is to store the constant values that are used through out the design

%%---------------------------------------------------------------------
%% Constants for this G.729 encoder 
%%---------------------------------------------------------------------
C_Fs        = 8e3;              % Sampling frequency is 8 KHz 
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
%% Constants for the low pass filter 
%%---------------------------------------------------------------------
%C_b = [+0.92727435e+0/2.0, -0.18544941e+1/2.0, +0.92727435e+0/2.0]; % From the spec
C_b = [+0.92727435e+0, -0.18544941e+1, +0.92727435e+0];
C_a = [+1.00000000e+0, +0.19059465e+1, -0.91140240e+0];

