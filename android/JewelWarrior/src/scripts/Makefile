include Makefile.inc

SRC_DIR		:=	$(SRC_DIR)/scripts
DST_DIR		:=	$(DST_DIR)/scripts

SRC		=	$(SRC_DIR)/loader.coffee		\
			$(SRC_DIR)/app.coffee			\
			$(SRC_DIR)/dom.coffee			\
			$(SRC_DIR)/game.coffee			\
			$(SRC_DIR)/config.coffee		\
			$(SRC_DIR)/board.coffee			\
			$(SRC_DIR)/screen.coffee		\
			$(SRC_DIR)/screen.install.coffee	\
			$(SRC_DIR)/screen.splash.coffee		\
			$(SRC_DIR)/screen.menu.coffee		\
			$(SRC_DIR)/screen.game.coffee		\
			$(SRC_DIR)/screen.scores.coffee		\
			$(SRC_DIR)/screen.about.coffee		\
			$(SRC_DIR)/screen.exit.coffee		\

OBJ		=	$(SRC:.coffee=.js)

%.js: %.coffee
	coffee --compile --bare $<

include Makefile.inc2
