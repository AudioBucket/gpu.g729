%% This function is to preprocess the frame before starting the encoding procedure
function obj = preprocess(obj) %% Function to split the frames into two different patterns
  %%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  %% Split the frames into the prv,cur and nxt frames
  %%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  obj.prv_frame = obj.speech_3frames((0*obj.C_Frm_sz)+1:1*obj.C_Frm_sz);
  obj.cur_frame = obj.speech_3frames((1*obj.C_Frm_sz)+1:2*obj.C_Frm_sz);
  obj.nxt_frame = obj.speech_3frames((2*obj.C_Frm_sz)+1:3*obj.C_Frm_sz);

  %%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  %%                       High Pass Filter
  %%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  %% Now do the high pass filtering on the input samples 
  y2 = obj.lp_fil_y2;
  y1 = obj.lp_fil_y1;
  x1 = obj.lp_fil_x1;
  x2 = obj.lp_fil_x2;

  for i=1:obj.C_Frm_sz
    x0 = obj.cur_frame(i);
    y0 = y1*obj.C_b(1+1) + y2*obj.C_b(2+1) + x0*obj.C_a(0+1) + ...
         x1*obj.C_a(1+1) + x2*obj.C_a(2+1);

    obj.prp_cur_frame(i) = y0;

    %% Now shift the values by 1 
    x2 = x1; x1 = x0; 
    y2 = y1; y1 = y0; 
  end % End for loop

  % Assign the y2,y1,x2 and x1 components for future analysis 
  obj.lp_fil_y2 = y2; obj.lp_fil_y1 = y1;
  obj.lp_fil_x2 = x2; obj.lp_fil_x1 = x1;

  %%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  %%  Assign the subframes for other calculations 
  %%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  %% The frames are split into two subframes 
	obj.cur_subfrm1 = obj.prp_cur_frame(0*obj.C_Sb_Frm_sz+1:1*obj.C_Sb_Frm_sz);
	obj.cur_subfrm2 = obj.prp_cur_frame(1*obj.C_Sb_Frm_sz+1:2*obj.C_Sb_Frm_sz);

end
