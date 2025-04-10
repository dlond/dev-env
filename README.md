# dev-env
Ephemeral development environments using Nix flakes - terrible project name, I know

# How to use
## Create a new project using a dev-env environment
We can't specify branches for gh templates yet, so we have to do it the long way.
* git clone --branch [environment] git@github.com:dlond/dev-env.git [project-name]
* cd [project-name]
* rm -rf .git && git init

The project repo owns the dev-env now, the rest is routine.
* git remote add origin git@github.com:dlond/[project-name]
* touch README.md
* git add .
* git commit -m "Initial commit"

To activate the environment
* nix develop .env

## Create a new dev-env environment
* cd $DEV_ENV_DIR
* git checkout -b [environment-name]
* vim .env/flake.nix
* git commit -am "Added [environment-name]"
* git push -u origin [environment-name]
