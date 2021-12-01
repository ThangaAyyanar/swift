#!/bin/sh
read DAY
DIRPATH="Day $DAY"
mkdir "$DIRPATH"
cd "$DIRPATH"
#swift package init --type=executable
swift package init
