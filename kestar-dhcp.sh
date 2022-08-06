#!/bin/bash
clear
systemctl stop isc-dhcp-server
echo '+-+        +-+ +-+     +--+        +-+     +--+  +----------+   +---------+  +------------+  +--------+  +--------+'
echo '| |	 | | | |    /  /         | |    /  /   | +--------+   | +-------+  |            |  | +----+ |  | +----+ |'
echo '| |	 | | | |   /  /          | |   /  /    | |            | |          +----+  +----+  | |    | |  | |    | |'
echo '| |	 | | | |  /  /           | |  /  /     | |            | | 		|  |	   | |    | |  | |    | | '
echo '| |	 | | | | /  /            | | /  /      | |            | |		|  |	   | |    | |  | |    | |'
echo '| |  	 | | | |/  /             | |/  /       | |            | |      		|  |       | |    | |  | +----+ |'
echo '| +------+ | |    /              |    /        | +--------+   | +-------+       |  |       | +----+ |  | +------+'
echo '| +------+ | |    |              |    |        | +--------+   +-------+ |	|  |	   | +----+ |  | |\  \'
echo '| | 	 | | |    \              |    \        | |                    | |       |  |	   | |    | |  | | \  \'
echo '| |	 | | | |\  \             | |\  \       | |  		      | |       |  |       | |    | |  | |  \  \'
echo '| |	 | | | | \  \     +---+  | | \  \      | |		      | |       |  |       | |    | |  | |   \  \'
echo '| |	 | | | |  \  \    |   |  | |  \  \     | |		      | |	|  |       | |    | |  | |    \  \'
echo '| |	 | | | |   \  \   |   |  | |   \  \    | +--------+   +-------+ |	|  |       | |    | |  | |     \  \'
echo '+-+      +-+ +-+    +--+  +---+  +-+    +--+   +----------+   +---------+	+--+       +-+    +-+  +-+      +--+'
echo ""
echo "                               developped by Kestar hacker !! bon chance !"

echo "configuration de la carte reseaux"
echo ""
echo ""
read -p "entrer le nom de la carte reseaux : " carte
echo ""
read -p "entrer une addresse(aparient au range)  : " addre
echo ""
read -p "entrer le broad-cast  : " bc
echo ""
read -p "Entrer la subnet : " subnet
echo ""
read -p "Entrer le mask : " mask
echo ""
read -p "Entrer le range (sous la forme premier address et la dernier) : " range
echo ""
read -p "Entrer le routers : " router
echo ""
echo "Entrain de configurer la carte "
sleep 3
echo ""
ifconfig $carte inet $addre netmask $mask broadcast $bc 
wait 
test $?=0 && echo "configuration de la carte reussi : )" || echo "erreur dans la configuration :("
echo "la configuration du fichier dhcp  commencer ! "
sleep 3
pa="/etc/dhcp/dhcpd.conf"
cp $pa dhcpBuckup.conf
echo "subnet $subnet netmask $mask {" >> $pa
echo "option routers $router;" >> $pa
echo "range $range;" >> $pa
echo "}" >> $pa

wait 
echo ""
echo "le fichier et configurer"
sleep 3
echo ""
echo "le demarage du service !!"
 sleep 3
systemctl restart isc-dhcp-server

wait
echo "la configuration terminer"
sleep 4

clear
systemctl status isc-dhcp-server
echo "developped by kestar !!!!!!!! "

