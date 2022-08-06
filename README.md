# dhcp-kestar
how to make a DOS attack to DHCP server and launch your own DHCP server


# configuration phase : 

first we will need to have yersinia installed in our linux os : 

to install yersinia we can use the command : 

sudo apt-get install yersinia 

# network configuration phase : 

because we will need a network to test our attack : 
 
we can use GNS3 to simulate the network.

so we have three virtual machines : 

1) windows server ( contains the DHCP and DNS server )
2) windows 7 ( our victim machine )
3) ubuntu (attacker machine to test our attack )

so our network architecture is like this : 

![i ](https://github.com/ayoubarouche/dhcp-kestar/blob/master/attacker_images/1.png)



