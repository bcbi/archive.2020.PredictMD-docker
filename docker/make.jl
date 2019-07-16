import Pkg

struct ImageSpec
end

function my_run(cmd)
    @info("Attempting to run command: $(cmd)")
    run(cmd)
    @info("Command ran successfully")
end

function apply_template(original::String,
                        templates::Vector{Pair{String,String}})::String
    content = original
    for pair in templates
        content = replace(content, pair)
    end
    return content
end

function generate_dockerfiles(; directory::String,
                                image_name_prefix::String,
                                image_owner::String,
                                image_list::Vector{String})::Nothing
    templates = ["{{image_owner}}" => "$(image_owner)",
                 "{{image_name_prefix}}" => "$(image_name_prefix)"]
    for image_name in image_list
        image_directory = joinpath(directory, "images", image_name)
        builddir = joinpath(image_directory, "builddir")
        build_in_filename = joinpath(builddir, "Dockerfile.template")
        build_out_filename = joinpath(builddir, "Dockerfile")
        build_in = read(build_in_filename, String)
        build_out = apply_template(build_in, templates)
        rm(build_out_filename; force = true, recursive = true)
        open(build_out_filename, "w") do f
            write(f, build_out)
        end
        @info("Wrote file $(build_out_filename)")
        testdir = joinpath(image_directory, "testdir")
        test_in_filename = joinpath(testdir, "Dockerfile.template")
        test_out_filename = joinpath(testdir, "Dockerfile")
        test_in = read(test_in_filename, String)
        test_out = apply_template(test_in, templates)
        rm(test_out_filename; force = true, recursive = true)
        open(test_out_filename, "w") do f
            write(f, test_out)
        end
        @info("Wrote file $(test_out_filename)")
    end
    return nothing
end

function build(; image_name::String,
                 image_name_prefix::String,
                 image_owner::String,
                 image_directory::String,
                 docker_command::String)::Nothing
    original_directory::String = pwd()
    cd(image_directory)
    cd("builddir")
    my_run(`$(docker_command) build -t $(image_owner)/$(image_name_prefix)$(image_name) .`)
    cd(image_directory)
    cd("testdir")
    my_run(`$(docker_command) build -t $(image_owner)/$(image_name_prefix)test-$(image_name) .`)
    cd(original_directory)
    return nothing
end

function test(; image_name::String,
                image_name_prefix::String,
                image_owner::String,
                image_directory::String,
                docker_command::String)::Nothing
    original_directory::String = pwd()
    cd(image_directory)
    cd("testdir")
    my_run(`$(docker_command) run --user predictmdtestuser --network none -it $(image_owner)/$(image_name_prefix)test-$(image_name) /bin/bash -c "/bin/runtests.sh"`)
    cd(original_directory)
    return nothing
end

function push(; image_name::String,
                image_name_prefix::String,
                image_owner::String,
                image_directory::String,
                docker_command::String)::Nothing
    original_directory::String = pwd()
    my_run(`$(docker_command) login`)
    cd(image_directory)
    cd("builddir")
    my_run(`$(docker_command) push $(image_owner)/$(image_name_prefix)$(image_name)`)
    cd(image_directory)
    cd("testdir")
    my_run(`$(docker_command) push $(image_owner)/$(image_name_prefix)test-$(image_name)`)
    cd(original_directory)
    return nothing
end

function main()::Nothing
    DIR::String = @__DIR__
    DOCKER_COMMAND::String = "docker"
    CONFIG_FILE_NAME::String = "config.toml"
    CONFIG_FILE_PATH::String = joinpath(splitpath(DIR)...,CONFIG_FILE_NAME)
    original_directory::String = pwd()
    if length(ARGS) < 2
        error(string("Syntax: julia make.jl COMMAND IMAGE [IMAGE_NAME_PREFIX]\n",
                     "Examples: \n",
                     "julia make.jl build julia-1\n",
                     "julia make.jl test julia-1\n",
                     "julia make.jl push julia-1\n",
                     "julia make.jl build julia-1 staging-\n",
                     "julia make.jl test julia-1 staging-\n",
                     "julia make.jl push julia-1 staging-\n"))
    end
    command::Symbol = Symbol(strip(ARGS[1]))
    image_name::String = strip(ARGS[2])
    image_name_prefix::String = strip(length(ARGS) == 2 ? "" : ARGS[3])
    config = try
        Pkg.TOML.parsefile(CONFIG_FILE_PATH)
    catch
        Dict()
    end
    _image_owner::String = strip(get(config, "image_owner", ""))
    image_owner::String = strip(length(_image_owner) == 0 ? "dilumaluthge" : _image_owner)
    image_list::Vector{String} = strip.(get(config, "image_list", String[]))
    if !(image_name in image_list)
        error(string("image $(image_name) is not in list of images"))
    end

    generate_dockerfiles(; directory = DIR,
                           image_name_prefix = image_name_prefix,
                           image_owner = image_owner,
                           image_list = [image_name])
    image_directory::String = joinpath(DIR, "images", image_name)
    if command == :build
        build(; image_name = image_name,
                image_name_prefix = image_name_prefix,
                image_owner = image_owner,
                image_directory = image_directory,
                docker_command = DOCKER_COMMAND)
    elseif command == :test
        test(; image_name = image_name,
                image_name_prefix = image_name_prefix,
                image_owner = image_owner,
                image_directory = image_directory,
                docker_command = DOCKER_COMMAND)
    elseif command == :push
        push(; image_name = image_name,
                image_name_prefix = image_name_prefix,
                image_owner = image_owner,
                image_directory = image_directory,
                docker_command = DOCKER_COMMAND)
    else
        error(string("command $(string(command)) is not one of build, test, push"))
    end
    cd(original_directory)
    return nothing
end

main()
