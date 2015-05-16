% This file defines a class for the frame of the g729 encoder 
classdef g729_frm_cls < handle

	% These are the input variables for the is class 
	properties 
		prv_frame; % Previous frame raw samples
		cur_frame; % Current frame raw samples
		nxt_frame; % Next frame raw samples
	end 

	% Constant Variables for the frame
  properties (Constant)
    FS = 8e3; % Sample frequency is 8 KHz
		FRM_SIZE=10e-3*g729_frm_cls.FS;
    SUB_FRM_SIZE=g729_frm_cls.FRM_SIZE/2;
    LPC_COEFF_TAB = 10;
	end

	% These variables are generated in this class and they are floating type
	properties (Access = public) 
		cur_subfrm1; % Subframe 1 samples
		cur_subfrm2; % Subframe 2 samples
		lpc_coeff  ; % Unquantized LPC coefficients (formant filter)
		lpc_err    ; % Error magnitued for the LPC coefficients
	end

	% Functions used for this call
	methods (Access = public)
    % Register the functions here 
    obj = encode(obj);
    obj = preprocess(obj);
		obj = gen_lpc(obj);
	end
end % End of class definition 
