FROM maci/systemd
MAINTAINER Marcel Wysocki "maci.stgn@gmail.com"
ENV container docker

RUN rpm -Uvh "https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm"
RUN cd /etc/yum.repos.d/; curl -O https://copr.fedoraproject.org/coprs/mkosek/freeipa/repo/epel-7/mkosek-freeipa-epel-7.repo
RUN yum -y install freeipa-server
RUN yum clean all

ADD httpd.service /etc/systemd/system/httpd.service
ADD ntpd.service /etc/systemd/system/ntpd.service

ADD ipa-server-install.service /etc/systemd/system/ipa-server-install.service
ADD start.sh /start.sh

RUN systemctl enable ipa-server-install


EXPOSE 53/udp 53 80 443 389 636 88 464 88/udp 464/udp 123/udp 7389 9443 9444 9445


VOLUME ["/sys/fs/cgroup"]
VOLUME ["/run"]

CMD  ["/usr/lib/systemd/systemd"]
