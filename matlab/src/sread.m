%% This file is to read the samples and assign to a variable 
fid = fopen(strcat(fpath,'/SPEECH.IN'),'r');

% Get the raw speech samples
rss = fread(fid,inf,'int16')';
[rss_m,rss_n] = size(rss);

% Sampling rate of the file is 8 KHz. 
fs = 8e3;

% Get the dimension and form the time samples
st = (0:1:rss_n-1); 
st = st.*(1.0/fs);

%% Calculate the global variables for the speech coders
FRMSIZE = 10e-3/(1/fs);
Tframes = floor(rss_n/FRMSIZE);

% For loop for the total number of frames
for i = 1:Tframes-2
  j = i; % Index for the array
  c(j) = g729_frm_cls;
	c(j).prv_frame = rss((i-1)*FRMSIZE+1:(i+0)*FRMSIZE);
	c(j).cur_frame = rss((i+0)*FRMSIZE+1:(i+1)*FRMSIZE);
	c(j).nxt_frame = rss((i+1)*FRMSIZE+1:(i+2)*FRMSIZE);
  c(j).encode;
end

