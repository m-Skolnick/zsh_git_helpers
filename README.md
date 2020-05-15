# zsh_git_helpers

## Description

Oh-my-zsh plugin which provides helpers for common git commands

## Installation

1.  Create folder inside your Oh-My-ZSH directory with custom plugins

        cd ~/.oh-my-zsh/custom/plugins/

2.  Copy plugin files to it

        git clone https://github.com/m-Skolnick/zsh_git_helpers.git

3.  Activate the plugin in your ZSH config file

        vim ~/.zshrc

4.  Add the below line \*\*\*Or add to existing plugins list

        plugins=(zsh_git_helpers)

5.  Reload oh-my-zsh

        source ~/.zshrc

You will now be able to use the plugin

## Usage

1.  Checkout any git branch

        git checkout <branch1>

2.  Run Command

        pull_and_merge <any-branch>
