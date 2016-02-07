#!/bin/bash
find . | grep -P "[\x80-\xFF]"
