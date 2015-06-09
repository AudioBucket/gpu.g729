%% This function is to find the modified auto correlation coefficients r'(i) 
function obj = auto_corr(obj) 
  %% 1. Multiply the samples with the Window LP coefficients 
  s_dash = obj.speech_3frames .* obj.C_wlp;

  %% 2. Find the auto correlation coefficients 
  for k = 1:11 % 10 Tap coefficients are used
    r(k) = sum(s_dash(k:240).*s_dash(1:240-(k-1)));
  end  % End of k for loop

  % 3. The modified autocorellation is formed by multiplying with the wlag constants 
  obj.r_dash = r .* obj.C_wlag;
end % End of the function

