import sys
from gitUtil import gitClone, install
from collections import namedtuple

Tool = namedtuple("Tool", "repo dir")

GitHubPackages = (Tool("junegunn/fzf.git", ".fzf"),
                  Tool("", ""))

Tools = (
            'git',
            'silversearcher-ag',
            'ack-grep',
            'tmux',
            'zsh'
        )
hello = "dumm"

install(Tools)

#for tool in GitHubPackages:
#    gitClone(tool.repo, tool.dir)



