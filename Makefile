#!/usr/bin/make -f

# Makefile Notes
#   $@ is the name of the current target
#   $< is the name of the first prerequisite
#   $^ is the list of the all prerequisites (space-deliminated)
#   tabs _must_ be used for indentation

# store source files in this directory
DIR_INPUT=src
# store build files in this directory
DIR_OUTPUT=build
# store course xml in this file
XML_COURSE=course.xml
# intermediary build file (all python files cat'ed together)
OBJ_PYTHON=inline.py
# these files will be concatenated together, in the order listed
SRC_PYTHON=src/lib.py src/main.py

# insert python inline after the open script tag
$(DIR_OUTPUT)/$(XML_COURSE): $(DIR_OUTPUT)/$(OBJ_PYTHON) $(DIR_INPUT)/$(XML_COURSE)
	sed '/<script type="loncapa\/python">/r $<' $(DIR_INPUT)/$(XML_COURSE) > $(DIR_OUTPUT)/$(XML_COURSE)

# concatenate all source python files together
$(DIR_OUTPUT)/$(OBJ_PYTHON): $(SRC_PYTHON)
	cat $^ > $@

# remove all build files
clean:
	rm $(DIR_OUTPUT)/*

