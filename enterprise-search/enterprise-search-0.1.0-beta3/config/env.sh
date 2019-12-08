#####################################################
## Elastic Enterprise Search Environment Variables ##
#####################################################

# Java options for JVM tuning.
# The filebeat component requires less memory
export FILEBEAT_JAVA_OPTS=${FILEBEAT_JAVA_OPTS:-${JAVA_OPTS:-"-Xms512m -Xmx512m"}}
export JAVA_OPTS=${JAVA_OPTS:-"-Xmx2g"}

export APP_SERVER_JAVA_OPTS=${APP_SERVER_JAVA_OPTS:-$JAVA_OPTS}
export CONNECTORS_JAVA_OPTS=${CONNECTORS_JAVA_OPTS:-$JAVA_OPTS}
export WORKER_JAVA_OPTS=${WORKER_JAVA_OPTS:-$JAVA_OPTS}

# Seconds to wait before shutting down the application.
export SHUTDOWN_GRACE_TIME=15
