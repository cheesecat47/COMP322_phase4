FROM node:15

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install && \
    npm install -g pm2@latest && \
    npm install -g --save oracledb && \
    apt-get update && apt-get install -y libaio1

COPY . .

# https://oracle.github.io/node-oracledb/INSTALL.html#instzip
RUN mkdir -p /opt/oracle && \
    cd /opt/oracle && \
    wget https://download.oracle.com/otn_software/linux/instantclient/199000/instantclient-basic-linux.x64-19.9.0.0.0dbru.zip && \
    unzip instantclient-basic-linux.x64-19.9.0.0.0dbru.zip && \
    sh -c "echo /opt/oracle/instantclient_19_9 > /etc/ld.so.conf.d/oracle-instantclient.conf" && \
    ldconfig && \
    export LD_LIBRARY_PATH=/opt/oracle/instantclient_19_9:$LD_LIBRARY_PATH

EXPOSE 3000
CMD [ "pm2-runtime", "start", "ecosystem.config.js", "--watch" ]