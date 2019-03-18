include("/opt/bcbi/predictmd/OfflineRegistry/startup.jl")

import Pkg

if !isfile(
        joinpath(
            homedir(),
            ".julia",
            "environments",
            string("v",VERSION.major,".",VERSION.minor,
                "-PredictMD-unstable",),
            "Project.toml",
            )
        ) ||
        !isfile(
            joinpath(
                homedir(),
                ".julia",
                "environments",
                string("v",VERSION.major,".",VERSION.minor,
                    "-PredictMD-unstable",),
                "Manifest.toml",
                )
            )
    mkpath(
        joinpath(
            homedir(),
            ".julia",
            "environments",
            string("v",VERSION.major,".",VERSION.minor,
                "-PredictMD-unstable",),
            )
        )
    Pkg.activate(
        joinpath(
            homedir(),
            ".julia",
            "environments",
            string("v",VERSION.major,".",VERSION.minor,
                "-PredictMD-unstable",),
            )
        )
    Pkg.add(
        [
            Pkg.PackageSpec(name="PredictMD", rev="develop",),
            Pkg.PackageSpec(name="PredictMDExtra", rev="develop",),
            Pkg.PackageSpec(name="PredictMDFull", rev="develop",),
            ],
        )
end

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
            ];
        shared = false,
        )
end

if !isfile(
        joinpath(
            homedir(),
            ".julia",
            "environments",
            string("v",VERSION.major,".",VERSION.minor,
                "-PredictMD-stable",),
            "Project.toml",
            )
        ) ||
        !isfile(
            joinpath(
                homedir(),
                ".julia",
                "environments",
                string("v",VERSION.major,".",VERSION.minor,
                    "-PredictMD-stable",),
                "Manifest.toml",
                )
            )
    mkpath(
        joinpath(
            homedir(),
            ".julia",
            "environments",
            string("v",VERSION.major,".",VERSION.minor,
                "-PredictMD-stable",),
            )
        )
    Pkg.activate(
        joinpath(
            homedir(),
            ".julia",
            "environments",
            string("v",VERSION.major,".",VERSION.minor,
                "-PredictMD-stable",),
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

if !isfile(
        joinpath(
            homedir(),
            ".julia",
            "environments",
            string("v",VERSION.major,".",VERSION.minor,
                "-PredictMD",),
            "Project.toml",
            )
        ) ||
        !isfile(
            joinpath(
                homedir(),
                ".julia",
                "environments",
                string("v",VERSION.major,".",VERSION.minor,
                    "-PredictMD",),
                "Manifest.toml",
                )
            )
    mkpath(
        joinpath(
            homedir(),
            ".julia",
            "environments",
            string("v",VERSION.major,".",VERSION.minor,
                "-PredictMD",),
            )
        )
    Pkg.activate(
        joinpath(
            homedir(),
            ".julia",
            "environments",
            string("v",VERSION.major,".",VERSION.minor,
                "-PredictMD",),
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
