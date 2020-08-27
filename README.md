Jenkins SSH Agent built for ARM32 - also includes Docker so that it can be used as an agent to build Docker images in Jenkins.

To configure this agent in Jenkins:
- Manage Jenkins -> Manage Nodes and Clouds -> Configure Clouds -> Docker
- Connect to your Docker API
- Set up an Agent Template using the following settings:
  - <b>Docker Image:</b> vorsku/jenkins-ssh-agent-armhf:latest
  - <b>Container settings...</b>
    - <b>Volumes:</b> /var/run/docker.sock:/var/run/docker.sock
  - <b>Remote File System Root:</b> /home/jenkins
  - <b>Connect method:</b> Connect with SSH
  - <b>SSH key:</b> Inject SSH key
  - <b>User:</b> root
  - <b>Port:</b> 22

<b>CHANGELOG</b>
- 0.2 (latest) - 27/08/2020 - Rebased to Ubuntu 18.04
- 0.1 - 26/08/2020 - Initial Build running on Ubuntu 16.04

<b>TODO</b>
- Rebase to Ubuntu 20.04 (build currently broken due to libseccomp - waiting for Debian repos to be updated - <a href="https://askubuntu.com/a/1264921" target="_blank">see here for more info</a>)
