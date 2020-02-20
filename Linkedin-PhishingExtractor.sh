#!/bin/bash

# webarchive (Safari) names and links extractor
# call this script with argument the .webarchive file from Linkedin Org's page -> People -> Wait to load all people -> "Command + s" -> Format: Web Archive

cat $1 | strings | grep -i "org-people-profile-card__profile-title" | nl | awk -F "ember-view\">" '{print $3,"\""$5}' | awk -F "\"" '{print "\"https://www.linkedin.com" $4 "\",\"" $9 "\""}' | gsed 's/\s\s/ /g' | gsed 's/  / /g' | gsed 's/" /"/g'
