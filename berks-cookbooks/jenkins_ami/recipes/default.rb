#
# Cookbook:: jenkins_ami
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
bash 'install jenkins' do
  code <<-EOH
    wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
    sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt install default-jre -y
    sudo apt-get install -y jenkins
    EOH
  end
