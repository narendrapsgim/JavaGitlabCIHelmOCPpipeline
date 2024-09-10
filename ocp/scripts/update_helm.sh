#!/bin/bash

# update the templates        
# declare an array variable
declare -a arr=('ocp/helm/Chart.yaml' 'ocp/helm/values.yaml')
## now loop through the above array
for i in '${arr[@]}'
do
    s_replace 'xNAMESPACEx' '$NAMESPACE' '$i'
    s_replace 'xNAMEx' '$GRADLE_NAME' '$i'
    s_replace 'xPULLSECRETx' '$SECRET1NAME' '$i'
    s_replace 'xCHARTVERSIONx' '$CHARTVERSION' '$i'
    s_replace 'xAPPVERSIONx' 'latest' '$i'
    s_replace 'xGRADLE_BINx' '$GRADLE_NAME-$GRADLE_VERSION.$GRADLE_EXT' '$i'
    s_replace 'xREGISTRYx' '$REGISTRY' '$i'
    s_replace 'xREPOSITORYx' '$REPOSITORY' '$i'
    s_replace 'xTAGx' '$TAG' '$i'
    s_replace 'xDOCKER_USERx' '$DOCKER_USER' '$i'      
    s_replace 'xPORTx' '$PORT' '$i' 
    s_replace 'xHOSTNAMEx' '$HOSTNAME' '$i'
    s_replace 'xSECRET1NAMEx' '$SECRET1NAME' '$i'
    s_replace 'xSECRET1MOUNTx' '$SECRET1MOUNT' '$i'
done
