FROM docker:dind

# Add an SSH server and start it automatically
RUN apk add \
        openssh \
        udev \
        bash
        
RUN apk add openrc        

RUN sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
  && echo "root:root" | chpasswd
  
COPY mount-pts.sh /etc/init.d/devpts
RUN rc-update add sshd && \
    rc-update add udev && \
    rc-update add sysfs && \
    rc-update add devpts

RUN echo "exit 0" > /etc/init.d/networking
RUN echo "PermitTTY yes" >> /etc/ssh/sshd_config
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

COPY docker /etc/init.d/docker
RUN rc-update add docker

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
