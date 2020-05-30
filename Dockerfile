FROM debian:latest
MAINTAINER Hans-Willi Werres <eMail@WilliWerres.de>
RUN apt-get update
RUN apt-get install -y apache2 libapache2-mod-wsgi-py3
RUN systemctl enable apache2

ADD log.sh /
RUN chmod +x /log.sh
CMD /log.sh


#FROM ubuntu:trusty
#MAINTAINER Cornelius Kölbel <cornelius@privacyidea.org>
#RUN apt-get update
#RUN apt-get install -y software-properties-common
#RUN add-apt-repository ppa:privacyidea/privacyidea
#RUN apt-get update
#RUN apt-get install -y privacyidea
#RUN apt-get install -y python-mysqldb
#RUN privacyidea-create-pwidresolver-user -u admin -p test > /etc/privacyidea/admin-users 
#EXPOSE 5001
#VOLUME /etc/privacyidea
#VOLUME /var/log/privacyidea
#VOLUME /var/lib/privacyidea
#ENTRYPOINT paster serve /etc/privacyidea/privacyidea.ini 
#USER privacyidea
