% Function to generate the lpc coefficients 
function obj = gen_lpc(obj) 
	% The LPC coefficients are generated using the LPC 
	obj.lpc_coeff = lpc(obj.cur_frame,10);
end % End of the function 

