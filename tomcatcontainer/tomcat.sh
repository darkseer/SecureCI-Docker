#!/bin/bash
__create_user() {
# Create a user to SSH into as.
SSH_USERPASS=`uuid`
echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin tomcat)
echo ssh user password: $SSH_USERPASS
}
# Call all functions
__create_user
