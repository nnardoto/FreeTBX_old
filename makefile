# stdlib configuration
stdlib_dir := /home/nathanael/Softwares/Libs/Fortran/stdlib/build
stdlib_lib := $(stdlib_dir)/src
stdlib_mod := $(stdlib_dir)/src/mod_files

# fdflib configuraation
fdflib_dir := /home/nathanael/Softwares/Libs/Fortran/libfdf/lib
fdflib_lib := $(fdflib_dir)/lib
fdflib_mod := $(fdflib_dir)/include/libfdf/GNU-13.2.0/ 

#### COMPILATION DEFINITIONS
FC = gfortran

### SEPARATE FOLDERS
MODDIR := modules
OBJDIR := objects
SRCDIR := source

### FLAGS AND LIBRARIES
FCFLAGS += -J$(MODDIR) 
LIBS = -L$(fdflib_lib) -I$(fdflib_mod) -L$(stdlib_lib) -I$(stdlib_mod) -lfortran_stdlib -lfdf

FreeTBX.x: $(SRCDIR)/FreeTBX.f08 $(OBJDIR)/TBModel.o $(OBJDIR)/TBModel@Configuration.o
	$(FC) $(FCFLAGS) -o $@ $^ $(LIBS)

$(OBJDIR)/TBModel.o: $(SRCDIR)/TBModel.f08 
	$(FC) $(FCFLAGS) -c -o $@ $< $(LIBS)

$(OBJDIR)/TBModel@Configuration.o: $(SRCDIR)/TBModel@Configuration.f08 $(OBJDIR)/TBModel.o 
	$(FC) $(FCFLAGS) -c -o $@ $< $(LIBS)

clean:
	rm $(OBJDIR)/*.o $(MODDIR)/*.mod $(MODDIR)/*.smod *.x


