# Documentation

Create VM:

```
$ docker-machine create -d virtualbox local
```

Select env:

```
$ eval $(docker-machine env crhnp)
```

Up:

```
$ cd single-vm
$ docker-compose up -d
```

Scale php_fpm:

```
$ docker-compose scale php=2
```

# Open app in browser

1) Get VM ip:
```
$ docker-machine ls

NAME    ACTIVE   DRIVER       STATE     URL                         SWARM   DOCKER    ERRORS
crhnp   *        virtualbox   Running   tcp://192.168.99.121:2376           v1.12.6
```

2) Get app open port:
```
$ docker ps

CONTAINER ID        IMAGE                           COMMAND                  CREATED              STATUS              PORTS                                                                            NAMES
d2c45caafdcd        nginx:latest                    "nginx -g 'daemon off"   About a minute ago   Up About a minute   443/tcp, 0.0.0.0:8080->80/tcp                                                    docker_nginx_1
04381079cb9c        gliderlabs/registrator:latest   "/bin/registrator -in"   About a minute ago   Up About a minute                                                                                    docker_registrator_1
b1d9a06b0c39        docker_haproxy                  "/usr/bin/start.sh"      About a minute ago   Up About a minute                                                                                    docker_haproxy_1
db10612d34c8        php:7-fpm                       "docker-php-entrypoin"   About a minute ago   Up About a minute   9000/tcp                                                                         docker_php_1
c53903b77968        progrium/consul                 "/bin/start -server -"   About a minute ago   Up About a minute   53/tcp, 53/udp, 8300-8302/tcp, 8400/tcp, 8301-8302/udp, 0.0.0.0:8500->8500/tcp   docker_consul_1
```

In this case app url is 'http://192.168.99.121:8080/index.php'.

Consul interface 'http://192.168.99.121:8500'.

# Swarm cluster

![Fig](https://github.com/movercenco/docker/blob/master/fig.png)

SetUp consul:
```
$ ./bash/vm_consul
```

SetUp swarm:
```
$ ./bash/vm_swarm
```

SetUp registrator:
```
$ ./bash/registrator_up
```

SetUp app:
```
$ ./bash/conpose
```

Open app in browser:
```
$ docker-machine ls

app-server-1   -           virtualbox   Running   tcp://192.168.99.128:2376   swarm-master            v1.13.0
app-server-2   -           virtualbox   Running   tcp://192.168.99.129:2376   swarm-master            v1.13.0
consul         -           virtualbox   Running   tcp://192.168.99.125:2376                           v1.13.0
nginx          -           virtualbox   Running   tcp://192.168.99.127:2376   swarm-master            v1.13.0
swarm-master   * (swarm)   virtualbox   Running   tcp://192.168.99.126:2376   swarm-master (master)   v1.13.0
```

In this case app url is 'http://192.168.99.127:8080/index.php'.

Consul interface 'http://192.168.99.125:8500'.

Scale: 
```
$ docker-compose -f docker-compose.yml scale php=2
```

# ToDo

1. Fix scale proablem

2. MySql [Master/Slave]

3. ...
