using PkgTemplates

# Set up a template
t = Template(; 
    user="mkborregaard",             # Your github name
    dir="~/.julia/dev",             # Where you want the file
    authors="Michael Krabbe Borregaard", # Your name
    julia=v"1.7",              # Minimum Julia version is 1.5
    plugins=[
        License(; name="MIT"),          # Use the MIT license
        Git(; manifest=true, ssh=true), # Initialise a git repository in the folder 
        GitHubActions(; x86=true),      # Run GitHub Actions on x86 only to start
        Codecov(),                      # Set up code coverage
        Documenter{GitHubActions}(),    # Set up GitHub actions CI
        Develop(),                      # ] dev the package automatically
    ],
)

# Use the template to generate a package
t("CoolNameForAPackage")

using TestPackage, Revise

# Write this function in TestPackage.jl, then run it!
TestPackage.hello_world()