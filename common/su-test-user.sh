#!/bin/bash

##### Beginning of file

set -ev

whoami
id -u
id -ru
id -g
id -rg

if [[ $(id -u) -eq 0 ]];
then
    useradd testuser || id testuser
    id testuser
    su -c /bin/bash testuser
fi

whoami
id -u
id -ru
id -g
id -rg

##### End of file
