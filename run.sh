#!/bin/bash
sudo date
CONTAINER=$(sudo docker run --name ipa.example.com -d -h ipa.replynet.prv -v /sys/fs/cgroup:/sys/fs/cgroup:ro maci/freeipa-server /usr/lib/systemd/systemd)
echo ${CONTAINER}
echo "To enter docker container run: 
        sudo docker exec -t -i ${CONTAINER} /bin/bash"
