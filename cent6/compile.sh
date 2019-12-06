cd sbcl
git checkout sbcl-$1
patch < ../patch
echo "\"$1\"" > version.lisp-expr
./cross-make.sh -p `vagrant ssh-config|grep Port|awk '{ print $2 }'` sync \
    `vagrant ssh-config|grep "User " |awk '{ print $2 }'`@`vagrant ssh-config|grep "HostName" |awk '{ print $2 }'` /tmp/sbcl
vagrant ssh -c "cd /tmp;ln -s sbcl sbcl-$1;sbcl/binary-distribution.sh sbcl-$1;bzip2 sbcl-$1-binary.tar"
scp -P `vagrant ssh-config|grep Port|awk '{ print $2 }'` `vagrant ssh-config|grep "User " |awk '{ print $2 }'`@`vagrant ssh-config|grep "HostName" |awk '{ print $2 }'`:/tmp/sbcl-$1-binary.tar.bz2 ..
