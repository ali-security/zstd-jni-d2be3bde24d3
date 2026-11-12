#!/bin/bash

set -e

sh ./.github/ubuntu-apt-mirror.sh
apt-get update
apt-get install -y gcc

SBT_CMD="test"
./sbt -v "${SBT_CMD}"
