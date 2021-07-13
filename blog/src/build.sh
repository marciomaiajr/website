#!/bin/sh
FILENAME=${1}
NEWFILE=`echo "${1}" | cut -d'.' -f1`
NEWFILE+=".html"
pandoc --standalone --template ./template.html -f gfm ${FILENAME} -o ${NEWFILE}
mv ${NEWFILE} ../${NEWFILE}
