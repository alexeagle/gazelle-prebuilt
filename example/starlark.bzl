"some module doc"
def macro(name):
    "Some docstring"
    native.genrule(
        name = name,
        outs = ["out"],
        cmd = "echo \"Hello, World!\" > $@",
    )
