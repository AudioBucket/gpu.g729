## This make file is to create the sample file

FILE1=samples.tar.gz.01
FILE2=samples.tar.gz.02
FILE3=samples.tar.gz.03

samples.tar.gz: $(FILE1) $(FILE2) $(FILE3) 
		cat $(FILE1) $(FILE2) $(FILE3) > samples.tar.gz;

samples: samples.tar.gz
		tar -xzf samples.tar.gz

clean:
		rm -rf samples.tar.gz samples
	
all : clean samples

