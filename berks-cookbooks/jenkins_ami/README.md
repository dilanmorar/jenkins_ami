# jenkins_ami

TODO: Enter the cookbook description here.

This is a cookbook created to have jenkins installed and it also has packer so that an image can be created on aws. 

## Using Jenkins

### Running Jenkins

Launch an instance using the ami created, name of ami is specified in the packer.json folder

When instance has been created got to port 8080 on he ip address(xxx.xxx.xxx.xxx) so in the web browser you should have xxx.xxx.xxx.xxx:8080.

It should then take you to a page where you have to input a password

You will need to enter the machine using the key(key_name.pem) specified in packer.json and the ip address(xxx.xxx.xxx.xxx) generated. In the command line type:
```
ssh -i ~/location/of/key/key_name.pem ubuntu@xxx.xxx.xxx.xxx
```

To get access to the password input the following code:
```
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

You should now have access to jenkins. Install the plugins already given and complete the login details.

### Installing plugins

First go to jenkins --> manage jenkins --> manage plugins and install the github plugin

### Creating a build

Go to Jenkins --> New Item

Enter a name and choose freestyle project

#### General

Select GitHub project and put the link of the github project in https

#### Source Code Management

Put the ssh of the github project

Create a key Using `ssh-keygen -t rsa` on your computer, and in your github project under deploy keys add your public key that you generated. In jenkins go to add key and from there change the kind to 'SSH Username with private key', add username and manually add the private key generated.

#### Build triggers

Choose 'GitHub hook trigger for GITScm polling'

On the GitHub project, under webhooks add a new webhook. Have the payload URL as https://xxx.xxx.xxx.xxx:8080/github-webhook/ and change the content type to application/json. So now whenever a change is made to the github project it will trigger this Jenkins build.

#### Build

Usually you want to see if the code you have passes the tests you have created. Choose execute shell and type the code needed to run the tests.

### Run the build

To start the build simply select  Build Now. If the output is blue it is successful. If it is red means it was unsuccessful and you should select the console output to find out the error.
