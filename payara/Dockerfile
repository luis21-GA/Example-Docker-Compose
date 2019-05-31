FROM payara/server-full:latest
ENV JDBC_URL=https://jdbc.postgresql.org/download/postgresql-42.1.4.jar
RUN wget --quiet --no-check-certificate $JDBC_URL
RUN cp postgresql-42.1.4.jar /opt/payara41/glassfish/lib/
RUN touch /opt/payara41/pwd.txt && echo 'AS_ADMIN_PASSWORD=admin' > /opt/payara41/pwd.txt

USER root

# Compilar el proyecto
RUN apt-get update --fix-missing && apt-get install -y git maven
RUN git clone 'https://github.com/GA14018-prn335/guia05.git'
RUN mvn -f /opt/payara41/guia05/ clean install
RUN cp /opt/payara41/guia05/target/webProject-1.0-SNAPSHOT.war /opt/payara41/glassfish/domains/domain1/autodeploy/

RUN /opt/payara41/bin/asadmin start-domain &&  \ 
/opt/payara41/bin/asadmin create-jdbc-connection-pool --datasourceclassname=org.postgresql.ds.PGSimpleDataSource --restype=javax.sql.DataSource --property="user=mortal2017:password=prn335:url='jdbc:postgresql://postgres:5432 posts':portNumber=5432:dataBaseName=posts:driverClass=org.postgresql.Driver:serverName=postgres" pool_post --user admin --passwordfile=/opt/payara41/pwd.txt && \ 
/opt/payara41/bin/asadmin create-jdbc-resource --connectionpoolid pool_post jndi_post --user admin --passwordfile=/opt/payara41/pwd.txt && \
/opt/payara41/bin/asadmin stop-domain

CMD /opt/payara41/bin/asadmin start-domain
