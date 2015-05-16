%% This function is to preprocess the frame before starting the encoding procedure
function obj = preprocess(obj) %% Function to split the frames into two different patterns
	obj.cur_subfrm1 = obj.cur_frame(0*obj.SUB_FRM_SIZE+1:1*obj.SUB_FRM_SIZE);
	obj.cur_subfrm2 = obj.cur_frame(1*obj.SUB_FRM_SIZE+1:2*obj.SUB_FRM_SIZE);
end
