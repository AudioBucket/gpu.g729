% This file defines a class for the frame of the g729 encoder 
classdef g729_frm_cls < handle

  %%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  %% Constants for this function
  %%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  properties (Constant)
    FS = 8e3; % Sample frequency is 8 KHz
		FRM_SIZE=10e-3*g729_frm_cls.FS;
    SUB_FRM_SIZE=g729_frm_cls.FRM_SIZE/2;
    LPC_COEFF_TAB = 10;
    %%---------------------------------------------------------------------
    %% Constants for this G.729 encoder 
    %%---------------------------------------------------------------------
    C_Fs        = 8e3;                                    % Sampling frequency is 8 KHz 
    C_Ts        = 1/g729_frm_cls.C_Fs;                    % Sampling Time interval
    C_10ms      = 10e-3;                                  % 10 Milli Second is the frame interval  
    C_Frm_sz    = g729_frm_cls.C_10ms/g729_frm_cls.C_Ts;  % Number of samples that spans a frame 
    C_Lag_wdw   = 3* g729_frm_cls.C_Frm_sz;               % Number of samples that spans a lag window 
    C_Sb_Frm_sz = g729_frm_cls.C_Frm_sz/2;                % Number of samples that spans a subframe 

    %%---------------------------------------------------------------------
    %% Constants for the low pass filter 
    %%---------------------------------------------------------------------
    %C_b = [+0.92727435e+0/2.0, -0.18544941e+1/2.0, +0.92727435e+0/2.0]; % From the spec
    C_b = [+0.92727435e+0, -0.18544941e+1, +0.92727435e+0];
    C_a = [+1.00000000e+0, +0.19059465e+1, -0.91140240e+0];
	end

  %% Variables that are constants but they are initialized by the init function
  properties (Access = public)
    C_wlp; % Windowing constants
  end 

  %%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  %%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  %% Variables that need to be passed when creating an object 
  %%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	% These variables are related to the Frame of the current window 
	properties 
		prv_frame; % Previous frame raw samples (This should be out of the HP filter)
		cur_frame; % Current frame raw samples
		nxt_frame; % Next frame raw samples
    
    lp_fil_y2; % Low pass filter Y2 component
    lp_fil_y1; % Low pass filter Y1 component
    lp_fil_x2; % Low pass filter X2 component
    lp_fil_x1; % Low pass filter X1 component
	end 

  %%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  %%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  %% Variables that are created during the encoder function  
  %%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	properties (Access = public) 
		cur_subfrm1;   % Subframe 1 samples
		cur_subfrm2;   % Subframe 2 samples
    prp_cur_frame; % Preprocessed current frame
		lpc_coeff;     % Unquantized LPC coefficients (formant filter)
		lpc_err;       % Error magnitued for the LPC coefficients
	end

	% Functions used for this call
	methods (Access = public)
    % Register the functions here 
    obj = init(obj);          % Function to initialize the constant and other variables for the design 
    obj = pre_process(obj);   % Function to do the preprocessing of the speech samples 
		obj = gen_lpc(obj);       % Function to generate the lpc coeffcicients 

    obj = encode(obj);        % Function to encode the samples, and this is the super function that calls all other 
                              % functions
	end


end % End of class definition 


