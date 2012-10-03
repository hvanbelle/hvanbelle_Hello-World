#!/bin/sh

find . -maxdepth 1 -type f -mtime 5 -exec mv {} /var/log/tst \;
