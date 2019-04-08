#!/bin/bash

MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`

if [ -z "$MY_PATH" ] ; then
  exit 1
fi

[ -f ~/.zshrc ] && [ ! -f ~/.old-zshrc ] && mv ~/.zshrc ~/.old-zshrc

[ -d ~/.zsh.d ] || mkdir ~/.zsh.d

for file in $MY_PATH/lib/*.zsh; do
  [ -L ~/.zsh.d/$(basename $file) ] || ln -s $file ~/.zsh.d/$(basename $file)
done

for file in $MY_PATH/zsh/*; do
  [ -L ~/.zsh.d/$(basename $file) ] || ln -s $file ~/.zsh.d/$(basename $file)
done

[ ! -L ~/.zshrc ] && ln -s "$MY_PATH/.zshrc" ~/.zshrc

echo "ZSH is ready!"