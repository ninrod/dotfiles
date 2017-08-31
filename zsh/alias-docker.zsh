# ------------------------------------
# Docker functions
# ------------------------------------

docker_alias_stop_all_containers() { docker stop $(docker ps -a -q); }
docker_alias_remove_all_containers() { docker rm $(docker ps -a -q); }
docker_alias_remove_all_empty_images() {docker images | awk '{print $2 " " $3}' | grep '^<none>' | awk '{print $2}' | xargs -I{} docker rmi {}; }
docker_alias_docker_file_build() { docker build -t=$1 .; }
docker_alias_show_all_docker_related_alias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
docker_alias_bash_into_running_container() { docker exec -it $(docker ps -aqf "name=$1") bash; }

# ------------------------------------
# Docker alias
# ------------------------------------

# Stop all containers
alias dstop='docker_alias_stop_all_containers'

# Remove all containers
alias drm='docker_alias_remove_all_containers'

# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# stop and remove all Exited containers
alias drsc='docker rm $(docker ps -aq --filter status=exited)'

# Docker remove image
alias dri='docker rmi'

# Remove all empty images
alias drei='docker_alias_remove_all_empty_images'

# Dockerfile build, e.g., $dbu tcnksm/test
alias dbu='docker_alias_docker_file_build'

# Show all alias related docker
alias dalias='docker_alias_show_all_docker_related_alias'

# Bash into running container
alias dbash='docker_alias_bash_into_running_container'

# Get latest container ID
alias dl="docker ps -l -q"

alias dp='docker ps --format="table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}"'

alias dclean='drmf && drei'

# Get images
alias di="docker images"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"

# Run interactive container and then auto kill it
alias drit='docker run --rm -i -t'

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"
