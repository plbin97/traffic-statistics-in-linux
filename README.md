# Traffic Statistics in Linux
This bash script would help you to get the traffic flowed in different port. 
# Environment requirement
<p>This bash script required iptables in your system. </p>
<p>If you are using Cent OS 7, before use this, please execute "yum install network-tools"</p>

# How to use
<p>Before you use, please add execute premission :</p>
<p>chmod +x traffic_accounting.sh</p>
<hr>
<p>If you wana to get the traffic flowed in port 80, you should start the traffic accounting with: </p>
<p>./traffic_accounting.sh add 80</p>
<p>After this command is executed, the system would start to account the traffic for port 80</p>
<p>You can add more if you want</p>
<hr>
<p>After, you can get the inbound traffic in byte unit by executing: </p>
<p>./traffic_accounting.sh get 80 in</p>
<p>You can get the outbound traffic in byte unit by executing: </p>
<p>./traffic_accounting.sh get 80 out</p>
<hr>
<p>If you wana to make zero for all ports, you have to executing: </p>
<p>./traffic_accounting.sh clean</p>
<hr>
<p>So sorry that there is no way to make zero for a specific port. I am tring to do this</p>
