FROM    alpine:latest
RUN     apk update && apk add bash
ADD     ./my_daemon.sh /my_daemon.sh
CMD     ["/bin/bash", "/my_daemon.sh"]
