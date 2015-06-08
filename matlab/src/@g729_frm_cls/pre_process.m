%% This function is to preprocess the frame before starting the encoding procedure
function obj = preprocess(obj) %% Function to split the frames into two different patterns
	obj.cur_subfrm1 = obj.cur_frame(0*obj.C_Sb_Frm_sz+1:1*obj.C_Sb_Frm_sz);
	obj.cur_subfrm2 = obj.cur_frame(1*obj.C_Sb_Frm_sz+1:2*obj.C_Sb_Frm_sz);
end
