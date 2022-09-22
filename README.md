# non_ros_workshos
A repo where we have all workshops that are not related to ROS located


## FAQ
### Q) How do I SSH into my container?

### A)

 Depending on your system/setup, you have numerous options. On a linux (and maybe unix) based systems, simply identify the ip address of your docker container. The generic process to ssh into your container on linux or unix is as follows:
1) identify the ip address of your container.
    Your container is set-up using the default docker bridge network and as such has a unique ip address to itself. To get its ip address, you can inspect the container manifest using `docker inspect <container_name> manifest | grep IPAddress` or you can enter the docker container and see the address directly.
2) ssh into the container using the following credentials:
```
user: ugrt-tutorial
password: ugrt
```
If you are on a windows device, the process is similar, infact this approach works on all systems. Instead of using the docker ip, an additional port has been exposed from the container on port `2022`, so you will need to ssh into `localhost` @ port `2022`. The overall ssh command would look like `ssh ugrt-tutorial@localhost -p 2022`.
The simplest method, by far, is to simply use the terminal offered by jupyter notebooks that was launched in the container on port `10000`.   