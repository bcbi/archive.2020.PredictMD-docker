import LibGit2
import Pkg

function all_versions(repo_url::AbstractString)
    _temp_dir::String = mktempdir()
    atexit(() -> rm(_temp_dir; force = true, recursive = true))
    _repo_path = joinpath(_temp_dir, "GITREPO")
    LibGit2.clone(repo_url, _repo_path)
    _repo = LibGit2.GitRepo(_repo_path)
    _ref_list = LibGit2.ref_list(_repo)
    _all_versions = Vector{VersionNumber}(undef, 0)
    for _ref in _ref_list
        if occursin(r"^refs\/tags\/v(\d*).(\d*).(\d*)$", _ref)
            _m = match(r"^refs\/tags\/v(\d*).(\d*).(\d*)$", _ref)
            _v = VersionNumber("$(_m[1]).$(_m[2]).$(_m[3])")
            push!(_all_versions, _v)
        end
    end
    _all_versions_stripped = strip.(_all_versions)
    unique!(_all_versions_stripped)
    sort!(_all_versions_stripped)
    rm(_temp_dir; force = true, recursive = true)
    return _all_versions_stripped
end

latest_semver_version(repo_url) = maximum(all_versions(repo_url))

function main()
    dir_containing_this_file::String = joinpath(splitpath(@__DIR__)...)

    package_name_to_url = Pkg.TOML.parsefile(
        joinpath(dir_containing_this_file, "package_url_list.toml")
        )["package_url_list"]
    PREDICTMD_URL = package_name_to_url["PredictMD"]
    PREDICTMDAPI_URL = package_name_to_url["PredictMDAPI"]
    PREDICTMDEXTRA_URL = package_name_to_url["PredictMDExtra"]
    PREDICTMDFULL_URL = package_name_to_url["PredictMDFull"]
    PREDICTMD_LATEST_SEMVER_VERSION = string(latest_semver_version(PREDICTMD_URL))
    PREDICTMDAPI_LATEST_SEMVER_VERSION = string(latest_semver_version(PREDICTMDAPI_URL))
    PREDICTMDEXTRA_LATEST_SEMVER_VERSION = string(latest_semver_version(PREDICTMDEXTRA_URL))
    PREDICTMDFULL_LATEST_SEMVER_VERSION = string(latest_semver_version(PREDICTMDFULL_URL))

    offline_toml_in_path = joinpath(dir_containing_this_file, "offline.toml.template")
    offline_toml_out_path = joinpath(dir_containing_this_file, "offline.toml")

    offline_toml = read(offline_toml_in_path, String)

    offline_toml = replace(offline_toml, "{{PREDICTMD_LATEST_SEMVER_VERSION}}" => PREDICTMD_LATEST_SEMVER_VERSION)
    offline_toml = replace(offline_toml, "{{PREDICTMDAPI_LATEST_SEMVER_VERSION}}" => PREDICTMDAPI_LATEST_SEMVER_VERSION)
    offline_toml = replace(offline_toml, "{{PREDICTMDEXTRA_LATEST_SEMVER_VERSION}}" => PREDICTMDEXTRA_LATEST_SEMVER_VERSION)
    offline_toml = replace(offline_toml, "{{PREDICTMDFULL_LATEST_SEMVER_VERSION}}" => PREDICTMDFULL_LATEST_SEMVER_VERSION)

    write(offline_toml_out_path, offline_toml)

    @info("Wrote file $(offline_toml_out_path)")
end

main()
