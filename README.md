# dhcp-kestar

how to make a DOS attack to DHCP server and launch your own DHCP server

# Attack Description : 

We will try to send several DHCP discover packets to make the DHCP server fail and just after that we will start our own DHCP server to assign the addresses to the clients

# installation phase : 

## install yersinia : 

Yersinia is a very important tool for all Layer 2 researchers in networks it will allow us to control DHCP packets and send dhcp-discover requests in the network


to install yersinia we can use the command : 

sudo apt-get install yersinia 

## install wireshark : 

It is not mandatory but only it will help us to understand better what is happening in the network

you can install it using the commnad : 

apt-get install wireshark


# network configuration phase : 

because we will need a network to test our attack : 
 
we can use GNS3 to simulate the network.

in GNS3 we have three virtual machines : 

1) windows server ( contains the DHCP and DNS server )
2) windows 7 ( our victim machine )
3) ubuntu (attacker machine to test our attack )

so our network architecture is like this : 

![i ](https://github.com/ayoubarouche/dhcp-kestar/blob/master/attacker_images/1.png)

# working phase 

as we see that the server is working correctly :

## For the client (Windows 7):

![i ](https://github.com/ayoubarouche/dhcp-kestar/blob/master/attacker_images/2.png)

and it's IP address is : 192.168.1.10

## For the attacker (ubuntu) : 

after joining the network : 

![i ](https://github.com/ayoubarouche/dhcp-kestar/blob/master/attacker_images/3.png)

the IP address of the attacker is : 192.168.1.11

# Attacking Phase : 

## start Wireshark (not mandatory ) : 

we can now start wireshark and choose our network card : 

![i ](https://github.com/ayoubarouche/dhcp-kestar/blob/master/attacker_images/4.png)


## start Yersinia : 

We will start it with the command yersinia -G (-G: launch yersinia graphically).

![i ](https://github.com/ayoubarouche/dhcp-kestar/blob/master/attacker_images/5.png)


## Dos attack on the DHCP server : 

we will attack the DHCP server using yersinia : 

![i ](https://github.com/ayoubarouche/dhcp-kestar/blob/master/attacker_images/6.png)

click on launch attack : 

![i ](https://github.com/ayoubarouche/dhcp-kestar/blob/master/attacker_images/7.png)

after that the attack begin 

we can follow the DHCP discover requests in wireshark 

![i ](https://github.com/ayoubarouche/dhcp-kestar/blob/master/attacker_images/8.png)

and as we can see in the figure that if the client ( windows 7 ) tries to get an IP address. he could not do that because our DHCP can't provide any more IP addresses.

## stop DOS attack : 

Now we're going to stop the attack with these steps
Launch attack -> cancel all attacks

![i ](https://github.com/ayoubarouche/dhcp-kestar/blob/master/attacker_images/9.png)

and in wireshark we could see that all the discover packets stoped. 

![i ](https://github.com/ayoubarouche/dhcp-kestar/blob/master/attacker_images/10.png)

## start our DHCP server : 

we can start our DHCP server now using kestar-dhcp.sh script

![i ](https://github.com/ayoubarouche/dhcp-kestar/blob/master/attacker_images/11.png)

the script will request some information to launch the DHCP server as we can see in the figure below : 

![i ](https://github.com/ayoubarouche/dhcp-kestar/blob/master/attacker_images/12.png)

Choose your network card IP address etc...

The range of ip addresses that we have chosen is: 212.145.12.2 212.145.12.30 

After that, the script will automatically start the DHCP service 

(you can install the service with the apt-get install isc-dhcp-server command before the DHCP script starts).

![i ](https://github.com/ayoubarouche/dhcp-kestar/blob/master/attacker_images/13.png)

If you see Active: active (running).
So it means that all the configurations are correct.
Now we will try to get an IP address from the client :

![i ](https://github.com/ayoubarouche/dhcp-kestar/blob/master/attacker_images/14.png)

And the address is assigned to our victim correctly (212.145.12.2).

## what an attacked can do now : 

so at this step that means that the attacker could play with ip addresses in the network and change all the configuration given by the DHCP server.

the attacker also can change the DNS server and make more advanced attackes.

writen by Kestar.

















