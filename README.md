# How to install

```bash
cd                                            # go home
git clone https://github.com/touv/.vim        # fetch source
ln -s ~/.vim/vimrc .vimrc                     # install local
cd ~/.vim
git submodule init                            # install submodule
git submodule update
vim +BundleInstall +qall                      # install bundles
vim                                           # enjoy !

```

