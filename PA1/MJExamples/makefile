#
# @File:      makefile
# @Brief:     Makefile for CS6620
# @Created:   Sep/08/2018
# @Author:    Jiahao Cai
#


JAVA = java
J_FLAG = -jar 

PA2 = PA2Test1

PA3 = PA3Test1 PA3Test2 PA3Test3

PA4 = PA4Test1 PA4Test2 PA4Test3

PA5 = PA5Test1 PA5Test2 PA5Test3

SRC += $(PA2) $(PA3) $(PA4) $(PA5)

dependent = meggy/Meggy.java meggy/MeggyException.java meggy/arg_opts

all: $(SRC:%=%.java.ast.dot) $(SRC:%=%.java.ST.dot)

PA2%.java.ast.dot: PA2%.java $(dependent)
	@echo "Compiling $<..." 
	$(JAVA) $(J_FLAG) MJ_PA2.jar $<
	@echo "--------------------------------------------------------"

PA3%.java.ast.dot: PA3%.java $(dependent)
	@echo "Compiling $<..." 
	$(JAVA) $(J_FLAG) MJ_PA3.jar $<
	@echo "--------------------------------------------------------"

PA4%.java.ast.dot: PA4%.java $(dependent)
	@echo "Compiling $<..." 
	$(JAVA) $(J_FLAG) MJ_PA4.jar $<
	@echo "--------------------------------------------------------"

PA5%.java.ast.dot: PA5%.java $(dependent)
	@echo "Compiling $<..." 
	$(JAVA) $(J_FLAG) MJ_PA5.jar $<
	@echo "--------------------------------------------------------"


run: $(SRC:%=%.class)

%.class: %.java $(dependent)
	@echo "Compiling $<..."
	javac $<
	@echo "Running $<..."
	java $(basename $@)
	@echo "--------------------------------------------------------"


clean: 
	rm -rf $(SRC:%=%.java.ST.dot) $(SRC:%=%.java.ast.dot) $(SRC:%=%.class)
