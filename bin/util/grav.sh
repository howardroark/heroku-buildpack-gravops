#!/usr/bin/env bash

install_grav() {
    apt-get install -y unzip
    curl -L https://github.com/getgrav/grav/releases/download/1.0.10/grav-admin-v1.0.10.zip -o /tmp/grav-admin.zip > /dev/null
    if [ `md5sum /tmp/grav-admin.zip | awk '{ print $1 }'` != "6bb6250e7e3cce7c95a78df04478b767" ]
        then exit 1
    fi
    unzip /tmp/grav-admin.zip -d $build_dir
    rm -rf $build_dir/grav-admin/user
    ln -s /app $build_dir/grav-admin/user
}
