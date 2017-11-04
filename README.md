docker-adb 
==========
Google's 'adb' tool isolated in a small docker container, based on 'alpine' Linux (~7MB, compared to Ubuntu: 180MB)

How to install:
---------------
* Clone repository: `git clone git@github.com:num1r0/docker-adb.git`
* Run setup script: `./setup.sh`

What `setup.sh` does:
---------------------
* Builds docker image: `docker build -t adb/alpine:latest .`
* Creates alias for 'adb': `alias adb='docker run --rm -it --device=/dev/bus/usb/001/006 --name adbhost adb/alpine'`

Delete 'adb/alpine' image:
--------------------------
docker rmi adb/alpine

Delete all existing images
--------------------------
docker images -q --filter dangling=true | xargs docker rmi
