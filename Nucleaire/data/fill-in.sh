#!/bin/bash
cat $1 <(seq $2) | sort -h | uniq -c
