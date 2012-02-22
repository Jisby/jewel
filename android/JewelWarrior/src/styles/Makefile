include Makefile.inc

SRC_DIR		:=	$(SRC_DIR)/styles
DST_DIR		:=	$(DST_DIR)/styles

SRC		=	$(SRC_DIR)/fontfaces.less	\
			$(SRC_DIR)/main.less		\
			$(SRC_DIR)/mobile.less		\

OBJ		=	$(SRC:.less=.css)

%.css: %.less
	lessc $< $@

include Makefile.inc2
