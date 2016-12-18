sysctl net.ipv6.conf.default.forwarding=1
sysctl net.ipv6.conf.all.forwarding=1
sysctl net.ipv6.conf.ens3.accept_ra=2
apt install ndppd
ipv6sub=$1
echo -e "proxy ens3 { \n\
rule ${ipv6sub} { \n\
}\n\
 }" >/etc/ndppd.conf
systemctl restart ndppd
sed -i.bak -e 's#ExecStart\(.*\)#ExecStart\1 --ipv6 --fixed-cidr-v6="'$ipv6sub'"#' /lib/systemd/system/docker.service
systemctl daemon-reload
systemctl restart docker.service
