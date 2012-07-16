These are my dotfiles. They are stored on GitHub using a technique described by Silas Sewell.
The following is copied from the original (http://silas.sewell.org/blog/2009/03/08/profile-management-with-git-and-github/) and stored here for posterity.



Profile Management with Git and GitHub
======================================

The following describes a simple way to manage you profile configuration files using GitHub.

Features
--------

Centralized configuration management
Files live in their native locations (no symbolic linking)
Home directory is not a Git repository
All the power of git with a simple alias

Setup Repository
----------------

Log into GitHub and create a repository named config

Add your public keys to GitHub (if you haven't done so already)

Open a terminal and switch to your home directory

    cd ~

Create a configuration directory

    mkdir .config.git

Add the following alias to your current session and your .bash_profile

    alias config='git --git-dir=$HOME/.config.git/ --work-tree=$HOME'  
    echo "alias config='git --git-dir=$HOME/.config.git/ --work-tree=$HOME'" >> .bash_profile

Add your .bash_profile to the configuration repository

    config add .bash_profile
    
Commit the changes

    config commit -m 'Initial commit'
    
Change the origin to GitHub

    config remote add origin git@github.com:GITHUB_USERNAME/config.git
    
Push the changes

    config push origin master
    
If you get an error when running config pull to the effect of You asked me to pull without... run the follow:

    echo -e '[branch "master"]\n  remote = origin\n  merge = refs/heads/master' >> ~/.config.git/config
    
Setup Configuration Management on a Different System
----------------------------------------------------

Add your public keys to GitHub (if you haven't done so already)

Switch to your home directory

    cd ~
    
Backup your local configuration files, example:

    mv .bash_profile .bash_profile.bk
    
Clone your configuration repository

    git clone git@github.com:GITHUB_USERNAME/config.git config.git
        
Move the git metadata to ~/.config.git

    mv config.git/.git .config.git
    
Enable dotglob

    shopt -s dotglob
    
Move your configuration files to your home directory

    mv -i config.git/* .
        
Delete the config.git directory

    rmdir config.git
    
Logout and log back in

Basic Usage
`config pull` - get latest configuration changes
`config add FILENAME` - add a configuration file
`config commit -a` - save all configuration changes
`config push` - push configuration changes to GitHub
and any other `config GIT_OPTION`
You can see my configuration repository at http://github.com/silas/config.

Source: Manage your $HOME with git by Robert Escriva

