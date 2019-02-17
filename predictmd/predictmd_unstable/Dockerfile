FROM dilumaluthge/julia1.1:latest

MAINTAINER Dilum Aluthge <dilum@aluthge.com>

ENV JULIA_DEPOT_PATH=/opt/julia

RUN rm -rf $JULIA_DEPOT_PATH/compiled
RUN julia -e 'ENV["JULIA_DEBUG"] = "all"; import Pkg; Pkg.update();'
RUN julia -e 'ENV["JULIA_DEBUG"] = "all"; import Pkg; Pkg.Registry.update();'
RUN julia -e 'ENV["JULIA_DEBUG"] = "all"; import Pkg; Pkg.Registry.add(Pkg.Registry.RegistrySpec(url="https://github.com/JuliaRegistries/General"));'
RUN julia -e 'ENV["JULIA_DEBUG"] = "all"; import Pkg; Pkg.update();'
RUN julia -e 'ENV["JULIA_DEBUG"] = "all"; import Pkg; Pkg.Registry.update();'
RUN julia -e 'ENV["JULIA_DEBUG"] = "all"; import Pkg; Pkg.add(Pkg.PackageSpec(url="https://github.com/bcbi/PredictMD.jl", rev="develop"));'
RUN julia -e 'ENV["JULIA_DEBUG"] = "all"; import Pkg; Pkg.build("PredictMD");'
RUN julia -e 'ENV["JULIA_DEBUG"] = "all"; import Pkg; Pkg.add(Pkg.PackageSpec(url="https://github.com/bcbi/PredictMDExtra.jl", rev="develop")); '
RUN julia -e 'ENV["JULIA_DEBUG"] = "all"; import Pkg; Pkg.build("PredictMDExtra");'
RUN julia -e 'ENV["JULIA_DEBUG"] = "all"; import Pkg; Pkg.add(Pkg.PackageSpec(url="https://github.com/bcbi/PredictMDFull.jl", rev="develop")); '
RUN julia -e 'ENV["JULIA_DEBUG"] = "all"; import Pkg; Pkg.build("PredictMDFull");'
RUN julia -e 'ENV["JULIA_DEBUG"] = "all"; import PredictMD;'
RUN julia -e 'ENV["JULIA_DEBUG"] = "all"; import PredictMDExtra;'
RUN julia -e 'ENV["JULIA_DEBUG"] = "all"; import PredictMDFull; PredictMDFull.install();'
RUN rm -rf $JULIA_DEPOT_PATH/compiled

RUN rm -rf /tmp/runtests.sh
COPY runtests.sh /tmp/
RUN mkdir -p /opt/scripts
RUN touch /opt/scripts/runtests.sh
RUN cat /tmp/runtests.sh >> /opt/scripts/runtests.sh
RUN rm -rf /tmp/runtests.sh
RUN chmod 555 /opt/scripts/runtests.sh
RUN ln -fs /opt/scripts/runtests.sh /bin/runtests.sh
RUN chmod 555 /bin/runtests.sh

RUN rm -rf /tmp/runtests-long.sh
COPY runtests-long.sh /tmp/
RUN mkdir -p /opt/scripts
RUN touch /opt/scripts/runtests-long.sh
RUN cat /tmp/runtests-long.sh >> /opt/scripts/runtests-long.sh
RUN rm -rf /tmp/runtests-long.sh
RUN chmod 555 /opt/scripts/runtests-long.sh
RUN ln -fs /opt/scripts/runtests-long.sh /bin/runtests-long.sh
RUN chmod 555 /bin/runtests-long.sh
