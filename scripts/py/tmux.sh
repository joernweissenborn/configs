#!/usr/bin/env python3

import sys
from subprocess import call, run

TMUX = ["tmux"]

NEW_SESSION = TMUX + ["new-session"]
D = "-d"

NEW_SPLIT = TMUX + ["split-window"]
H = "-h"
V = "-v"

ATTACH = TMUX + ["attach"]

def new_detached(name):
    print("making new attached with name '{}'".format(name))
    cmd = NEW_SESSION
    cmd.append(D)
    cmd.append(name)
    print(cmd)
    return cmd

def attach_detached():
    cmd = ATTACH
    cmd.append(D)
    print(cmd)
    return cmd

def new_split(t, c=None):
    cmd = NEW_SPLIT
    cmd.append(t)
    if c is not None:
        cmd.append(c)
    print(cmd)
    return cmd

if __name__ == "__main__":
    run(new_detached("name"))
    run(new_split(V))
    run(attach_detached())

