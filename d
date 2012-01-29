#!/bin/sh

if [ "$#" = "0" ]; then
    du -xhs `\ls -A` | sort -rh | $PAGER
else
    du -xhs "$@" | sort -rh | $PAGER
fi
