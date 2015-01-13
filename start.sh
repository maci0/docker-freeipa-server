#!/bin/sh
PASSWORD="changeme"
REALM="example.com"


if [ -f /etc/ipa/ca.crt ] ; then
echo "FreeIPA server is already configured."
else
#workaround
mv /usr/bin/domainname /usr/bin/domainname.bak
echo '#!/bin/sh
exit 0' > /usr/bin/domainname
chmod +x /usr/bin/domainname

ipa-server-install -U -p "${PASSWORD}" -a "${PASSWORD}" -r "${REALM}"
fi
