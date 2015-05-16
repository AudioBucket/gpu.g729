%% Call all the routines that are necessary in sequence for the encoder 
%% Sequence are as follows
%% 1. Preprocessing
%% 2. LPC coefficients
function obj = encode(obj) 
	obj.preprocess();
	obj.gen_lpc();
end % End of the function
