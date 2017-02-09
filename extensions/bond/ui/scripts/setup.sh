#!/bin/bash

# Copyright 2017 Intel Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ------------------------------------------------------------------------------

START_DIR=`pwd`
SCRIPT_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

SERVER_HOME="$SCRIPT_HOME/../server"
CLIENT_HOME="$SCRIPT_HOME/../client"

cd $SERVER_HOME
echo "SETUP: Installing server dependencies..."
./scripts/bootstrap.sh || exit 1

echo "SETUP: Building database..."
./scripts/build.sh || exit 1

cd $CLIENT_HOME
echo "SETUP: Installing client dependencies..."
./scripts/bootstrap.sh || exit 1

echo "SETUP: Compiling client codebase..."
./scripts/build.sh || exit 1

cd $START_DIR
echo "Setup complete."

exit
