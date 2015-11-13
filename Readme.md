# Idea Flow Mapping Tools

This is the prototype version of the Idea Flow Mapping software.  It's currently file based with heavy logic in the plugin, and will be moved to a REST service hosted at demo.ideaflow.org that will allow you to use basic Idea Flow analytics tools once you create a free account.

The prototype version has two parts:

* The IFM Intellij Plugin
* The IFM Visualizer (vagrant) 

## The Intellij Plugin

You can download the plugin from the repository [intellij-plugin.zip](https://github.com/ideaflow/tools/intellij-plugin.zip)
To install the Intellij Plugin, open up "Preferences > Plugins" pane and click "Install from Disk...", browse to the downloaded zip file and install. 

The Idea Flow Mapping buttons show up on the main tool bar, so if you have your main bar hidden, you'll have to make the bar visible to see the buttons.

To start recording an Idea Flow Map, right click on any directory and select: New > IFM File.  The editor activity will automatically start streaming to your IFM file.  In general, keep one IFM per task/story.

### IFM Buttons

**Pause** - Temporarily pauses the flow of editor activity to the IFM file.  If you are working on something that you don't want recorded, for example, it can be handy to pause so you don't clutter up your data.

**Active Task (dropdown)** - You can have multiple Idea Flow Maps open at the same time and switch between active tasks.  Switching the active task will cause editor activity to stream to the different files.  From the task drop down menu, you can also open the active task in the visualizer or remove it from the working set (your active task list).

**Event Note (paper)** - Creates a note (shown as a line) on the IFM with some context information about what's going on.  Use notes at the beginning of subtasks or major shifts in the work, so the IFM tells a clear story about the structure of the developer's task.

**Conflict (red bulb)** - Toggle conflict on to start the conflict, toggle off to end the conflict.  A conflict starts at the beginning of an unexpected observation.  After writing a bit of code then executing it to see if it works, if the code doesn't work as expected, start the conflict and type your observation question at the prompt, i.e. "Why is this code throwing a NPE?" Ending the conflict will prompt for a resolution.

**Learning (blue bulb)** - Toggle learning on to start the learning band, toggle off to end the learning band.  When you start learning, you'll be prompted for the question your trying to answer.  Try to translate the *focus* of your learning into a concise question.  End the learning band once you have an answer to your question.  In general, record learning bands at the start of a task and the start of a subtask.

**Rework (yellow bulb)** - Toggle rework on to start the rework band, toggle off to end the rework band.  When you start learning, you'll be prompted about what you're reworking.  Any code changes that are non-functional in nature (refactoring), repair or redesign when there is nothing broken -- consider rework.

Start with tracking conflicts and events only, then *after* you get used to tracking conflicts, incorporate the other types.

### Nested and Linked Bands

Conflicts can be nested inside learning and rework bands as nested conflicts by depressing the conflict button after the learning or rework button is already depressed.

Bands can also be linked together by "flipping" to a rework band when a conflict or learning band is already depressed.  Semantically, linked bands are represented as a linked list, which causes the visualization tools to collapse and treat these bands as a group.

#### Use cases for Nesting and Linking

* **Detailed Troubleshooting Model** - The developer is in troubleshooting a behavior, has a hypothesis for what is wrong, and it will take a substantial amount of rework before the hypothesis can be validated, in the mean time more conflicts can happen along the way.  Start the initial conflict.  When the hypothesis is discovered, "flip" to rework.  If new conflicts are discovered along the way, create nested conflicts inside the rework.  When the original hypothesis is validated, end the rework.

* **Trial and Error** - The developer is struggling to figure out an acceptable design strategy.  The first conflict is a "strategy conflict", i.e. the strategy isn't going to work.  Then the developer has to figure out a plan B (learning), "flip" to blue.  Once the developer has a plan B, they have to rework the code, "flip" to yellow.  Create a linked triplet for each trial and error.  

* **Unexpected Dependencies** - The developer is figuring out a strategy and runs into an unexpected dependencies that messes up their plans before they even start writing code. Figure out the strategy (learning), then when the unexpected dependency is discovered, start a nested strategy conflict.  After chasing down the dependency and resolving the concern, end the nested conflict and resume learning.

## IFM Visualizer

To open Idea Flow Maps in the visualizer (again, prototype version), you'll need to install the VirtualBox VM, which is super easy with vagrant.  The VM Webserver runs on port 8989 in an attempt to not clash with other ports you might be using for your application.  Once the server is running, you can open Idea Flow Maps from within the plugin, by choosing "Open in Visualizer" by right clicking the IFM file, or selecting the option in the active task drop down menu.

Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

Install [Vagrant](https://docs.vagrantup.com/v2/installation/index.html)

Clone this repository

    git clone git@github.com:ideaflow/tools.git

Start up the visualizer

    cd tools/vagrant
    vagrant up

Install a new version of the visualizer

    vagrant reload --provision

At the moment, the visualizer is passed a complete file path from the plugin.  This means that the path to your .ifm files on the host machine must be accessible via the same path on the VM.  If you're a mac user and your .ifm files are somewhere under your user home, this should just work.  If not, you'll need to update the config.vm.synced_folder setting in vagrant/Vagrantfile to be some ancestor of the directory or directories containing your .ifm files.
