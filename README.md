# dev-env
Ephemeral development environments using Nix flakes - terrible project name, I know

# How to use
## Create a new project using a dev-env environment
We can't specify branches for gh templates yet, so we have to do it the long way.
* git clone --branch [environment] git@github.com:dlond/dev-env.git [project-name]
* cd [project-name]
* echo > README.md
* rm -rf .git && git init

The project repo now owns the dev-env template, the rest is routine.
* git add .
* git commit -m "Initial commit"
* gh repo create
* git push

To activate the environment
* nix develop .env

## Create a new dev-env environment
* cd $DEV_ENV_DIR
* git checkout -b [environment-name]
* vim .env/flake.nix
* git commit -am "Added [environment-name]"
* git push -u origin [environment-name]
