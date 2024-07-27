#!/bin/bash

# set gitlab context, get home permission and source the save env
echo "Use the Gitlab Agent"
oc config get-contexts
oc config use-context $GITLAB_AGENT  
      