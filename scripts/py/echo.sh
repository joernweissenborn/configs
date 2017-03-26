#!/usr/bin/env python3

import sys

TMUX = "tmux"

if __name__ == "__main__":
    print(sys.argv[1])

    call(["ls", "-l"])
