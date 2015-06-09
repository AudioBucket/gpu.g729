% Function to generate the lpc coefficients 
function obj = gen_lpc(obj) 
	% The LPC coefficients are generated using the LPC 
	% obj.lpc_coeff = lpc(obj.cur_frame,10);
  auto_corr(obj); % Get the autocorrelation coefficients

  % Use levinson method to get the coefficients
  obj.a = levinson(obj.r_dash);
end % End of the function 

