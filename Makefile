FILES = \
	~/.config/alacritty/alacritty.yml\
	~/.config/nvim/init.vim

DEST = ./

.PHONY: all
all: copy git

.PHONY: copy
copy: $(FILES)
	cp $^ $(DEST)

.PHONY: git
git:
	git add .
	git commit
	git push
