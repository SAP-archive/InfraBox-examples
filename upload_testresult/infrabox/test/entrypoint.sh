#!/bin/sh

python /test.py
rc=$?

cp results.xml /infrabox/upload/testresult

exit $rc
