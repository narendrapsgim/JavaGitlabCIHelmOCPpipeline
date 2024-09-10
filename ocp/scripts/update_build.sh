#!/bin/bash

# update the templates        
# declare an array variable
declare -a arr=('ocp/build/buildconfig1.yaml' 'ocp/build/buildconfig2.yaml' 'ocp/build/rbac-helm.yaml' 'ocp/build/vault.yaml')
## now loop through the above array
for i in '${arr[@]}'
do
    s_replace 'xNAMESPACEx' '$NAMESPACE' '$i'
    s_replace 'xNAMESPACE_RUNNERx' '$NAMESPACE_RUNNER' '$i'
    s_replace 'xNAMEx' '$GRADLE_NAME' '$i'
    s_replace 'xPULLSECRETx' '$SECRET1NAME' '$i'
    s_replace 'xAPPVERSIONx' 'latest' '$i'
    s_replace 'xGRADLE_BINx' '$GRADLE_NAME-$GRADLE_VERSION.$GRADLE_EXT' '$i'
    s_replace 'xTIMEZONEREGIONx' '$TIMEZONEREGION' '$i'
    s_replace 'xTIMEZONECITYx' '$TIMEZONECITY' '$i'
    s_replace 'xREGISTRYx' '$REGISTRY' '$i'
    s_replace 'xREPOSITORYx' '$REPOSITORY' '$i'
    s_replace 'xTAGx' '$TAG' '$i'
    s_replace 'xENV_CONTEXTx' '$GRADLE_NAME' '$i'
    s_replace 'xDOCKER_USERx' '$DOCKER_USER' '$i'      
    s_replace 'xBRANCHx' '$BRANCH' '$i'  
    s_replace 'xMAIN_GROUPx' '$MAIN_GROUP' '$i' 
    s_replace 'xNAME_REPOx' '$NAME_REPO' '$i' 
    s_replace 'xSECRET1NAMEx' '$SECRET1NAME' '$i'
    s_replace 'xSECRET1TYPEx' '$SECRET1TYPE' '$i'
    s_replace 'xSECRET1MOUNTx' '$SECRET1MOUNT' '$i'
    s_replace 'xSECRET1PATHx' '$SECRET1PATH' '$i'    
done
