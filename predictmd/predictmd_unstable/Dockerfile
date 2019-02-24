FROM dilumaluthge/julia1.1:latest

MAINTAINER Dilum Aluthge <dilum@aluthge.com>

RUN apt-get update
RUN apt-get -yq dist-upgrade
RUN apt-get update
RUN apt-get -yq dist-upgrade
RUN apt-get clean

ENV JULIA_DEPOT_PATH=/opt/julia/share/julia

RUN rm -rf $JULIA_DEPOT_PATH/compiled

RUN julia -e 'import Pkg; try deleteat!(DEPOT_PATH,1:2) catch e @warn("ignoring exception: ", e,) end; Pkg.add(Pkg.PackageSpec(url="https://github.com/bcbi/PredictMD.jl", rev="develop"));'
RUN julia -e 'import Pkg; Pkg.build("PredictMD");'
RUN julia -e 'import Pkg; try deleteat!(DEPOT_PATH,1:2) catch e @warn("ignoring exception: ", e,) end; Pkg.add(Pkg.PackageSpec(url="https://github.com/bcbi/PredictMDExtra.jl", rev="develop")); '
RUN julia -e 'import Pkg; Pkg.build("PredictMDExtra");'
RUN julia -e 'import Pkg; try deleteat!(DEPOT_PATH,1:2) catch e @warn("ignoring exception: ", e,) end; Pkg.add(Pkg.PackageSpec(url="https://github.com/bcbi/PredictMDFull.jl", rev="develop")); '
RUN julia -e 'import Pkg; Pkg.build("PredictMDFull");'
RUN julia -e 'ENV["JULIA_DEBUG"] = "all"; import PredictMD;'
RUN julia -e 'ENV["JULIA_DEBUG"] = "all"; import PredictMDExtra;'
RUN julia -e 'ENV["JULIA_DEBUG"] = "all"; import PredictMDFull;'
RUN cd /opt/julia/share/julia/registries && \
    mv General StrongHoldGeneral && \
    cd StrongHoldGeneral && \
    sed -i 's/name = "General"/name = "StrongHoldGeneral"/g' Registry.toml && \
    sed -i 's/uuid = "23338594-aafe-5451-b93e-139f81909106"/uuid = "a67460e4-2ee5-11e9-b210-d663bd873d93"/g' Registry.toml && \
    sed -i 's/repo = "https:\/\/github.com\/JuliaRegistries\/General.git"/repo = "\/opt\/julia\/share\/julia\/registries\/StrongHoldGeneral"/g' Registry.toml && \
    git config --global user.email "stronghold-help@brown.edu" && \
    git config --global user.name "Stronghold Team" && \
    git add . && \
    git commit -m "updating registry details for stronghold" && \
    git remote remove origin

COPY ../../julia_scripts/sh_startup.jl /opt/julia/etc/julia/startup.jl

RUN rm -rf /tmp/runtests.sh
COPY runtests.sh /tmp/
RUN mkdir -p /opt/predictmd/docker/bin
RUN touch /opt/predictmd/docker/bin/runtests.sh
RUN cat /tmp/runtests.sh >> /opt/predictmd/docker/bin/runtests.sh
RUN rm -rf /tmp/runtests.sh
RUN chmod 555/opt/predictmd/docker/bin/runtests.sh

RUN rm -rf /tmp/runtests-all.sh
COPY runtests-all.sh /tmp/
RUN mkdir -p /opt/predictmd/docker/bin
RUN touch /opt/predictmd/docker/bin/runtests-all.sh
RUN cat /tmp/runtests-all.sh >> /opt/predictmd/docker/bin/runtests-all.sh
RUN rm -rf /tmp/runtests-all.sh
RUN chmod 555/opt/predictmd/docker/bin/runtests-all.sh
