Vagrant and docker provision examples
======================================

 - `00.clean-ubuntu-box` - minimal vagrant file. Runs an empty ubuntu 18.04 box
 - `01.modified-box` - box resources adjusted. Runs an empty ubuntu 18.04 box and modify amount of allocated resources.
 - `02.box-provision` - added shell vagrant provision. it installs pkgs and updates configs.
 - `03.docker` - pack project into docker image.
 - `04.docker-compose` - L.A.M.P. set up with docker compose.
 - `05.advanced-vagrant` - (Bonus for beginners) Basic vagrant provision based on Ansible uses docker inside vagrant to run mysql and other services, but php still installed in VM.
 
5th Example was not discussed in presentation. To run it you also need to install Ansible on host pc.