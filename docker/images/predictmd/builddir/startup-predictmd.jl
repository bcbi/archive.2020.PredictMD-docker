include("/opt/bcbi/predictmd/OfflineRegistry/startup.jl");

import Pkg;

predictmd = joinpath(
    homedir(), ".julia", "environments",
    "v$(VERSION.major).$(VERSION.minor)-PredictMD",
    );
predictmd_stable = joinpath(
    homedir(), ".julia", "environments",
    "v$(VERSION.major).$(VERSION.minor)-PredictMD-stable",
    );
predictmd_unstable = joinpath(
    homedir(), ".julia", "environments",
    "v$(VERSION.major).$(VERSION.minor)-PredictMD-unstable",
    );
predictmd_develop = joinpath(
    homedir(), ".julia", "environments",
    "v$(VERSION.major).$(VERSION.minor)-PredictMD-develop",
    );

predictmd_environments = String[
    predictmd, predictmd_stable, predictmd_unstable, predictmd_develop,
    ];

if !isfile(joinpath(predictmd, "Project.toml",)) ||
        !isfile(joinpath(predictmd, "Manifest.toml",))
    mkpath(predictmd);
    Pkg.activate(predictmd);
    Pkg.add(["PredictMD", "PredictMDExtra", "PredictMDFull",],);
end

if !isfile(joinpath(predictmd_stable, "Project.toml",)) ||
        !isfile(joinpath(predictmd_stable, "Manifest.toml",))
    mkpath(predictmd_stable);
    Pkg.activate(predictmd_stable);
    Pkg.add(["PredictMD", "PredictMDExtra", "PredictMDFull",],);
end

if !isfile(joinpath(predictmd_unstable, "Project.toml",)) ||
        !isfile(joinpath(predictmd_unstable, "Manifest.toml",))
    mkpath(predictmd_unstable);
    Pkg.activate(predictmd_unstable);
    Pkg.add(
        [
            Pkg.PackageSpec(name="PredictMD", rev="develop",),
            Pkg.PackageSpec(name="PredictMDExtra", rev="develop",),
            Pkg.PackageSpec(name="PredictMDFull", rev="develop",),
            ],
        );
end

if !isfile(joinpath(predictmd_develop, "Project.toml",)) ||
        !isfile(joinpath(predictmd_develop, "Manifest.toml",))
    mkpath(predictmd_develop);
    Pkg.activate(predictmd_develop);
    Pkg.add(
        [
            Pkg.PackageSpec(name="PredictMD", rev="develop",),
            Pkg.PackageSpec(name="PredictMDExtra", rev="develop",),
            Pkg.PackageSpec(name="PredictMDFull", rev="develop",),
            ],
        );
    Pkg.develop(
        ["PredictMD", "PredictMDExtra", "PredictMDFull",];
        shared = false,
        );
end

Pkg.activate(predictmd);