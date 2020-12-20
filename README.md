# Traffic Statistics in Linux
This bash script would help you to get the traffic flowed in different port. 
# Environment requirement
<p>This bash script required iptables in your system. </p>
<p>If you are using Cent OS 7, before use this, please execute "yum install network-tools"</p>

# How to use
<p>Before you use, please add execute premission :</p>
<p>chmod +x traffic_accounting.sh</p>
<hr>
<p>If you wana to get the traffic flowed in port 80, you should start the traffic statistics with: </p>
<p>./traffic_accounting.sh add 80</p>
<p>After this command is executed, the system would start to collect the traffic statistics for port 80</p>
<p>You can add more if you want</p>
<p>The unit is byte</p>
<hr>
<p>After, you can get the inbound traffic in byte unit by executing: </p>
<p>./traffic_accounting.sh get 80 in</p>
<p>You can get the outbound traffic in byte unit by executing: </p>
<p>./traffic_accounting.sh get 80 out</p>
<hr>
<p>If you wana to reset for all ports' traffic statistics, you have to executing: </p>
<p>./traffic_accounting.sh clean</p>
<hr>
<p>So sorry that there is no way to reset for a specific port. I am tring to do this</p>
