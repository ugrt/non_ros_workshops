FROM ubuntu:22.04

RUN useradd -ms /bin/bash ugrt-tutorial


RUN apt-get update && apt-get install -y python3-pip \
                        openssh-server sudo

RUN adduser ugrt-tutorial sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> \
/etc/sudoers

RUN echo 'ugrt-tutorial:ugrt' | chpasswd

RUN pip3 install jupyterlab matplotlib seaborn scikit-learn \ 
                    scipy

RUN apt-get update && apt-get install ca-certificates \
    curl \
    gnupg \
    lsb-release -y 

RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update && apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

RUN mkdir /var/run/sshd
# RUN chmod 777 /var/run/sshd
COPY startup.sh /startup.sh
RUN chmod 777 /startup.sh
USER ugrt-tutorial
WORKDIR /home/ugrt-tutorial

CMD ["/startup.sh"]
