import os, fnmatch, glob
import pathlib

HOME = os.environ["HOME"]
DOTFILES = pathlib.Path(__file__).parent.parent.resolve()
CONFIG = "config"
SYMLINK = '.symlink'
OLD_VIMRC = ".vimrc"
NEW_VIMRC = "init.vim"
NVIM = "nvim"

print(DOTFILES)
print(len(SYMLINK))


def create_symlink(source, target) -> None:
    """
    :param source: original file, that shall be mirrored
    :param target: symbolic link file that mirrors source file.
    """
    if os.path.isdir(target) or os.path.isfile(target):
        print("Warning: '" + target + "' already exists. Will not be replaced.")
    else:
        print("Creating symbolic link for : '{}' from file '{}'".format(target, source))
        os.symlink(source, target)

for root, dirnames, filenames in os.walk(DOTFILES):
    for filename in fnmatch.filter(filenames, "*" + SYMLINK):
        source = os.path.join(root, filename)
        target_file_name = "." + filename[:-len(SYMLINK)]
        target = os.path.join(HOME, target_file_name)
        create_symlink(source, target)

# neovim structure
CONFIG_DIR = os.path.join(HOME, "." + CONFIG)
if not os.path.isdir(CONFIG_DIR):
    print("Creating folder '{}'".format(CONFIG_DIR))
    os.mkdir(CONFIG_DIR)

for root, dirnames, filenames in os.walk(os.path.join(DOTFILES, CONFIG)):
    for dir in dirnames:
        source = os.path.join(root, dir)
        target = os.path.join(CONFIG_DIR, dir)
        create_symlink(source, target)
    break

# make sure old vimrc file is copied
create_symlink(os.path.join(DOTFILES, CONFIG, NVIM, NEW_VIMRC), os.path.join(HOME, OLD_VIMRC))

