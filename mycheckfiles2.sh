#!/bin/bash

echo "Number of hkl files"
find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l

echo "Number of mda files"
find mountains -name "firings.mda" | wc -l

echo "Start Times"
head -1 *slurm*.out

echo "End Times"
tail -n 2 *slurm*.out

aws sns publish --topic-arn arn:aws:sns:ap-southeast-1:565485473173:awsnotify --message "checkfiles2 Done"
