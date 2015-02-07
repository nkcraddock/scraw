#nkcraddock/scraw
`nkcraddock/scraw` is a docker container with my development environment set up on it. 
It is based on [phusion/baseimage](http://phusion.github.io/baseimage-docker).

[![SCRAWWW](http://i.imgur.com/EJKiGWX.png)](https://www.youtube.com/watch?v=a3I5h7UaOuk)

#Features
* From `phusion/baseimage` we get **init**, **syslogd**, **sshd**, and some other goodies to make the container feel more like a VM
* I added some tools that I use for development like **git**, **vim**, **curl**, **wget**, **mercurial**, **ruby1.9.1**, 
**homesick**, and **golang**

#Dependencies
* [docker](https://www.docker.com/)
* [docker-ssh](https://github.com/phusion/baseimage-docker#docker_ssh) (optional) - used to ssh directly to the containers without having to lookup their ip address

# Getting Started
###Ubuntu
````
$ sudo docker pull nkcraddock/scraw
$ sudo docker run -d --name scraw nkcraddock/scraw
$ sudo docker-ssh scraw #assuming you have docker-ssh
root@899e0eeea86d:~# ~/init_homesick
````

###OS X with [boot2docker](https://github.com/boot2docker/boot2docker)
You have to expose ssh on the boot2docker vm and connect to that. Feel free to set up a different key. 

````
$ sudo docker pull nkcraddock/scraw
$ sudo docker run -d --name scraw -p 13117:22 nkcraddock/scraw
$ wget -O ./insecure_key https://github.com/phusion/baseimage-docker/raw/master/image/insecure_key
$ ssh root@$(boot2docker ip) -p 13117 -i ./insecure_key
````
