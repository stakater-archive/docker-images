# docker-images
Docker Images


### Commands

1. The printenv command prints the names and values of all currently defined environment variables:

printenv

2. To examine the value of a particular variable, we can specify its name to the printenv command:

printenv TERM

e.g.

printenv JAVA_HOME

3. Open a command-line terminal type the following command to list total number of Ethernet devices on Linux:

$ lspci
$ lspci | less
$ lspci | grep -i eth

4.  To list actual ip address assigned to the interface, enter:

$ ifconfig
$ ifconfig eth0

5. run container and bash into it

`docker run --name stakater_grails --rm -i -t stakater/grails:2.3.8 bash`

This will create a container named stakater_grails and start a Bash session.