#!/usr/bin/env bash

#
# Copyright 2019 IBM Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

docker images | grep kui-proxy >& /dev/null
if [ $? != 0 ]; then
    echo "no kui-proxy image found; try `npx kui-build-proxy`"
    exit 1
fi

echo 'starting proxy'
docker run -e DEBUG=$DEBUG --name kui-proxy --rm -p 8081:3000 -p 8082:8082 -p 8083:8083 -p 8084:8084 -p 8085:8085 -p 8086:8086 -p 8087:8087 kui-proxy
