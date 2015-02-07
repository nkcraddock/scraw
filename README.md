# nkcraddock/scraw
`nkcraddock/scraw` is a docker container with my development environment set up on it. 
It is based on [phusion/baseimage](http://phusion.github.io/baseimage-docker).

![SCRAWWW](http://i.imgur.com/EJKiGWX.png)

####Features
* From `phusion/baseimage` we get **init**, **syslogd**, **sshd**, and some other goodies to make the container feel more like a VM
* I added some tools that I use for development like **git**, **vim**, **curl**, **wget**, **mercurial**, **ruby1.9.1**, 
**homesick**, and **golang**

####Dependencies
* [docker](https://www.docker.com/)
* [docker-ssh](https://github.com/phusion/baseimage-docker#docker_ssh) (optional) - used to ssh directly to the containers without having to lookup their ip address

####How to use it
````
$ sudo docker pull nkcraddock/scraw
$ sudo docker run -d --name scraw nkcraddock/scraw
$ sudo docker-ssh scraw
root@899e0eeea86d:~# ~/init_homesick
````

    
