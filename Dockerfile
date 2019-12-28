FROM nginx:1.17

COPY _fonts /var/_fonts

ARG AMPLIFY_API_KEY
RUN echo 'APT::Get::Assume-Yes "true";' >> /etc/apt/apt.conf
RUN apt-get update 
RUN apt-get install -y curl python gnupg procps
RUN curl -L -O https://github.com/nginxinc/nginx-amplify-agent/raw/master/packages/install.sh
RUN API_KEY=$AMPLIFY_API_KEY sh ./install.sh
RUN update-rc.d amplify-agent defaults
RUN update-rc.d amplify-agent enable
RUN cat /etc/amplify-agent/agent.conf | sed s/hostname\ =/hostname=budgetkey-nginx/ > /etc/amplify-agent/agent2.conf && mv /etc/amplify-agent/agent2.conf /etc/amplify-agent/agent.conf

COPY startup.sh /

ENTRYPOINT [ "/startup.sh" ]