docker-kannel
=============

Docker image for [Kannel](http://kannel.org/)

## Usage ##
This docker image exposes a number of volumes that can be used for providing external access to the Kannel configuration file and logs.

### Running the bearerbox ###
`docker run --rm -t -i --name bearerbox --hostname bearerbox --volume /opt/kannel/etc/:/etc/kannel --volume /opt/kannel/log:/var/log/kannel --volume /opt/kannel/spool:/var/spool/kannel kannel bearerbox -v 0 /etc/kannel/kannel.conf`

### Running the smsbox ###
`docker run --rm -t -i --name smsbox --hostname smsbox --volumes-from bearerbox --link bearerbox:bearerbox kannel smsbox -v 0 /etc/kannel/kannel.conf`

## Notes ##
For your smsbox to be able to connect with the bearerbox, you first need to link the bearerbox to the smsbox. Secondly, your configuration file needs to contain the hostname of the bearerbox. A container that has linked containers will contain hostnames that resolve to the ip address of the containers that are linked. In the example above, the hostname `bearerbox` will point to the ip address of the bearerbox container.

You also need to publish the ports you have defined in your `kannel.conf` if it will be accessible from the host.