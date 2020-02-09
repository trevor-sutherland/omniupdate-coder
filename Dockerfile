FROM chinodesuuu/coder:openshift
USER coder
RUN sudo apt-get update && sudo apt-get install -y --no-install-recommends apt-utils


RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - && sudo apt-get install -y nodejs
RUN  mkdir ~/.npm-global && \
    chmod 2775 ~/.npm-global && \
    npm config set prefix '~/.npm-global' && \
    echo "export PATH=~/.npm-global/bin:$PATH" | sudo tee /etc/profile.d/01-npm.sh
RUN PATH=~/.npm-global/bin:$PATH npm install -g npm


EXPOSE 8080
EXPOSE 9000
