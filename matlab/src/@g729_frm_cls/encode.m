%% Call all the routines that are necessary in sequence for the encoder 
%% Sequence are as follows
%% 1. Preprocessing
%% 2. LPC coefficients
function obj = encode(obj) 
  init(obj); 
  pre_process(obj); 
  gen_lpc(obj);
end % End of the function
