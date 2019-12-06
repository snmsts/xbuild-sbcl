#!/bin/sh
vagrant up
vagrant upload  ~/.ssh/id_rsa.pub
vagrant ssh -c "cat id_rsa.pub >> ~/.ssh/authorized_keys"
[ -e sbcl ] || git clone https://github.com/sbcl/sbcl
mkdir -p sbcl/output
cp build-config sbcl/output
