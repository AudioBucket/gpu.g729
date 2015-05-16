%% Add the search path to the matlab

%% The project directory variables
projdir = getenv('PROJ_DIR');
fpath=strcat(projdir,'/matlab/vectors');

%% Update the path variables
path(path,projdir);
path(path,strcat(projdir,'/matlab'));
path(path,strcat(projdir,'/matlab/src'));
%path(path,strcat(projdir,'/matlab/src/class'));
path(path,strcat(projdir,'/matlab/wk'));
