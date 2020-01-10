#!/bin/bash

# Borrowed from https://github.com/Railslide/dotfiles

# .make.sh
# This script creates symlinks from the home directory to the doftiles contained in ~/dotfiles

#### Variables

dir=~/dotfiles
olddir=~/dotfiles_old
#files="bashrc gitignore_global gitconfig"    #files to symlink
files="zshrc gitignore_global gitconfig"    #files to symlink
sublimedir="$HOME/Library/Application Support/Sublime Text 3/Packages/User"
bindir="$HOME/bin"

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"
echo

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"
echo

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    if [ -a  ~/.$file ]; then	 # check if a dotfile already exists
        echo "Moving any existing dotfiles from ~ to $olddir"
        mv ~/.$file $olddir
    fi
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

echo "...done"
echo

# Create symlink for Sublime Text User directory
if [ -d "$sublimedir" ]; then	# check whether the directory already exists
    echo "Sublime settings dir already exists, moving it"
    if [ -L "$sublimedir" ]; then
        echo "Removing old symlink"
        rm "$sublimedir"
        echo "...done"
    else
        echo "Moving the existing Sublime Text Users directory from $sublimedir to $olddir"
        mv "$sublimedir" $olddir
        echo "...done"
    fi
fi
echo "Creating symlink to User in $sublimedir"
ln -s $dir/sublime/Packages/User "$sublimedir"
echo "...done"

# Create symlink for bin directory
if [ -d "$bindir" ]; then   # check whether the directory already exists
    echo "bin dir already exists, moving it"
    if [ -L "$bindir" ]; then
        echo "Removing old symlink for bin dir"
        rm "$bindir"
        echo "...done"
    else
        echo "Moving the existing bin directory from $bindir to $olddir"
        mv "$bindir" $olddir
        echo "...done"
    fi
fi
echo "Creating symlink to bin dir"
ln -s $dir/bin "$bindir"
echo "...done"

