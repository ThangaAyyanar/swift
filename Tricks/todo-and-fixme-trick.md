### To Highlight the //TODO: and //FIXME: 

* Go to the Build Phase 
* Click the Plus Icon
* And Select the "New Run Script Phase"
* and in the below Bash Script Type

```
TAGS="TODO:|FIXME:"
echo "searching ${SRCROOT} for ${TAGS}"
find "${SRCROOT}" \( -name "*.swift" \) -print0 \
| xargs -0 egrep --with-filename --line-number --only-matching "($TAGS).*\$" \
| perl -p -e "s/($TAGS)/ warning: \$1/"

```
