%% This function is to initialize the varaibles for the class 
function obj = init(obj) %% Function to initialize the constant values for the G729 class 

  %% %%---------------------------------------------------------------------
  %% %% Windowing constants that is used for widowing the samples before
  %% %% auto-correlation 
  %% %%---------------------------------------------------------------------
  %% for n=0:obj.C_Lag_wdw
  %%   if(n<200)
  %%     obj.C_wlp(n+1) = 0.54 - (0.46*cos(2*pi*n/399));
  %%   else 
  %%     obj.C_wlp(n+1) = cos(2*pi*(n-200)/159);
  %% 	end
  %% end % End of for loop  


end
