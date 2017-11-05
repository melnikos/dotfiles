import os
from subprocess import call

GIT_URL = "https://github.com/"


def gitClone(repo, target_dir, root=os.environ["HOME"]):
    if not repo == "":
        target = os.path.join(root, target_dir)
        print("Cloning repository '{}' into '{}'.".format(repo, target))
        call(["git", "clone", os.path.join(GIT_URL, repo), target])
    else:
        print("Warning: invalid arguments: '{}' '{}'".format(repo, target_dir))


def install(list_of_tools):
    for tool in list_of_tools:
        print("Installing " + tool)
        call(["sudo", "apt-get", "install", tool])
