import sys
from gitUtil import gitClone, install
from collections import namedtuple

Tool = namedtuple("Tool", "repo dir")

GitHubPackages = (Tool("junegunn/fzf.git", ".fzf"),
                  Tool("", ""))

Tools = (
            'git',
            'curl',
            'neovim',
            'silversearcher-ag',
            'ack-grep'
        )
install(Tools)

for tool in GitHubPackages:
    gitClone(tool.repo, tool.dir)



