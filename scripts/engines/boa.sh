#!/bin/sh

# clone repo to get the git hash
git clone https://github.com/boa-dev/boa.git --depth 1

cd boa
git rev-parse HEAD > ../version.txt
cd ..
rm -rf boa

# download release
curl -L -o boa.tar.gz https://github.com/boa-dev/boa/releases/download/nightly/boa-nightly-x86_64-unknown-linux-gnu.tar.gz
tar -xvf boa.tar.gz
chmod +x boa

./scripts/test262.sh boa "$(pwd)/boa" 24
