FROM dilumaluthge/latex-for-plotting:latest

MAINTAINER Dilum Aluthge <dilum@aluthge.com>

RUN apt-get update
RUN apt-get -yq dist-upgrade
RUN apt-get update
RUN apt-get -yq dist-upgrade
RUN apt-get clean

ENV JULIA_DEPOT_PATH=/opt/julia/share/julia

RUN rm -rf /opt/julia/etc/julia/startup.jl
COPY sh_startup.jl /opt/julia/etc/julia/startup.jl

RUN rm -rf $JULIA_DEPOT_PATH/registries
RUN julia -e 'import Pkg; Pkg.Registry.update(); '
RUN julia -e 'import Pkg; Pkg.Registry.add(Pkg.Registry.RegistrySpec(url="https://github.com/JuliaRegistries/General")); '
RUN julia -e 'import Pkg; Pkg.Registry.update(); '
RUN julia -e 'import Pkg; try Pkg.update(); catch e @warn("ignoring exception: ", e,) end; '

RUN julia -e 'import Pkg; Pkg.activate("PredictMD-unstable"); Pkg.add(Pkg.PackageSpec(url="https://github.com/bcbi/PredictMD.jl", rev="develop"));'
RUN julia -e 'import Pkg; Pkg.activate("PredictMD-unstable"); Pkg.build("PredictMD");'
RUN julia -e 'import Pkg; Pkg.activate("PredictMD-unstable"); Pkg.add(Pkg.PackageSpec(url="https://github.com/bcbi/PredictMDExtra.jl", rev="develop")); '
RUN julia -e 'import Pkg; Pkg.activate("PredictMD-unstable"); Pkg.build("PredictMDExtra");'
RUN julia -e 'import Pkg; Pkg.activate("PredictMD-unstable"); Pkg.add(Pkg.PackageSpec(url="https://github.com/bcbi/PredictMDFull.jl", rev="develop")); '
RUN julia -e 'import Pkg; Pkg.activate("PredictMD-unstable"); Pkg.build("PredictMDFull");'
RUN julia -e 'ENV["JULIA_DEBUG"] = "all"; import Pkg; Pkg.activate("PredictMD-unstable"); import PredictMD;'
RUN julia -e 'ENV["JULIA_DEBUG"] = "all"; import Pkg; Pkg.activate("PredictMD-unstable"); import PredictMDExtra;'
RUN julia -e 'ENV["JULIA_DEBUG"] = "all"; import Pkg; Pkg.activate("PredictMD-unstable"); import PredictMDFull;'

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
