#!/bin/bash
set -x
cd /opt/opwv/sdmCD/4.1/tests
export test_directory=`pwd`
source properties.env.sh 

PYTHONUNBUFFERED=1 python3.6 -m pytest -m "not devonly" --alluredir=${test_directory}/report --junitxml=/tmp/junit.xml DocStore/test_a_stratum_docstore_initialization.py -vls -vv | tee /proc/1/fd/1
