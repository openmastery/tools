# Vagrant

Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

Install [Vagrant](https://docs.vagrantup.com/v2/installation/index.html)

Clone this repository

    git clone git@github.com:ideaflow/visualizer.git

Start up the visualizer

    cd visualizer/vagrant
    vagrant up

Install a new version of the visualizer

    vagrant reload --provision

At the moment, the visualizer is passed a complete file path from the plugin.  This means that the path to your .ifm files on the host machine must be accessible via the same path on the VM.  If you're a mac user and your .ifm files are somewhere under your user home, this should just work.  If not, you'll need to update the config.vm.synced_folder setting in vagrant/Vagrantfile to be some ancestor of the directory or directories containing your .ifm files.
