%% Read the constants that are used in the program
constant

%% This file is to read the samples and assign to a variable 
fid = fopen(strcat(fpath,'/SPEECH.IN'),'r');

% Get the raw speech samples
rss = fread(fid,inf,'int16')';
[rss_m,rss_n] = size(rss);

% Sampling rate of the file is 8 KHz. 
% Get the dimension and form the time samples
st = (0:1:rss_n-1); 
st = st.*(1.0/C_Fs);

%% Calculate the global variables for the speech coders
Tframes = floor(rss_n/C_Frm_sz);

% For loop for the total number of frames
for i = 1:Tframes-1
  j = i; % Index for the array
  c(j) = g729_frm_cls;
  c(j).C_wlp = C_wlp;
  if i == 1 
    % When there is no frame available then pad with zeros  
	  c(j).prv_frame = zeros(1,C_Frm_sz); 
  else 
	  c(j).prv_frame = rss((i-2)*C_Frm_sz+1:(i-1)*C_Frm_sz);
  end 

	c(j).cur_frame = rss((i-1)*C_Frm_sz+1:(i+0)*C_Frm_sz);
	c(j).nxt_frame = rss((i+0)*C_Frm_sz+1:(i+1)*C_Frm_sz);
  c(j).encode;
  x= sprintf('Done with loop %d',i);
end

