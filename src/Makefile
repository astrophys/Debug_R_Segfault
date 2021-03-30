CXX = /usr/local/bin/g++-9
CPPFLAGS = -I/usr/local/Cellar/r/3.6.3_1/lib/R/include -I/Users/asnedden/.R/3.6.3-lib/Rcpp/include -I/usr/local/opt/gettext/include  -I/usr/local/opt/readline/include -I/usr/local/include
CXXFLAGS = -ggdb -O0 -fPIC
OBJ_DIR = .
OBJ = $(OBJ_DIR)/RcppExports.o $(OBJ_DIR)/code.o
LDFLAGS = -L/usr/local/opt/gettext/lib -L/usr/local/opt/readline/lib -L/usr/local/lib -L/usr/local/Cellar/r/3.6.3_1/lib/R/lib -L/usr/local/opt/gettext/lib -L/usr/local/opt/readline/lib -L/usr/local/lib 

all :  debug.Compiled.R.Packages.so 

%.o : %.cpp
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

debug.Compiled.R.Packages.so : $(OBJ)
	$(CXX) -dynamiclib -Wl,-headerpad_max_install_names -undefined dynamic_lookup -single_module -multiply_defined suppress $(LDFLAGS) -o debug.Compiled.R.Packages.so $(OBJ) 

clean : 
	rm -f $(OBJ) debug.Compiled.R.Packages.so 
