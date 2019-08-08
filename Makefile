
LDLIBS = -ldl -lstdc++fs
JAVALIB= -I/usr/lib/jvm/java-11-openjdk-amd64/include -I/usr/lib/jvm/java-11-openjdk-amd64/include/linux/
JAVASERVER=/usr/lib/jvm/java-1.11.0-openjdk-amd64/lib/server/
CXXFLAGS=-ljvm -fPIC 

wraper.so: wraper.cpp 
	git -C dynamicLinker pull || git clone https://github.com/Marqin/dynamicLinker
	make -C dynamicLinker CXX=g++

	g++ -shared -o libwraper.so  -L$(JAVASERVER) $(JAVALIB) ./wraper.cpp $(CXXFLAGS) -LdynamicLinker/ -ldynamicLinker $(LDLIBS)
	
	export LD_LIBRARY_PATH=$(JAVASERVER)
