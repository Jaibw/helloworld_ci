#!/bin/bash

version=`cat version`
buildfolder=helloworld_$version

make all

mkdir $buildfolder
mkdir $buildfolder/usr
mkdir $buildfolder/usr/local
mkdir $buildfolder/usr/local/bin
cp bin/helloworld $buildfolder/usr/local/bin

mkdir $buildfolder/DEBIAN

sed "s/versionnumber/$version/g" pkginfo > control
cp control $buildfolder/DEBIAN/control


dpkg-deb --build $buildfolder