#!/bin/bash

##### Beginning of file

set -ev

whoami
id
id -u
id -ru
id -g
id -rg

/opt/julia1.0.4/bin/julia1.0.4 -e 'import InteractiveUtils; InteractiveUtils.versioninfo(verbose=true)'
/opt/julia1.0.4/bin/julia1.0 -e 'import InteractiveUtils; InteractiveUtils.versioninfo(verbose=true)'
/opt/julia1.0.4/bin/julia -e 'import InteractiveUtils; InteractiveUtils.versioninfo(verbose=true)'

/opt/julia1.1.1/bin/julia1.1.1 -e 'import InteractiveUtils; InteractiveUtils.versioninfo(verbose=true)'
/opt/julia1.1.1/bin/julia1.1 -e 'import InteractiveUtils; InteractiveUtils.versioninfo(verbose=true)'
/opt/julia1.1.1/bin/julia1 -e 'import InteractiveUtils; InteractiveUtils.versioninfo(verbose=true)'
/opt/julia1.1.1/bin/julia -e 'import InteractiveUtils; InteractiveUtils.versioninfo(verbose=true)'

/usr/local/bin/julia1.0.4 -e 'import InteractiveUtils; InteractiveUtils.versioninfo(verbose=true)'
/usr/local/bin/julia1.0 -e 'import InteractiveUtils; InteractiveUtils.versioninfo(verbose=true)'
/usr/local/bin/julia1.1.1 -e 'import InteractiveUtils; InteractiveUtils.versioninfo(verbose=true)'
/usr/local/bin/julia1.1 -e 'import InteractiveUtils; InteractiveUtils.versioninfo(verbose=true)'
/usr/local/bin/julia1 -e 'import InteractiveUtils; InteractiveUtils.versioninfo(verbose=true)'
/usr/local/bin/julia -e 'import InteractiveUtils; InteractiveUtils.versioninfo(verbose=true)'

julia1.0.4 -e 'import InteractiveUtils; InteractiveUtils.versioninfo(verbose=true)'
julia1.0 -e 'import InteractiveUtils; InteractiveUtils.versioninfo(verbose=true)'
julia1.1.1 -e 'import InteractiveUtils; InteractiveUtils.versioninfo(verbose=true)'
julia1.1 -e 'import InteractiveUtils; InteractiveUtils.versioninfo(verbose=true)'
julia1 -e 'import InteractiveUtils; InteractiveUtils.versioninfo(verbose=true)'
julia -e 'import InteractiveUtils; InteractiveUtils.versioninfo(verbose=true)'

echo "dilumaluthge/julia-1: runtests.sh: Tests passed."

##### End of file
