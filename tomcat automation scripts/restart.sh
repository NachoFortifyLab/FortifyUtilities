#!/bin/bash

# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -----------------------------------------------------------------------------
# Restart Script for the CATALINA Server
# -----------------------------------------------------------------------------

# Variables #

Tomcat_Status=$(sh /opt/apache-tomcat-9.0.86/bin/shutdown.sh | tail -n 1) 

# Checks if the tomcat is running
if echo "$Tomcat_Status" | grep -q "Is Tomcat running? Stop aborted"; then
  # If tomcat is not running it will not restart

  echo "Tomcat is not running"
   
  echo "Tomcat cannot be restarted"
else
  # If tomcat is running it will restart it

  # Stops Tomcat
  echo "Stopping Tomcat..."

  sleep 5

  echo ""

  $CATALINA_HOME/bin/shutdown.sh

  echo ""

  # Starts Tomcat
  echo "Starting Tomcat..."

  sleep 5

  echo ""
    
  $CATALINA_HOME/bin/startup.sh

  echo ""

  echo "Tomcat restarted successfully."  
fi

