#inclue $(CNSROOT)/config/flexlm.mak


FLEXLM_INST_ROOT=$(CNSROOT)/external/flexNet
FLEXLM_INC_DIR=$(FLEXLM_INST_ROOT)/include
FLEXLM_LIB_DIR=$(FLEXLM_INST_ROOT)/lib
FLEXLM_INCLUDES=-I$(FLEXLM_INC_DIR)
FLEXLM_LIB_FLAGS=$(FLEXLM_LIB_DIR)/lm_new.o -L$(FLEXLM_LIB_DIR) -llmgr -lcrvs -lnoact -llmgr_dongle_stub -lsb

all: retest.o asd.o  my_list.o
	g++  retest.o  asd.o  my_list.o  -o all  $(FLEXLM_LIB_FLAGS)   -ldl -lrt     -lev -L /home/gst/CNSROOT/build/libev-4.15/lib/ 
asd.o: asd.c asd.h
	gcc -c -g asd.c my_list.h -I/home/gst/CNSROOT/external/flexNet/include -lev
retest.o: retest.cpp asd.h  
	g++   -c -g retest.cpp   -lev 
my_list.o: my_list.c my_list.h
	gcc -c -g my_list.c
clean:
	rm retest.o all asd.o my_list.o
