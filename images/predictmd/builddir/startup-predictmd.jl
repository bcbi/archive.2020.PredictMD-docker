include("/opt/bcbi/predictmd/OfflineRegistry/startup.jl")

import Pkg

if !isfile(
        joinpath(
            homedir(),
            ".julia",
            "environments",
            string("v",VERSION.major,".",VERSION.minor,
                "-PredictMD-develop",),
            "Project.toml",
            )
        ) ||
        !isfile(
            joinpath(
                homedir(),
                ".julia",
                "environments",
                string("v",VERSION.major,".",VERSION.minor,
                    "-PredictMD-develop",),
                "Manifest.toml",
                )
            )
    mkpath(
        joinpath(
            homedir(),
            ".julia",
            "environments",
            string("v",VERSION.major,".",VERSION.minor,
                "-PredictMD-develop",),
            )
        )
    Pkg.activate(
        joinpath(
            homedir(),
            ".julia",
            "environments",
            string("v",VERSION.major,".",VERSION.minor,
                "-PredictMD-develop",),
            )
        )
    Pkg.add(
        [
            Pkg.PackageSpec(name="PredictMD", rev="develop",),
            Pkg.PackageSpec(name="PredictMDExtra", rev="develop",),
            Pkg.PackageSpec(name="PredictMDFull", rev="develop",),
            ],
        )
    Pkg.develop(
        [
            "PredictMD",
            "PredictMDExtra",
            "PredictMDFull",
            ],
        )
end

if !isfile(
        joinpath(
            homedir(),
            ".julia",
            "environments",
            string("v",VERSION.major,".",VERSION.minor,"-PredictMD",),
            "Project.toml",
            )
        ) ||
        !isfile(
            joinpath(
                homedir(),
                ".julia",
                "environments",
                string("v",VERSION.major,".",VERSION.minor,"-PredictMD",),
                "Manifest.toml",
                )
            )
    mkpath(
        joinpath(
            homedir(),
            ".julia",
            "environments",
            string("v",VERSION.major,".",VERSION.minor,"-PredictMD",),
            )
        )
    Pkg.activate(
        joinpath(
            homedir(),
            ".julia",
            "environments",
            string("v",VERSION.major,".",VERSION.minor,"-PredictMD",),
            )
        )
    Pkg.add(
        [
            "PredictMD",
            "PredictMDExtra",
            "PredictMDFull",
            ],
        )
end

Pkg.activate(
    joinpath(
        homedir(),
        ".julia",
        "environments",
        string("v",VERSION.major,".",VERSION.minor,"-PredictMD",),
        )
    )
