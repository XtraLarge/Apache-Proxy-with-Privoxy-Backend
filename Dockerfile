FROM debian:latest
MAINTAINER Hans-Willi Werres <eMail@WilliWerres.de>
RUN apt-get update
RUN apt-get install -y apache2 libapache2-mod-wsgi-py3
RUN systemctl enable apache2
RUN a2enmod auth_digest auth_form authz_groupfile cache cache_disk cache_socache cgi cgid headers info macro mpm_prefork proxy \
            proxy_ajp proxy_connect proxy_fcgi proxy_html proxy_http proxy_http2 proxy_scgi proxy_wstunnel request rewrite \
            sed session session_cookie session_crypto socache_shmcb ssl substitute vhost_alias xml2enc
RUN mkdir /etc/apache2/AddOn
ADD mk_macro_secrets.sh /etc/apache2

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
