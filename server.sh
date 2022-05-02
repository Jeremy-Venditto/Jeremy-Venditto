#!/bin/bash

#   _____                              __  ___
#  / ___/___  ______   _____  _____   /  |/  /__  ____  __  __
#  \__ \/ _ \/ ___/ | / / _ \/ ___/  / /|_/ / _ \/ __ \/ / / /
# ___/ /  __/ /   | |/ /  __/ /     / /  / /  __/ / / / /_/ /
#/____/\___/_/    |___/\___/_/     /_/  /_/\___/_/ /_/\__,_/
#------------------------------------------------------------


#Jeremy Venditto
#https://github.com/jeremy-venditto
#https://jeremyvenditto.info



# required packages

#		       	!!! IMPORTANT !!!
#	If you edit ANY lines before the END CONFIGURATION
#	  section (line 205) YOU WILL BREAK THIS SCRIPT

#	Recommended: edit configuration via program function

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#
#~~~~~~~~~~~~~~~~~~~BEGIN CONFIGURATION~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Server 1
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SERVER_1='[SERVER 1 EMPTY]'
SERVER_1_USER_KEYS=''
SERVER_1_ROOT_KEYS=''
SERVER_1_ROOT_KEYS=''
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Server 2
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SERVER_2='[SERVER 2 EMPTY]'
SERVER_2_USERNAME=""
SERVER_2_USER_KEYS=""
SERVER_2_ROOT_KEYS=""
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Server 3
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SERVER_3='[SERVER 3 EMPTY]'
SERVER_3_USERNAME=""
SERVER_3_USER_KEYS=""
SERVER_3_ROOT_KEYS=""
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Server 4
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SERVER_4='[SERVER 4 EMPTY]'
SERVER_4_USERNAME=""
SERVER_4_USER_KEYS=""
SERVER_4_ROOT_KEYS=""
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Server 5
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SERVER_5='[SERVER 5 EMPTY]'
SERVER_5_USERNAME=""
SERVER_5_USER_KEYS=""
SERVER_5_ROOT_KEYS=""
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Server 6
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SERVER_6='[SERVER 6 EMPTY]'
SERVER_6_USERNAME=""
SERVER_6_USER_KEYS=""
SERVER_6_ROOT_KEYS=""
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Server 7
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SERVER_7='[SERVER 7 EMPTY]'
SERVER_7_USERNAME=""
SERVER_7_USER_KEYS=""
SERVER_7_ROOT_KEYS=""
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Server 8
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SERVER_8='[SERVER 8 EMPTY]'
SERVER_8_USERNAME=""
SERVER_8_USER_KEYS=""
SERVER_8_ROOT_KEYS=""
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Server 9
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SERVER_9='[SERVER 9 EMPTY]'
SERVER_9_USERNAME=""
SERVER_9_USER_KEYS=""
SERVER_9_ROOT_KEYS=""
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Server 10
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SERVER_10='[SERVER 10 EMPTY]'
SERVER_10_USERNAME=""
SERVER_10_USER_KEYS=""
SERVER_10_ROOT_KEYS=""
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Server 11
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SERVER_11='[SERVER 11 EMPTY]'
SERVER_11_USERNAME=""
SERVER_11_USER_KEYS=""
SERVER_11_ROOT_KEYS=""
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Server 12
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SERVER_12='[SERVER 12 EMPTY]'
SERVER_12_USERNAME=""
SERVER_12_USER_KEYS=""
SERVER_12_ROOT_KEYS=""
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Server 13
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SERVER_13='[SERVER 13 EMPTY]'
SERVER_13_USERNAME=""
SERVER_13_USER_KEYS=""
SERVER_13_ROOT_KEYS=""
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Server 14
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SERVER_14='[SERVER 14 EMPTY]'
SERVER_14_USERNAME=""
SERVER_14_USER_KEYS=""
SERVER_14_ROOT_KEYS=""
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Server 15
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SERVER_15='[SERVER 15 EMPTY]'
SERVER_15_USERNAME=""
SERVER_15_USER_KEYS=""
SERVER_15_ROOT_KEYS=""
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Server 16
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SERVER_16='[SERVER 16 EMPTY]'
SERVER_16_USERNAME=""
SERVER_16_USER_KEYS=""
SERVER_16_ROOT_KEYS=""
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Server 17
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SERVER_17='[SERVER 17 EMPTY]'
SERVER_17_USERNAME=""
SERVER_17_USER_KEYS=""
SERVER_17_ROOT_KEYS=""
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Server 18
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SERVER_18='[SERVER 18 EMPTY]'
SERVER_18_USERNAME=""
SERVER_18_USER_KEYS=""
SERVER_18_ROOT_KEYS=""
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Server 19
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SERVER_19='[SERVER 19 EMPTY]'
SERVER_19_USERNAME=""
SERVER_19_USER_KEYS=""
SERVER_19_ROOT_KEYS=""
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Server 20
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SERVER_20='[SERVER 20 EMPTY]'
SERVER_20_USERNAME=""
SERVER_20_USER_KEYS=""
SERVER_20_ROOT_KEYS=""
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Put to top
#~~~~~~~~~~~~~~~~~~~ NUMBER OF SERVERS ~~~~~~~~~~~~~~~~~~~~~~~~~
NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED='1'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#
#~~~~~~~~~~~~~~~~~~~END CONFIGURATION~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#

#~~~~~~~~~~~~~~~~~~~~~~~~~
# text colors
# ~~~~~~~~~~~~~~~~~~~~~~~~
RED="tput setaf 1"
GREEN="tput setaf 2"
YELLOW="tput setaf 3"
BLUE="tput setaf 4"
MAGENTA="tput setaf 5"
CYAN="tput setaf 6"
WHITE="tput setaf 7"
#~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _LOGO_ {
$RED
echo '  ____________________________________________________  '
echo ' |____________________________________________________| '
$CYAN
echo ' _____                         ___  ___                 '
echo '/  ___|                        |  \/  |                 '
echo '\ `--.  ___ ______   _____ ____| .  . | ___ ____  _   _ '
echo ' `--. \/ _ \ ,__\ \ / / _ \ .__| |\/| |/ _ \ ._ \| | | |'
echo '/\__/ /  __/ |   \ V /  __/ |  | |  | |  __/ | | | |_| |'
echo '\____/ \___|_|    \_/ \___|_|  \_|  |_/\___|_| |_|\__,_|'
echo
echo -e "\e[1;31;4;46m                                           computerjerms\e[0m"
$RED
echo '  ____________________________________________________  '
echo ' |____________________________________________________| '
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _CHECK_SERVER_COUNT_ {
$WHITE
echo
if [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = "1" ]]; then echo 'Program is configured to use to 1 server'
#_CHANGE_CONFIG_1_SERVER
fi
if [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = "2" ]]; then echo 'Program is configured to use to 2 servers'
#_CHANGE_CONFIG_2_SERVERS
fi
if [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = "3" ]]; then echo 'Program is configured to use to 3 servers'
#_CHANGE_CONFIG_3_SERVERS
fi
if [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = "4" ]]; then echo 'Program is configured to use to 4 servers'
#_CHANGE_CONFIG_4_SERVERS
fi
if [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = "5" ]]; then echo 'Program is configured to use to 5 servers'
#_CHANGE_CONFIG_5_SERVERS
fi
if [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = "6" ]]; then echo 'Program is configured to use to 6 servers'
#_CHANGE_CONFIG_6_SERVERS
fi
if [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = "7" ]]; then echo 'Program is configured to use to 7 servers'
#_CHANGE_CONFIG_7_SERVERS
fi
if [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = "8" ]]; then echo 'Program is configured to use to 8 servers'
#_CHANGE_CONFIG_8_SERVERS
fi
if [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = "9" ]]; then echo 'Program is configured to use to 9 servers'
#_CHANGE_CONFIG_9_SERVERS
fi
if [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = "10" ]]; then echo 'Program is configured to use to 10 servers'
#_CHANGE_CONFIG_10_SERVERS
fi
if [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = "11" ]]; then echo 'Program is configured to use to 11 servers'
#_CHANGE_CONFIG_11_SERVERS
fi
if [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = "12" ]]; then echo 'Program is configured to use to 12 servers'
#_CHANGE_CONFIG_12_SERVERS
fi
if [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = "13" ]]; then echo 'Program is configured to use to 13 servers'
#_CHANGE_CONFIG_13_SERVERS
fi
if [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = "14" ]]; then echo 'Program is configured to use to 14 servers'
#_CHANGE_CONFIG_14_SERVERS
fi
if [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = "15" ]]; then echo 'Program is configured to use to 15 servers'
#_CHANGE_CONFIG_15_SERVERS
fi
if [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = "16" ]]; then echo 'Program is configured to use to 16 servers'
#_CHANGE_CONFIG_16_SERVERS
fi
if [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = "17" ]]; then echo 'Program is configured to use to 17 servers'
#_CHANGE_CONFIG_17_SERVERS
fi
if [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = "18" ]]; then echo 'Program is configured to use to 18 servers'
#_CHANGE_CONFIG_18_SERVERS
fi
if [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = "19" ]]; then echo 'Program is configured to use to 19 servers'
#_CHANGE_CONFIG_19_SERVERS
fi
if [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = "20" ]]; then echo 'Program is configured to use to 20 servers'
#_CHANGE_CONFIG_20_SERVERS
fi
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Check if server name already exists for edit config
function checkname {
if [[ $S_1_EDITED_NAME = $SERVER_1 ]]; then echo 'Cant do that bro'
fi
}
#~~~~~~~~~~~~BETA FEATURE~~~~~~~~~~~~~~~~~
# sed line number variables
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SED_SERVER_1_HOSTNAME=32
SED_SERVER_1_USERNAME=33
SED_SERVER_1_USER_KEYS=34
SED_SERVER_1_ROOT_KEYS=35

SED_SERVER_2_HOSTNAME=41
SED_SERVER_2_USERNAME=42
SED_SERVER_2_USER_KEYS=43
SED_SERVER_2_ROOT_KEYS=44

SED_SERVER_3_HOSTNAME=50  
SED_SERVER_3_USERNAME=51
SED_SERVER_3_USER_KEYS=52 
SED_SERVER_3_ROOT_KEYS=53

SED_SERVER_4_HOSTNAME=59
SED_SERVER_4_USERNAME=60
SED_SERVER_4_USER_KEYS=61
SED_SERVER_4_ROOT_KEYS=62

SED_SERVER_5_HOSTNAME=68
SED_SERVER_5_USERNAME=69
SED_SERVER_5_USER_KEYS=70
SED_SERVER_5_ROOT_KEYS=71

SED_SERVER_6_HOSTNAME=77
SED_SERVER_6_USERNAME=78  
SED_SERVER_6_USER_KEYS=79 
SED_SERVER_6_ROOT_KEYS=80

SED_SERVER_7_HOSTNAME=86
SED_SERVER_7_USERNAME=87
SED_SERVER_7_USER_KEYS=88
SED_SERVER_7_ROOT_KEYS=89

SED_SERVER_8_HOSTNAME=95
SED_SERVER_8_USERNAME=96
SED_SERVER_8_USER_KEYS=97
SED_SERVER_8_ROOT_KEYS=98

SED_SERVER_9_HOSTNAME=104
SED_SERVER_9_USERNAME=105
SED_SERVER_9_USER_KEYS=106
SED_SERVER_9_ROOT_KEYS=107

SED_SERVER_10_HOSTNAME=113
SED_SERVER_10_USERNAME=114
SED_SERVER_10_USER_KEYS=115
SED_SERVER_10_ROOT_KEYS=116

SED_SERVER_11_HOSTNAME=122
SED_SERVER_11_USERNAME=123
SED_SERVER_11_USER_KEYS=124
SED_SERVER_11_ROOT_KEYS=125

SED_SERVER_12_HOSTNAME=131
SED_SERVER_12_USERNAME=132
SED_SERVER_12_USER_KEYS=133
SED_SERVER_12_ROOT_KEYS=134

SED_SERVER_13_HOSTNAME=140
SED_SERVER_13_USERNAME=141
SED_SERVER_13_USER_KEYS=142
SED_SERVER_13_ROOT_KEYS=143

SED_SERVER_14_HOSTNAME=149
SED_SERVER_14_USERNAME=150
SED_SERVER_14_USER_KEYS=151
SED_SERVER_14_ROOT_KEYS=152

SED_SERVER_15_HOSTNAME=158
SED_SERVER_15_USERNAME=159
SED_SERVER_15_USER_KEYS=160
SED_SERVER_15_ROOT_KEYS=161

SED_SERVER_16_HOSTNAME=167
SED_SERVER_16_USERNAME=168
SED_SERVER_16_USER_KEYS=169
SED_SERVER_16_ROOT_KEYS=170

SED_SERVER_17_HOSTNAME=176
SED_SERVER_17_USERNAME=177
SED_SERVER_17_USER_KEYS=178
SED_SERVER_17_ROOT_KEYS=179

SED_SERVER_18_HOSTNAME=185
SED_SERVER_18_USERNAME=186
SED_SERVER_18_USER_KEYS=187
SED_SERVER_18_ROOT_KEYS=188

SED_SERVER_19_HOSTNAME=194
SED_SERVER_19_USERNAME=195
SED_SERVER_19_USER_KEYS=196
SED_SERVER_19_ROOT_KEYS=197

SED_SERVER_20_HOSTNAME=203  
SED_SERVER_20_USERNAME=204
SED_SERVER_20_USER_KEYS=205
SED_SERVER_20_ROOT_KEYS=206

#SED_ADD_SERVER_4
#SED_ADD_SERVER_5
#SED_ADD_SERVER_6
#SED_ADD_SERVER_7
#SED_ADD_SERVER_8
#SED_ADD_SERVER_9
#SED_ADD_SERVER_10
#SED_ADD_SERVER_11
#SED_ADD_SERVER_12
#SED_ADD_SERVER_13
#SED_ADD_SERVER_14
#SED_ADD_SERVER_15
#SED_ADD_SERVER_16
#SED_ADD_SERVER_17
#SED_ADD_SERVER_18
#SED_ADD_SERVER_19

#SED_REMOVE_SERVER_4
#SED_REMOVE_SERVER_5
#SED_REMOVE_SERVER_6
#SED_REMOVE_SERVER_7
#SED_REMOVE_SERVER_8
#SED_REMOVE_SERVER_9
#SED_REMOVE_SERVER_10
#SED_REMOVE_SERVER_11
#SED_REMOVE_SERVER_12
#SED_REMOVE_SERVER_13
#SED_REMOVE_SERVER_14
#SED_REMOVE_SERVER_15
#SED_REMOVE_SERVER_16
#SED_REMOVE_SERVER_17
#SED_REMOVE_SERVER_18
#SED_REMOVE_SERVER_19


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SED EDIT SERVER NAME FUNCTION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _SED_EDIT_SERVER_3_HOSTNAME {
echo 'hi'
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SED EDIT USERNAME FUNCTION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _SED_EDIT_SERVER_3_USERNAME {
echo 'hi'
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SED EDIT USER KEYS FUNCTION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _SED_EDIT_SERVER_3_USER_KEYS {
echo 'hi'
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SED EDIT ROOT KEYS FUNCTION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _SED_EDIT_SERVER_3_ROOT_KEYS {
echo 'hi'
}


#TO DO: Move this down or the others up....

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SED REMOVE SERVER FUNCTION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _SERVERS_TO_REMOVE_ {
echo
}
function _REMOVE_SERVER_20_ {
#add comments                                    bro im commenting this section out for your own good BUT IT WORKS
echo 'removing server 20 from list'
#sed "3748s!^!#!" server.sh > remove20-1.tmp
#sed "3823s!^!#!" remove20-1.tmp > remove20-2.tmp
#sed "3824s!^!#!" remove20-2.tmp > remove20-3.tmp
#sed "3825s!^!#!" remove20-3.tmp > remove20-4.tmp
#remove comments
#sed '3747s/^.\{,1\}//' remove20-4.tmp > remove20-5.tmp
#rm remove20-1.tmp && rm remove20-2.tmp && rm remove20-3.tmp && rm remove20-4.tmp
#chmod +x remove20-5.tmp && mv remove20-5.tmp server.sh
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#############################################################################################################
#############################################################################################################
#############################################################################################################

	#TO DO: THIS IS CORRECT but not really

#~~~~~~~~~~~~~~~~~~~ ADD/REMOVE SERVERS SELECT BY IF STATEMENT ~~~~~~~~~~~~~~~~~~~~

function _CHANGE_SERVER_COUNT_ {

# number equals itself
#if [ "$VARA" -eq 0 ] && [ "$VARB" -eq 0 ]
if [[ $NEW_NUMBER_OF_SERVERS = $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED ]]; then
$RED
echo
echo "$NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED server(s) are already configured"
echo
$WHITE
fi


######## Server 1 Add ###############
######## Server 1 Remove ############

######## Server 2 Add ###############

# add server 2 (with 1 configured)

        if [[ $NEW_NUMBER_OF_SERVERS = 2 ]] && [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = 1 ]]; then
        echo 'current config is 1 server'
        echo 'Adding Server 2'
        _ADD_SERVER_2_
        echo 'there was 1 configured before.. now theres 2'
        fi

######## Server 2 Remove ############

######## Server 3 Add ###############

# add server 3 (with 1 confiured)

        if [[ $NEW_NUMBER_OF_SERVERS = 3 ]] && [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = 1 ]]; then
        echo 'current config is 1 server'
        echo 'Adding Server 2'
        _ADD_SERVER_2_
	echo 'Adding Server 3'
	_ADD_SERVER_3_
        echo 'there was 1 configured before.. now theres 2'
        fi

# add server 3 (with 2 confiured)

        if [[ $NEW_NUMBER_OF_SERVERS = 3 ]] && [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = 2 ]]; then
        echo 'current config is 2 servers'
        echo 'Adding Server 3'
        _ADD_SERVER_3_
        echo 'there was 1 configured before.. now theres 2'
        fi


######## Server 3 Remove ############

######## Server 4 Add ###############

# add server 4 (with 1 confiured)

        if [[ $NEW_NUMBER_OF_SERVERS = 4 ]] && [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = 1 ]]; then
        echo 'current config is 1 server'
        echo 'Adding Server 2'
        _ADD_SERVER_2_
        echo 'Adding Server 3'
        _ADD_SERVER_3_
	echo 'Adding Server 4'
        echo 'there was 1 configured before.. now theres 2'
        fi

######## Server 4 Remove ############

######## Server 5 Add ###############
######## Server 5 Remove ############

######## Server 6 Add ###############
######## Server 6 Remove ############

######## Server 7 Add ###############
######## Server 7 Remove ############

######## Server 8 Add ###############
######## Server 8 Remove ############

######## Server 9 Add ###############
######## Server 9 Remove ############

######## Server 10 Add ###############
######## Server 10 Remove ############

######## Server 11 Add ###############
######## Server 11 Remove ############

######## Server 12 Add ###############
######## Server 12 Remove ############

######## Server 13 Add ###############
######## Server 13 Remove ############

######## Server 14 Add ###############
######## Server 14 Remove ############

######## Server 15 Add ###############
######## Server 15 Remove ############

######## Server 16 Add ###############
######## Server 16 Remove ############

######## Server 17 Add ###############
######## Server 17 Remove ############

######## Server 18 Add ###############
######## Server 18 Remove ############

######## Server 19 Add ###############
######## Server 19 Remove ############

######## Server 20 ADD ############

# Add Server 20 (with 17 configured already)

        if [[ $NEW_NUMBER_OF_SERVERS = 20 ]] && [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = 17 ]]; then
        echo 'current config is 18 servers'
	echo 'Adding Server 18'
	_ADD_SERVER_18_
        echo 'Adding Server 19'
        _ADD_SERVER_19_
        echo 'Adding Server 20'
        _ADD_SERVER_20_
        echo 'there were 18 configured before.. now theres 20'
        fi


# Add Server 20 (with 18 configured already)

        if [[ $NEW_NUMBER_OF_SERVERS = 20 ]] && [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = 18 ]]; then
	echo 'current config is 18 servers'
        echo 'Adding Server 19'
        _ADD_SERVER_19_
	echo 'Adding Server 20'
	_ADD_SERVER_20_
        echo 'there were 18 configured before.. now theres 20'
        fi

# Add Server 20 (with 19 configured already)

        if [[ $NEW_NUMBER_OF_SERVERS = 20 && $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = 19 ]]; then

        echo 'Adding Server 20'
        _ADD_SERVER_20_
        echo 'there were 19 configured before.. now theres 20'
	fi

######## Server 20 Remove ############

# Remove Server 20 (with 20 configured)

        if [[ $NEW_NUMBER_OF_SERVERS = 19 ]] && [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = 20 ]]; then
        echo 'Adding Server 20'
        _REMOVE_SERVER_20_
        echo 'there were 20 configured before.. now theres 19'
        fi


}
#############################################################################################################
#############################################################################################################
#############################################################################################################


#############################################################################################################
#############################################################################################################


function _REMOVE_SERVER_1_ {
echo 'bitch im the remove server 20 funtion but thats retarded'
}
function _REMOVE_SERVER_2_ {
echo 'remove server 2 funtion here, saying hello'
}
function _REMOVE_SERVER_3_ {
echo 'remove server 3 funtion here, saying hello'
}
function _REMOVE_SERVER_4_ {
echo 'remove server 4 funtion here, saying hello'
}
function _REMOVE_SERVER_5_ {
echo 'remove server 5 funtion here, saying hello'
}
function _REMOVE_SERVER_6_ {
echo 'remove server 6 funtion here, saying hello'
}
function _REMOVE_SERVER_7_ {
echo 'remove server 7 funtion here, saying hello'
}
function _REMOVE_SERVER_8_ {
echo 'remove server 8 funtion here, saying hello'
}
function _REMOVE_SERVER_9_ {
echo 'remove server 9 funtion here, saying hello'
}
function _REMOVE_SERVER_10_ {
echo 'remove server 10 funtion here, saying hello'
}
function _REMOVE_SERVER_11_ {
echo 'remove server 11 funtion here, saying hello'
}
function _REMOVE_SERVER_12_ {
echo 'remove server 12 funtion here, saying hello'
}
function _REMOVE_SERVER_13_ {
echo 'remove server 13 funtion here, saying hello'
}
function _REMOVE_SERVER_14_ {
echo 'remove server 14 funtion here, saying hello'
}
function _REMOVE_SERVER_15_ {
echo 'remove server 15 funtion here, saying hello'
}
function _REMOVE_SERVER_16_ {
echo 'remove server 16 funtion here, saying hello'
}
function _REMOVE_SERVER_17_ {
echo 'remove server 17 funtion here, saying hello'
}
function _REMOVE_SERVER_18_ {
echo 'remove server 18 funtion here, saying hello'
}
function _REMOVE_SERVER_19_ {
echo 'remove server 19 funtion here, saying hello'
}
function _REMOVE_SERVER_20_ {
echo 'remove server 20 funtion here, saying hello'
}

#############################################################################################################



function _ADD_SERVER_1_ {
echo 'bitch im the add server 1 function but thats retarded....'
}
function _ADD_SERVER_2_ {
echo 'add server 2 funtion here, saying hello'
}
function _ADD_SERVER_3_ {
echo 'add server 3 funtion here, saying hello'
}
function _ADD_SERVER_4_ {
echo 'add server 4 funtion here, saying hello'
}
function _ADD_SERVER_5_ {
echo 'add server 5 funtion here, saying hello'
}
function _ADD_SERVER_6_ {
echo 'add server 6 funtion here, saying hello'
}
function _ADD_SERVER_7_ {
echo 'add server 7 funtion here, saying hello'
}
function _ADD_SERVER_8_ {
echo 'add server 8 funtion here, saying hello'
}
function _ADD_SERVER_9_ {
echo 'add server 9 funtion here, saying hello'
}
function _ADD_SERVER_10_ {
echo 'add server 10 funtion here, saying hello'
}
function _ADD_SERVER_11_ {
echo 'add server 11 funtion here, saying hello'
}
function _ADD_SERVER_12_ {
echo 'add server 12 funtion here, saying hello'
}
function _ADD_SERVER_13_ {
echo 'add server 13 funtion here, saying hello'
}
function _ADD_SERVER_14_ {
echo 'add server 14 funtion here, saying hello'
}
function _ADD_SERVER_15_ {
echo 'add server 15 funtion here, saying hello'
}
function _ADD_SERVER_16_ {
echo 'add server 16 funtion here, saying hello'
}
function _ADD_SERVER_17_ {
echo 'add server 17 funtion here, saying hello'
}
function _ADD_SERVER_18_ {
echo 'add server 18 funtion here, saying hello'
}
function _ADD_SERVER_19_ {
echo 'add server 19 funtion here, saying hello'
}
function _ADD_SERVER_20_ {
echo 'add server 20 funtion here, saying hello'
}

#############################################################################################################


# TO DO: I think this is obsolete now... the above statements should cover everything
#~~~~~~~~~~~~~~~~~~~~~~~ADD SERVERS SELECT BY IF STATEMENT ~~~~~~~~~~~~~~~~~~~~
function _ADD_SERVERS_ {
if [[ $NEW_NUMBER_OF_SERVERS = 1 ]]; then
echo 'changing to _ADD_SERVER_1_'
_ADD_SERVER_1
fi
if [[ $NEW_NUMBER_OF_SERVERS = 2 ]]; then
echo 'changing to _ADD_SERVER_2_'
_ADD_SERVER_2
fi
if [[ $NEW_NUMBER_OF_SERVERS = 3 ]]; then
echo 'changing to _ADD_SERVER_3_'
_ADD_SERVER_3
fi
if [[ $NEW_NUMBER_OF_SERVERS = 4 ]]; then
echo 'changing to _ADD_SERVER_4_'
_ADD_SERVER_4
fi
if [[ $NEW_NUMBER_OF_SERVERS = 5 ]]; then
echo 'changing to _ADD_SERVER_5_'
_ADD_SERVER_5
fi
if [[ $NEW_NUMBER_OF_SERVERS = 6 ]]; then
echo 'changing to _ADD_SERVER_6_'
_ADD_SERVER_6
fi
if [[ $NEW_NUMBER_OF_SERVERS = 7 ]]; then
echo 'changing to _ADD_SERVER_7_'
_ADD_SERVER_7
fi
if [[ $NEW_NUMBER_OF_SERVERS = 8 ]]; then
echo 'changing to _ADD_SERVER_8_'
_ADD_SERVER_8
fi
if [[ $NEW_NUMBER_OF_SERVERS = 9 ]]; then
echo 'changing to _ADD_SERVER_9_'
_ADD_SERVER_9
fi
if [[ $NEW_NUMBER_OF_SERVERS = 10 ]]; then
echo 'changing to _ADD_SERVER_10_'
_ADD_SERVER_10
fi
if [[ $NEW_NUMBER_OF_SERVERS = 11 ]]; then
echo 'changing to _ADD_SERVER_11_'
_ADD_SERVER_11
fi
if [[ $NEW_NUMBER_OF_SERVERS = 12 ]]; then
echo 'changing to _ADD_SERVER_12_'
_ADD_SERVER_12
fi
if [[ $NEW_NUMBER_OF_SERVERS = 13 ]]; then
echo 'changing to _ADD_SERVER_13_'
_ADD_SERVER_13
fi
if [[ $NEW_NUMBER_OF_SERVERS = 14 ]]; then
echo 'changing to _ADD_SERVER_14_'
_ADD_SERVER_14
fi
if [[ $NEW_NUMBER_OF_SERVERS = 15 ]]; then
echo 'changing to _ADD_SERVER_15_'
_ADD_SERVER_15
fi
if [[ $NEW_NUMBER_OF_SERVERS = 16 ]]; then
echo 'changing to _ADD_SERVER_16_'
_ADD_SERVER_16
fi
if [[ $NEW_NUMBER_OF_SERVERS = 17 ]]; then
echo 'changing to _ADD_SERVER_17_'
_ADD_SERVER_17
fi
if [[ $NEW_NUMBER_OF_SERVERS = 18 ]]; then
echo 'changing to _ADD_SERVER_18_'
_ADD_SERVER_18
fi
if [[ $NEW_NUMBER_OF_SERVERS = 19 ]]; then
echo 'changing to _ADD_SERVER_19_'
_ADD_SERVER_19
fi
if [[ $NEW_NUMBER_OF_SERVERS = 20 ]]; then
echo 'changing to _ADD_SERVER_20_'
_CHANGE_SERVER_COUNT_
#_ADD_SERVER_20
fi
}

function _REMOVE_SERVER_20_INITIAL_CHECK {
if [[ NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = 20 ]]; then
echo 'Program is already configured to use 20 servers!'
else
_REMOVE_SERVERS_
echo 'hi dawggy'
fi
echo 'hey yo'
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SED ADD SERVER FUNCTION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ DEELTE ME I THINK
function _ADD_SERVER_20_INITIAL_CHECK {  
if [[ $NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED = 20 ]]; then
echo 'Program is already configured to use 20 servers!'
else
_ADD_SERVERS_
fi
echo 'hi dawg'
#sed \"s/^.//g\

}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~ CHANGE CONFIG TO 1 SERVER ~~~~~~~~~~~~~
#bingo
# might have to move sed functions up...

function _ENTRY_1_NOT_EMPTY_ {
echo 'Entry is not Empty!!'
VIEW_ENTRY_1
echo 'Remove Entry Anyway?'
read -r -p "[Y/N]?" input
case $input in
    [yY][eE][sS]|[yY])
#REMOVE ENTRY FUNCTION HERE
 echo "Enry 1 Has been removed"
 echo 'lots of sed commands here'
 echo 'sed sed sed'
#_CHANGE_SERVER_COUNT_
 ;;
    [nN][oO]|[nN])
echo 'no thanks bro ill keep my entry'
       ;;
    *)
 echo "Invalid input..."
# exit 1
 ;;
esac
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#bingo this is correct
function _CHECK_EMPTY_ENTRY_1_ {
if [[ $EMPTY_ENTRY = no ]]; then
_ENTRY_1_NOT_EMPTY_
fi
}

function _CHECK_EMPTY_USERNAME_1_ {
if [[ $EMPTY_USERNAME = no ]]; then
_ENTRY_1_NOT_EMPTY_
fi
}

function _CHECK_EMPTY_USER_KEYS_1_ {
if [[ $EMPTY_USER_KEYS = no ]]; then
_ENTRY_1_NOT_EMPTY_
fi
}
function _CHECK_EMPTY_ROOT_KEYS_1_ {
if [[ $EMPTY_ROOT_KEYS = no ]]; then
_ENTRY_1_NOT_EMPTY_
fi
}
function _CHANGE_CONFIG_1_SERVER_ {
_CHECK_EMPTY_ENTRY_1_ || _CHECK_EMPTY_USERNAME_1_ || _CHECK_EMPTY_USER_KEYS_1_ || _CHECK_EMPTY_ROOT_KEYS_1_
_CHANGE_SERVER_COUNT_
#./server.sh -e
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _CHANGE_CONFIG_2_SERVER_ {
if [[ $EMPTY_ENTRY = no ]]; then
_ENTRY_2_NOT_EMPTY_
fi
if [[ $EMPTY_USERNAME = no ]]; then
_ENTRY_2_NOT_EMPTY_
fi
if [[ $EMPTY_USER_KEYS = no ]]; then
_ENTRY_2_NOT_EMPTY_
fi
if [[ $EMPTY_ROOT_KEYS = no ]]; then
_ENTRY_2_NOT_EMPTY_
fi
#_REMOVE_SERVER_3_
#_REMOVE_SERVER_4_
#_REMOVE_SERVER_5_
#_REMOVE_SERVER_6_
#_REMOVE_SERVER_7_
#_REMOVE_SERVER_8_
#_REMOVE_SERVER_9_
#_REMOVE_SERVER_10_
#_REMOVE_SERVER_11_
#_REMOVE_SERVER_12_
#_REMOVE_SERVER_13_
#_REMOVE_SERVER_14_
#_REMOVE_SERVER_15_
#_REMOVE_SERVER_16_
#_REMOVE_SERVER_17_
#_REMOVE_SERVER_18_
#_REMOVE_SERVER_19_
_REMOVE_SERVER_20_
./server.sh -e
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _CHANGE_CONFIG_3_SERVER_ {
if [[ $EMPTY_ENTRY = no ]]; then
_ENTRY_3_NOT_EMPTY_
fi
if [[ $EMPTY_USERNAME = no ]]; then
_ENTRY_3_NOT_EMPTY_
fi
if [[ $EMPTY_USER_KEYS = no ]]; then
_ENTRY_3_NOT_EMPTY_
fi
if [[ $EMPTY_ROOT_KEYS = no ]]; then
_ENTRY_3_NOT_EMPTY_
fi
#_REMOVE_SERVER_4_
#_REMOVE_SERVER_5_
#_REMOVE_SERVER_6_
#_REMOVE_SERVER_7_
#_REMOVE_SERVER_8_
#_REMOVE_SERVER_9_
#_REMOVE_SERVER_10_
#_REMOVE_SERVER_11_
#_REMOVE_SERVER_12_
#_REMOVE_SERVER_13_
#_REMOVE_SERVER_14_
#_REMOVE_SERVER_15_
#_REMOVE_SERVER_16_
#_REMOVE_SERVER_17_
#_REMOVE_SERVER_18_
#_REMOVE_SERVER_19_
_REMOVE_SERVER_20_
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _CHANGE_CONFIG_4_SERVER_ {
if [[ $EMPTY_ENTRY = no ]]; then
_ENTRY_4_NOT_EMPTY_
fi
if [[ $EMPTY_USERNAME = no ]]; then
_ENTRY_4_NOT_EMPTY_
fi
if [[ $EMPTY_USER_KEYS = no ]]; then
_ENTRY_4_NOT_EMPTY_
fi
if [[ $EMPTY_ROOT_KEYS = no ]]; then
_ENTRY_4_NOT_EMPTY_
fi
#_REMOVE_SERVER_5_
#_REMOVE_SERVER_6_
#_REMOVE_SERVER_7_
#_REMOVE_SERVER_8_
#_REMOVE_SERVER_9_
#_REMOVE_SERVER_10_
#_REMOVE_SERVER_11_
#_REMOVE_SERVER_12_
#_REMOVE_SERVER_13_
#_REMOVE_SERVER_14_
#_REMOVE_SERVER_15_
#_REMOVE_SERVER_16_
#_REMOVE_SERVER_17_
#_REMOVE_SERVER_18_
#_REMOVE_SERVER_19_
_REMOVE_SERVER_20_
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _CHANGE_CONFIG_5_SERVER_ {
if [[ $EMPTY_ENTRY = no ]]; then
_ENTRY_5_NOT_EMPTY_
fi
if [[ $EMPTY_USERNAME = no ]]; then
_ENTRY_5_NOT_EMPTY_
fi
if [[ $EMPTY_USER_KEYS = no ]]; then
_ENTRY_5_NOT_EMPTY_
fi
if [[ $EMPTY_ROOT_KEYS = no ]]; then
_ENTRY_5_NOT_EMPTY_
fi
#_REMOVE_SERVER_6_
#_REMOVE_SERVER_7_
#_REMOVE_SERVER_8_
#_REMOVE_SERVER_9_
#_REMOVE_SERVER_10_
#_REMOVE_SERVER_11_
#_REMOVE_SERVER_12_
#_REMOVE_SERVER_13_
#_REMOVE_SERVER_14_
#_REMOVE_SERVER_15_
#_REMOVE_SERVER_16_
#_REMOVE_SERVER_17_
#_REMOVE_SERVER_18_
#_REMOVE_SERVER_19_
_REMOVE_SERVER_20_
./server.sh -e
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _CHANGE_CONFIG_6_SERVER_ {
if [[ $EMPTY_ENTRY = no ]]; then
_ENTRY_6_NOT_EMPTY_
fi
if [[ $EMPTY_USERNAME = no ]]; then
_ENTRY_6_NOT_EMPTY_
fi
if [[ $EMPTY_USER_KEYS = no ]]; then
_ENTRY_6_NOT_EMPTY_
fi
if [[ $EMPTY_ROOT_KEYS = no ]]; then
_ENTRY_6_NOT_EMPTY_
fi
#_REMOVE_SERVER_7_
#_REMOVE_SERVER_8_
#_REMOVE_SERVER_9_
#_REMOVE_SERVER_10_
#_REMOVE_SERVER_11_
#_REMOVE_SERVER_12_
#_REMOVE_SERVER_13_
#_REMOVE_SERVER_14_
#_REMOVE_SERVER_15_
#_REMOVE_SERVER_16_
#_REMOVE_SERVER_17_
#_REMOVE_SERVER_18_
#_REMOVE_SERVER_19_
_REMOVE_SERVER_20_
./server.sh -e

}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _CHANGE_CONFIG_7_SERVER_ {
if [[ $EMPTY_ENTRY = no ]]; then
_ENTRY_7_NOT_EMPTY_
fi
if [[ $EMPTY_USERNAME = no ]]; then
_ENTRY_7_NOT_EMPTY_
fi
if [[ $EMPTY_USER_KEYS = no ]]; then
_ENTRY_7_NOT_EMPTY_
fi
if [[ $EMPTY_ROOT_KEYS = no ]]; then
_ENTRY_7_NOT_EMPTY_
fi
#_REMOVE_SERVER_8_
#_REMOVE_SERVER_9_
#_REMOVE_SERVER_10_
#_REMOVE_SERVER_11_
#_REMOVE_SERVER_12_
#_REMOVE_SERVER_13_
#_REMOVE_SERVER_14_
#_REMOVE_SERVER_15_
#_REMOVE_SERVER_16_
#_REMOVE_SERVER_17_
#_REMOVE_SERVER_18_
#_REMOVE_SERVER_19_
_REMOVE_SERVER_20_
./server.sh -e
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _CHANGE_CONFIG_8_SERVER_ {
if [[ $EMPTY_ENTRY = no ]]; then
_ENTRY_8_NOT_EMPTY_
fi
if [[ $EMPTY_USERNAME = no ]]; then
_ENTRY_8_NOT_EMPTY_
fi
if [[ $EMPTY_USER_KEYS = no ]]; then
_ENTRY_8_NOT_EMPTY_
fi
if [[ $EMPTY_ROOT_KEYS = no ]]; then
_ENTRY_8_NOT_EMPTY_
fi
#_REMOVE_SERVER_5_
#_REMOVE_SERVER_6_
#_REMOVE_SERVER_7_
#_REMOVE_SERVER_8_
#_REMOVE_SERVER_9_
#_REMOVE_SERVER_10_
#_REMOVE_SERVER_11_
#_REMOVE_SERVER_12_
#_REMOVE_SERVER_13_
#_REMOVE_SERVER_14_
#_REMOVE_SERVER_15_
#_REMOVE_SERVER_16_
#_REMOVE_SERVER_17_
#_REMOVE_SERVER_18_
#_REMOVE_SERVER_19_
_REMOVE_SERVER_20_
./server.sh -e
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _CHANGE_CONFIG_9_SERVER_ {
if [[ $EMPTY_ENTRY = no ]]; then
_ENTRY_9_NOT_EMPTY_
fi
if [[ $EMPTY_USERNAME = no ]]; then
_ENTRY_9_NOT_EMPTY_
fi
if [[ $EMPTY_USER_KEYS = no ]]; then
_ENTRY_9_NOT_EMPTY_
fi
if [[ $EMPTY_ROOT_KEYS = no ]]; then
_ENTRY_9_NOT_EMPTY_
fi
#_REMOVE_SERVER_10_
#_REMOVE_SERVER_11_
#_REMOVE_SERVER_12_
#_REMOVE_SERVER_13_
#_REMOVE_SERVER_14_
#_REMOVE_SERVER_15_
#_REMOVE_SERVER_16_
#_REMOVE_SERVER_17_
#_REMOVE_SERVER_18_
#_REMOVE_SERVER_19_
_REMOVE_SERVER_20_
./server.sh -e
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _CHANGE_CONFIG_10_SERVER_ {
if [[ $EMPTY_ENTRY = no ]]; then
_ENTRY_10_NOT_EMPTY_
fi
if [[ $EMPTY_USERNAME = no ]]; then
_ENTRY_10_NOT_EMPTY_
fi
if [[ $EMPTY_USER_KEYS = no ]]; then
_ENTRY_10_NOT_EMPTY_
fi
if [[ $EMPTY_ROOT_KEYS = no ]]; then
_ENTRY_10_NOT_EMPTY_
fi
#_REMOVE_SERVER_11_
#_REMOVE_SERVER_12_
#_REMOVE_SERVER_13_
#_REMOVE_SERVER_14_
#_REMOVE_SERVER_15_
#_REMOVE_SERVER_16_
#_REMOVE_SERVER_17_
#_REMOVE_SERVER_18_
#_REMOVE_SERVER_19_
_REMOVE_SERVER_20_
./server.sh -e
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _CHANGE_CONFIG_11_SERVER_ {
if [[ $EMPTY_ENTRY = no ]]; then
_ENTRY_11_NOT_EMPTY_
fi
if [[ $EMPTY_USERNAME = no ]]; then
_ENTRY_11_NOT_EMPTY_
fi
if [[ $EMPTY_USER_KEYS = no ]]; then
_ENTRY_11_NOT_EMPTY_
fi
if [[ $EMPTY_ROOT_KEYS = no ]]; then
_ENTRY_11_NOT_EMPTY_
fi
#_REMOVE_SERVER_11_
#_REMOVE_SERVER_12_
#_REMOVE_SERVER_13_
#_REMOVE_SERVER_14_
#_REMOVE_SERVER_15_
#_REMOVE_SERVER_16_
#_REMOVE_SERVER_17_
#_REMOVE_SERVER_18_
#_REMOVE_SERVER_19_
_REMOVE_SERVER_20_
./server.sh -e
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _CHANGE_CONFIG_12_SERVER_ {
if [[ $EMPTY_ENTRY = no ]]; then
_ENTRY_12_NOT_EMPTY_
fi
if [[ $EMPTY_USERNAME = no ]]; then
_ENTRY_12_NOT_EMPTY_
fi
if [[ $EMPTY_USER_KEYS = no ]]; then
_ENTRY_12_NOT_EMPTY_
fi
if [[ $EMPTY_ROOT_KEYS = no ]]; then
_ENTRY_12_NOT_EMPTY_
fi
#_REMOVE_SERVER_13_
#_REMOVE_SERVER_14_
#_REMOVE_SERVER_15_
#_REMOVE_SERVER_16_
#_REMOVE_SERVER_17_
#_REMOVE_SERVER_18_
#_REMOVE_SERVER_19_
_REMOVE_SERVER_20_
./server.sh -e
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _CHANGE_CONFIG_13_SERVER_ {
if [[ $EMPTY_ENTRY = no ]]; then
_ENTRY_13_NOT_EMPTY_
fi
if [[ $EMPTY_USERNAME = no ]]; then
_ENTRY_13_NOT_EMPTY_
fi
if [[ $EMPTY_USER_KEYS = no ]]; then
_ENTRY_13_NOT_EMPTY_
fi
if [[ $EMPTY_ROOT_KEYS = no ]]; then
_ENTRY_13_NOT_EMPTY_
fi
#_REMOVE_SERVER_14_
#_REMOVE_SERVER_15_
#_REMOVE_SERVER_16_
#_REMOVE_SERVER_17_
#_REMOVE_SERVER_18_
#_REMOVE_SERVER_19_
_REMOVE_SERVER_20_
./server.sh -e
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _CHANGE_CONFIG_14_SERVER_ {
if [[ $EMPTY_ENTRY = no ]]; then
_ENTRY_14_NOT_EMPTY_
fi
if [[ $EMPTY_USERNAME = no ]]; then
_ENTRY_14_NOT_EMPTY_
fi
if [[ $EMPTY_USER_KEYS = no ]]; then
_ENTRY_14_NOT_EMPTY_
fi
if [[ $EMPTY_ROOT_KEYS = no ]]; then
_ENTRY_14_NOT_EMPTY_
fi
#_REMOVE_SERVER_15_
#_REMOVE_SERVER_16_
#_REMOVE_SERVER_17_
#_REMOVE_SERVER_18_
#_REMOVE_SERVER_19_
_REMOVE_SERVER_20_
./server.sh -e
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _CHANGE_CONFIG_15_SERVER_ {
if [[ $EMPTY_ENTRY = no ]]; then
_ENTRY_15_NOT_EMPTY_
fi
if [[ $EMPTY_USERNAME = no ]]; then
_ENTRY_15_NOT_EMPTY_
fi
if [[ $EMPTY_USER_KEYS = no ]]; then
_ENTRY_15_NOT_EMPTY_
fi
if [[ $EMPTY_ROOT_KEYS = no ]]; then
_ENTRY_15_NOT_EMPTY_
fi
#_REMOVE_SERVER_16_
#_REMOVE_SERVER_17_
#_REMOVE_SERVER_18_
#_REMOVE_SERVER_19_
_REMOVE_SERVER_20_
./server.sh -e
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _CHANGE_CONFIG_16_SERVER_ {
if [[ $EMPTY_ENTRY = no ]]; then
_ENTRY_16_NOT_EMPTY_
fi
if [[ $EMPTY_USERNAME = no ]]; then
_ENTRY_16_NOT_EMPTY_
fi
if [[ $EMPTY_USER_KEYS = no ]]; then
_ENTRY_16_NOT_EMPTY_
fi
if [[ $EMPTY_ROOT_KEYS = no ]]; then
_ENTRY_16_NOT_EMPTY_
fi
#_REMOVE_SERVER_17_
#_REMOVE_SERVER_18_
#_REMOVE_SERVER_19_
_REMOVE_SERVER_20_
./server.sh -e

}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _CHANGE_CONFIG_17_SERVER_ {
if [[ $EMPTY_ENTRY = no ]]; then
_ENTRY_17_NOT_EMPTY_
fi
if [[ $EMPTY_USERNAME = no ]]; then
_ENTRY_17_NOT_EMPTY_
fi
if [[ $EMPTY_USER_KEYS = no ]]; then
_ENTRY_17_NOT_EMPTY_
fi
if [[ $EMPTY_ROOT_KEYS = no ]]; then
_ENTRY_17_NOT_EMPTY_
fi
#_REMOVE_SERVER_18_
#_REMOVE_SERVER_19_
_REMOVE_SERVER_20_
./server.sh -e
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _CHANGE_CONFIG_18_SERVER_ {
if [[ $EMPTY_ENTRY = no ]]; then
_ENTRY_18_NOT_EMPTY_
fi
if [[ $EMPTY_USERNAME = no ]]; then
_ENTRY_18_NOT_EMPTY_
fi
if [[ $EMPTY_USER_KEYS = no ]]; then
_ENTRY_18_NOT_EMPTY_
fi
if [[ $EMPTY_ROOT_KEYS = no ]]; then
_ENTRY_18_NOT_EMPTY_
fi
#_REMOVE_SERVER_19_
_REMOVE_SERVER_20_
./server.sh -e
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _CHANGE_CONFIG_19_SERVER_ {
if [[ $EMPTY_ENTRY = no ]]; then
_ENTRY_19_NOT_EMPTY_
fi
if [[ $EMPTY_USERNAME = no ]]; then
_ENTRY_19_NOT_EMPTY_
fi
if [[ $EMPTY_USER_KEYS = no ]]; then
_ENTRY_19_NOT_EMPTY_
fi
if [[ $EMPTY_ROOT_KEYS = no ]]; then
_ENTRY_19_NOT_EMPTY_
fi
_REMOVE_SERVER_20_
./server.sh -e
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _CHANGE_CONFIG_20_SERVER_ {
if [[ $EMPTY_ENTRY = no ]]; then
_ENTRY_20_NOT_EMPTY_
fi
if [[ $EMPTY_USERNAME = no ]]; then
_ENTRY_20_NOT_EMPTY_
fi
if [[ $EMPTY_USER_KEYS = no ]]; then
_ENTRY_20_NOT_EMPTY_
fi
if [[ $EMPTY_ROOT_KEYS = no ]]; then
_ENTRY_20_NOT_EMPTY_
fi
}



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SED CHECK IF ENTRY EXIISTS BEFORE REMOVING ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _CHANGE_CONFIG_CHECK_IF_ENTRY_EXISTS {
echo
echo 'Checking to see if the entry already exists'
if [[ $SERVER_1 != "[SERVER 1 EMPTY]" ]] && [[ $SERVER_1 != "" ]]; then
EMPTY_ENTRY=no
else
EMPTY_ENTRY=yes
fi
if [[ $SERVER_1_USERNAME != "" ]]; then
EMPTY_USERNAME=no
else
EMPTY_USERNAME=yes
fi
if [[ $SERVER_1_USER_KEYS != "" ]]; then
EMPTY_USER_KEYS=no
else
EMPTY_USER_KEYS=yes
fi
if [[ $SERVER_1_ROOT_KEYS != "" ]]; then
EMPTY_ROOT_KEYS=no
else
EMPTY_ROOT_KEYS=yes
fi
if [[ $NEW_NUMBER_OF_SERVERS = 1 ]]; then
_CHANGE_CONFIG_1_SERVER_
fi


}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ UPDATE TO SELECTED NUMBER OF SERVERS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _SED_UPDATE_SERVER_COUNT_ {
if [[ $NEW_NUMBER_OF_SERVERS = 1 ]]; then
echo "Preparing..."
fi
if [[ $NEW_NUMBER_OF_SERVERS = 1 ]]; then
_CHANGE_CONFIG_CHECK_IF_ENTRY_EXISTS
#_CHANGE_CONFIG_1_SERVER_
fi
if [[ $NEW_NUMBER_OF_SERVERS = 2 ]]; then
echo 'changing config to display 2 server'
$_CHANGE_CONFIG_2_SERVERS_
fi
if [[ $NEW_NUMBER_OF_SERVERS = 3 ]]; then
echo 'changing config to display 3 server'
$_CHANGE_CONFIG_3_SERVERS_
fi
if [[ $NEW_NUMBER_OF_SERVERS = 4 ]]; then
echo 'changing config to display 4 server'
$_CHANGE_CONFIG_4_SERVERS_
fi

}




#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SED SERVER COUNT FUNCTION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _SED_SERVER_COUNT_ {

$CYAN
echo
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "'$NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED' Server(s) are currently configured"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
$YELLOW
echo -n "How many servers do you want to use? (MAX 20): " 
$WHITE
read NEW_NUMBER_OF_SERVERS
#newwwwww
_CHANGE_SERVER_COUNT_
$GREEN

if [[ $NEW_NUMBER_OF_SERVERS = "1" ]]; then 
echo
echo 'Configuration has been updated to 1 server'
echo "$SERVER_1"
fi

if [[ $NEW_NUMBER_OF_SERVERS = "2" ]]; then 
echo
echo 'Configuration has been updated to 2 servers'
$UPDATE_TO_2_SERVERS
fi

if [[ $NEW_NUMBER_OF_SERVERS = "3" ]]; then echo 'Configuration has been updated to 3 servers'
fi
if [[ $NEW_NUMBER_OF_SERVERS = "4" ]]; then echo 'Configuration has been updated to 4 servers'
fi
if [[ $NEW_NUMBER_OF_SERVERS = "5" ]]; then echo 'Configuration has been updated to 5 servers'
fi
if [[ $NEW_NUMBER_OF_SERVERS = "6" ]]; then echo 'Configuration has been updated to 6 servers'
fi
if [[ $NEW_NUMBER_OF_SERVERS = "7" ]]; then echo 'Configuration has been updated to 7 servers'
fi
if [[ $NEW_NUMBER_OF_SERVERS = "8" ]]; then echo 'Configuration has been updated to 8 servers'
fi
if [[ $NEW_NUMBER_OF_SERVERS = "9" ]]; then echo 'Configuration has been updated to 9 servers'
fi
if [[ $NEW_NUMBER_OF_SERVERS = "10" ]]; then echo 'Configuration has been updated to 10 servers'
fi
if [[ $NEW_NUMBER_OF_SERVERS = "11" ]]; then echo 'Configuration has been updated to 11 servers'
fi
if [[ $NEW_NUMBER_OF_SERVERS = "12" ]]; then echo 'Configuration has been updated to 12 servers'
fi
if [[ $NEW_NUMBER_OF_SERVERS = "13" ]]; then echo 'Configuration has been updated to 13 servers'
fi
if [[ $NEW_NUMBER_OF_SERVERS = "14" ]]; then echo 'Configuration has been updated to 14 servers'
fi
if [[ $NEW_NUMBER_OF_SERVERS = "15" ]]; then echo 'Configuration has been updated to 15 servers'
fi
if [[ $NEW_NUMBER_OF_SERVERS = "16" ]]; then echo 'Configuration has been updated to 16 servers'
fi
if [[ $NEW_NUMBER_OF_SERVERS = "17" ]]; then echo 'Configuration has been updated to 17 servers'
fi
if [[ $NEW_NUMBER_OF_SERVERS = "18" ]]; then echo 'Configuration has been updated to 18 servers'
fi
if [[ $NEW_NUMBER_OF_SERVERS = "19" ]]; then echo 'Configuration has been updated to 19 servers'
fi
if [[ $NEW_NUMBER_OF_SERVERS = "20" ]]; then
echo 'Configuration has been updated to 20 servers'
_ADD_SERVER_20_
fi
## GOT IT ^^^^^

if [[ NEW_NUMBER_OF_SERVERS -gt 20 ]]; then
$RED
echo 'you picked too many servers'
### OLD
#_SED_SERVER_COUNT_
### NEWWWWWWW
_SED_UPDATE_SERVER_COUNT_
#_CHECK_SERVER_COUNT_
_SED_SERVER_COUNT_
#_ADD_SERVER_20_
fi


sed "211s/.*/NUMBER_OF_SERVERS_CURRENTLY_CONFIGURED='$NEW_NUMBER_OF_SERVERS'/g" server.sh > server.tmpnewservercount
mv server.tmpnewservercount server.sh && chmod +x server.sh

$WHITE
}


        #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ CREATE SSH KEYS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function key_name {
	$CYAN
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$YELLOW
        echo -n "Enter the filename for the new key: "
	$CYAN
	echo
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$WHITE
        read -r KEY_NAME
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function email_addr {
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        $YELLOW
        echo -n "Enter the email address: "
        $CYAN
        echo
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        $WHITE
        read -r EMAIL_ADDRESS
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function key_addr {
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        $YELLOW
        echo -e "Enter directory of new keys (default ~/.ssh): "
	echo ' no ending slash please or it wont work'
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        $WHITE
        read -e -i "$HOME/.ssh/" KEY_ADDRESS
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# TO DO: add more keygen functions to name keygen files by server

#~~~~~~~~~~~~~~~~~~~~~~ SSH KEYGEN FILE OUTPUT BY DATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function KEYGEN_FILE {
	name="keygen"
	if [[ -e $name.txt || -L $name.txt ]] ; then
	    i=0
	    while [[ -e $name-$i.txt || -L $name-$i.txt ]] ; do
	        let i++
	    done
	    name=$name-`date +%Y-%m-%d-%H%M`
	fi
	touch -- "$name".txt
	$BLUE
	KEYGEN_FINAL="${name}.txt"
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~ CREATE SSH KEY ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function CREATE_KEY {
	key_name
	key_addr
	email_addr
	KEYGEN_FILE
	#rm "$PWD"/keygen.tmp
	#ssh-keygen -t rsa -b 4096 -C "$EMAIL_ADDRESS" -f "$KEY_ADDRESS/$KEY_NAME" >> $keygen.tmp
	$WHITE
	ssh-keygen -t rsa -b 4096 -C "$EMAIL_ADDRESS" -f "$KEY_ADDRESS/$KEY_NAME" | tee -a "$PWD"/"$KEYGEN_FINAL"
	$GREEN
	echo
	#echo "$PWD"/keygen.tmp has been merged with the file "$KEYGEN_FINAL"
	echo "The above output has been saved to $KEYGEN_FINAL"
	echo
	server_prompt
	$CYAN
	echo 'Done.'
	$WHITE
}
#~~~~~~~~~~~~~~~~~~~~ Enter Server Username ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function server_usr {
        echo -n "Enter username for server login: "
        read -r SERVER_USER
}
#~~~~~~~~~~~~~~~~~~~~ Enter Server Hostname ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function server_addr {
        echo -n "Enter Server Address: "
        read -r SERVER_ADDRESS
}
#~~~~~~~~~~~~~~~~~~~~~ Send SSH Keys to Server ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function send_to_server {
        read -r -p "Send Keys to the server now? [Y/n] " input
        	case $input in
	            [yY][eE][sS]|[yY])
		server_usr
		server_addr
        	ssh-copy-id -i "${KEY_ADDRESS}${KEY_NAME}.pub" "$SERVER_USER@$SERVER_ADDRESS"
		echo
		echo 'attempt to send to server completed. no output means you rock...'
		echo
	         ;;
	            [nN][oO]|[nN])
		echo
		echo ' keys have been added to user configuration'
        	       ;;
	            *)
        	echo "Invalid input..."
	         ;;
	        esac
}
#~~~~~~~~~~~~~~~~~~~~~ Add Keys to Configuration? ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function server_prompt {
	$WHITE
        read -r -p "Add Keys to configuration? [Y/n] " input
	        case $input in
	            [yY][eE][sS]|[yY])
		USE_NEW_KEYS_CHOOSE_SERVER
	         ;;
	            [nN][oO]|[nN])
		send_to_server
	               ;;
	            *)
	        echo "Invalid input..."
	         ;;
	        esac
}
#~~~~~~~~~~~~~~~~~~~~~ ADD new SSH key choose user (FROM CREATE KEY)~~~~~~~~~~~~~~
function _ADD_KEY_CHOOSE_USER {
	PS3='Please enter your choice: '
	options=("User Keys" "Root Keys" "Back" "Quit")
	select opt in "${options[@]}"
	do
	echo "Replace user keys '$SERVER_1_USER_KEYS' with '$KEY_ADDRESS/$KEY_NAME'?"
	    case $opt in
	        "User Keys")
		read -r -p "[Y/n] " input
			case $input in
			    [yY][eE][sS]|[yY])
			sed "33s!.*!SERVER_1_USER_KEYS='$KEY_ADDRESS/$KEY_NAME'!g" server.sh > server.tmpuserkeys
			sed "33s!//!/!g" server.tmpuserkeys > server.tmpuserkeysfinal
			rm server.tmpuserkeys
			mv server.tmpuserkeysfinal server.sh && chmod +x server.sh
			echo "'$SERVER_1' User Keys have been updated to '$KEY_ADDRESS/$KEY_NAME'"
			break
			 ;;
			    [nN][oO]|[nN])
			 echo "No"
			       ;;
			    *)
			 echo "Invalid input..."
			 ;;
			esac
#;;
			#            echo "Replace user keys '$SERVER_1_USER_KEYS' with '$KEY_ADDRESS/$KEY_NAME'?"
#		        break
		        	    ;;
		"Root Keys")
         	echo "S_1_ROOT_KEYS"
		read -r -p "Replace Root Keys? [Y/n] " input
			case $input in
			    [yY][eE][sS]|[yY])
			sed "34s!.*!SERVER_1_ROOT_KEYS='$KEY_ADDRESS/KEY_NAME'!g" server.sh > server.tmprootkeys
			sed "34s!//!/!g" server.tmprootkeys > server.tmprootkeysfinal
			rm server.tmprootkeys
			mv server.tmprootkeysfinal server.sh && chmod +x server.sh
			 ;;
			    [nN][oO]|[nN])
			 echo "No"
			       ;;
			    *)
			 echo "Invalid input..."
			 ;;
			esac
			            ;;
	        "Option 3")
		USE_NEW_KEYS_CHOOSE_SERVER
                break
                	   	;;
	        "Quit")
		            break
	          	  ;;
		        *) echo "invalid option $REPLY";;
			    esac
	done
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ USE NEW KEYS CHOOSE SERVER ~~~~~~~~~~~~~~~~~~~~
function USE_NEW_KEYS_CHOOSE_SERVER {
	echo
	$YELLOW 
	echo 'Choose Server to edit SSH Keys'
	$WHITE
		PS3='Please enter your choice: '
		options=("$SERVER_1" "$SERVER_2" "$SERVER_3" "$SERVER_4" "$SERVER_5" "$SERVER_6" "$SERVER_7" "Back" "Quit")
		select opt in "${options[@]}"
		do
		    case $opt in
		        "$SERVER_1")
				VIEW_ENTRY_1
				$WHITE
				echo 'edit entry? y/n'
			function edittt {
				read -r -p "Edity Entry??? [Y/n] " input
					case $input in
					    [yY][eE][sS]|[yY])
		                                echo
		                                echo -e "\e[1;31;4;46mEditing configuration for Server 1: '$SERVER_1'\e[0m"
		                                _ADD_KEY_CHOOSE_USER
		                                $RED
		                                echo "keys have been edited!!!!"
		                                ./server.sh
		                                break
					 ;;
					    [nN][oO]|[nN])
						USE_NEW_KEYS_CHOOSE_SERVER
;;
					    *)
					 echo "Invalid input..."
					 exit 1
					 ;;
					esac
				}
				edittt
			    ;;
		        "$SERVER_2")
		       		echo "you chose choice 2"
				_SERVER_2_CURRENT_CONFIG
				$WHITE
				echo
				_ADD_KEY_CHOOSE_USER
				$RED
				echo 'keys have been edited!!!!'
				./server.sh
 		            ;;
		        "$SERVER_3")
		            	echo "you chose choice $REPLY which is $opt"
		            ;;
			"$SERVER_4")
			    ;;
			"$SERVER_5")
			    ;;
			"$SERVER_6")
			    ;;
			"$SERVER_7")
			    ;;
			"Back")
			    ;;
		        "Quit")
		            break
		            ;;
		        *) echo "invalid option $REPLY";;
		    esac
		done
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function EDIT_SERVER_1_NAME {
	echo
#	echo -e "\e[1;31;4;46mEditing configuration for Server 1: '$SERVER_1'\e[0m"
	$YELLOW
	echo -n "Enter new server name: "
	$WHITE
	read -r S_1_EDITED_NAME
	sed "32s/.*/SERVER_1='$S_1_EDITED_NAME'/g" server.sh > server.tmphostname
	mv server.sh server.sh-backup
	mv server.tmphostname server.sh && chmod +x server.sh
	$GREEN
	echo "Server 1 has been updated to '$S_1_EDITED_NAME'"
	$WHITE
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function EDIT_SERVER_1_USERNAME {
	echo
	$YELLOW
	echo -n "Enter new username for $S_1_EDITED_NAME: "
	$WHITE
	read -r S_1_EDITED_USERNAME
	sed "33s/.*/SERVER_1_USERNAME='$S_1_EDITED_USERNAME'/g" server.sh > server.tmpusername
	mv server.tmpusername server.sh && chmod +x server.sh
	$GREEN
	echo "Username for $S_1_EDITED_NAME has been updated to $S_1_EDITED_USERNAME"
	$WHITE
}

#~~~~EDIT CONFIG MAIN MENU~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function EDIT_SERVER_1_USER_KEYS {
	echo
	$YELLOW
	echo -n "Enter SSH keyfile name for $S_1_EDITED_NAME: "
	$WHITE
	read -r S_1_EDITED_USER_KEYS
	sed "33s!.*!SERVER_1_USER_KEYS='$KEY_ADDRESS/$S_1_EDITED_USER_KEYS'!g" server.sh > server.tmpuserkeys
	sed "33s!//!/!g" server.tmpuserkeys > server.tmpuserkeysfinal
	rm server.tmpuserkeys
	mv server.tmpuserkeysfinal server.sh && chmod +x server.sh
	$GREEN
	echo "User keys for '$S_1_EDITED_NAME' has been updated to '$S_1_EDITED_USER_KEYS'"
	$WHITE
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function EDIT_SERVER_1_ROOT_KEYS {
	echo
	$YELLOW
	echo -n "Enter SSH keyfile name for $S_1_EDITED_NAME: "
	$WHITE
	read -r S_1_EDITED_ROOT_KEYS
	sed "34s!.*!SERVER_1_ROOT_KEYS='$KEY_ADDRESS/$S_1_EDITED_ROOT_KEYS'!g" server.sh > server.tmprootkeys
	sed "34s!//!/!g" server.tmprootkeys > server.tmprootkeysfinal
	mv server.tmprootkeysfinal server.sh && chmod +x server.sh
	$GREEN
	echo "Root user keys for '$S_1_EDITED_NAME' has been updated to '$S_1_EDITED_ROOT_KEYS'"
	$WHITE
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function EDIT_SERVER_1_KEYS {
	echo
	$YELLOW
	echo "Edit Keys for '$CHOSEN_SERVER' '$S_1_EDITED_NAME': "
	echo "i am labeled as broken... but i am not.. im just not finished"
	##!!## ADD Y/n PROMPT HERE ##!!##
	$WHITE
		PS3='Please enter choice: '
		options=("Edit User Key" "Edit Root Key" "Create Keys" "Main Menu" "Quit")
		select opt in "${options[@]}"
		do
		    case $opt in
		        "Edit User Key")
		            echo "you chose to edit keys for the server $S_1_EDITED_NAME and user $S_1_EDITED_USERNAME"

		#EDIT_SERVER_1_ROOT_KEYS
		#	    CREATE_KEY
		#EDIT_SERVER_1_USER_KEYS
		#           CREATE_KEY
		#EDIT_SERVER_1_KEYS
		        break
		            ;;
		        "Edit Root Key")
		            echo "you chose to edit the root user keys for $S_1_EDITED_NAME"
		EDIT_SERVER_1_KEYS
		            break
			    ;;
			"Create Keys")
			CREATE_KEY
		#ADD TO CONFIG HERE SOMEHOW... IF THEN STATEMENT possibly
			echo hi
			break
			    ;;
		        "Main Menu")
		            MAIN
		            ;;
		        "Quit")
		            break
			    exit
		            ;;
		        *) echo "invalid option $REPLY";;
		    esac
		done
###}
	EDIT_SERVER_1_NAME
	EDIT_SERVER_1_USERNAME
	EDIT_SERVER_1_KEYS
	EDIT_SERVER_1_SSH_DIR
	EDIT_SERVER_1_USER_KEYS
	EDIT_SERVER_1_ROOT_KEYS
}
# ~~~~~~~~~~~~~~~~~~~~~~~~ Transfer key to server ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function TRANSFER_SSH_KEY {
	echo
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~BEGIN PING_SERVERS FUNCTION~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVERS_ALL {
        $YELLOW
        echo ''
        echo 'Checking the following servers for connectivity:'
        $WHITE
        echo "$SERVER_1, $SERVER_2, $SERVER_3, $SERVER_4, $SERVER_5, $SERVER_6, $SERVER_7, $SERVER_8, $SERVER_9, $SERVER_10, $SERVER_11, $SERVER_12, $SERVER_13, $SERVER_14, $SERVER_15, $SERVER_16, $SERVER_17, $SERVER_18, $SERVER_19, $SERVER_20"
        sleep 1
        echo ''
	_PING_SERVER_1
	_PING_SERVER_2
	_PING_SERVER_3
	_PING_SERVER_4
	_PING_SERVER_5
	_PING_SERVER_6
	_PING_SERVER_7
	_PING_SERVER_8
	_PING_SERVER_9
	_PING_SERVER_10
	_PING_SERVER_11
	_PING_SERVER_12
	_PING_SERVER_13
	_PING_SERVER_14
	_PING_SERVER_15
	_PING_SERVER_16
	_PING_SERVER_17
	_PING_SERVER_18
	_PING_SERVER_19
	_PING_SERVER_20
        $WHITE
        echo '###########RESULTS############'
        $SERVER_1_RESULTS_COLOR
        echo "$SERVER_1_RESULTS"
        $SERVER_2_RESULTS_COLOR
        echo "$SERVER_2_RESULTS"
        $SERVER_3_RESULTS_COLOR
        echo "$SERVER_3_RESULTS"
        $SERVER_4_RESULTS_COLOR
        echo "$SERVER_4_RESULTS"
        $SERVER_5_RESULTS_COLOR
        echo "$SERVER_5_RESULTS"
        $SERVER_6_RESULTS_COLOR
        echo "$SERVER_6_RESULTS"
        $SERVER_7_RESULTS_COLOR
        echo "$SERVER_7_RESULTS"
        $SERVER_8_RESULTS_COLOR
        echo "$SERVER_8_RESULTS"
        $SERVER_9_RESULTS_COLOR
        echo "$SERVER_9_RESULTS"
        $SERVER_10_RESULTS_COLOR
        echo "$SERVER_10_RESULTS"
        $SERVER_11_RESULTS_COLOR
        echo "$SERVER_11_RESULTS"
        $SERVER_12_RESULTS_COLOR
        echo "$SERVER_12_RESULTS"
        $SERVER_13_RESULTS_COLOR
        echo "$SERVER_13_RESULTS"
        $SERVER_14_RESULTS_COLOR
        echo "$SERVER_14_RESULTS"
        $SERVER_15_RESULTS_COLOR
        echo "$SERVER_15_RESULTS"
        $SERVER_16_RESULTS_COLOR
        echo "$SERVER_16_RESULTS"
        $SERVER_17_RESULTS_COLOR
        echo "$SERVER_17_RESULTS"
        $SERVER_18_RESULTS_COLOR
        echo "$SERVER_18_RESULTS"
        $SERVER_19_RESULTS_COLOR
        echo "$SERVER_19_RESULTS"
        $SERVER_20_RESULTS_COLOR
        echo "$SERVER_20_RESULTS"
        $WHITE
        echo '#############################'

}

function _PING_SERVER_1 {
	$YELLOW
	echo "Testing connectivity for $SERVER_1"
	echo
	$BLUE
	if ping -c1 $SERVER_1"$i" ; then
		$GREEN
		echo "
        $SERVER_1 is 'UP'
		"
		SERVER_1_RESULTS_COLOR="$GREEN"
		SERVER_1_RESULTS="$SERVER_1 is 'UP'"
	else
		SERVER_1_RESULTS_COLOR="$RED"
		SERVER_1_RESULTS="$SERVER_1 is 'DOWN'"
		$RED
	        echo "
        $SERVER_1 is 'DOWN'
		"
	fi
}
function _PING_SERVER_2 {
        $YELLOW
        echo "Testing connectivity for $SERVER_2"
        echo
        $BLUE
        if ping -c1 $SERVER_2"$i" ; then
                $GREEN
                echo "
        $SERVER_2 is 'UP'
                "
                SERVER_2_RESULTS_COLOR="$GREEN"
                SERVER_2_RESULTS="$SERVER_2 is 'UP'"
        else
                SERVER_2_RESULTS_COLOR="$RED"
                SERVER_2_RESULTS="$SERVER_2 is 'DOWN'"
                $RED
                echo "
        $SERVER_2 is 'DOWN'
                "
        fi
}
function _PING_SERVER_3 {
        $YELLOW
        echo "Testing connectivity for $SERVER_3"
        echo
        $BLUE
        if ping -c1 $SERVER_3"$i" ; then
                $GREEN
                echo "
        $SERVER_3 is 'UP'
                "
                SERVER_3_RESULTS_COLOR="$GREEN"
                SERVER_3_RESULTS="$SERVER_3 is 'UP'"
        else
                SERVER_3_RESULTS_COLOR="$RED"
                SERVER_3_RESULTS="$SERVER_3 is 'DOWN'"
                $RED
                echo "
        $SERVER_3 is 'DOWN'
                "
        fi
}
function _PING_SERVER_4 {
        $YELLOW
        echo "Testing connectivity for $SERVER_4"
        echo
        $BLUE
        if ping -c1 $SERVER_4"$i" ; then
                $GREEN
                echo "
        $SERVER_4 is 'UP'
                "
                SERVER_4_RESULTS_COLOR="$GREEN"
                SERVER_4_RESULTS="$SERVER_4 is 'UP'"
        else
                SERVER_4_RESULTS_COLOR="$RED"
                SERVER_4_RESULTS="$SERVER_4 is 'DOWN'"
                $RED
                echo "
        $SERVER_4 is 'DOWN'
                "
        fi
}
function _PING_SERVER_5 {
        $YELLOW
        echo "Testing connectivity for $SERVER_5"
        echo
        $BLUE
        if ping -c1 $SERVER_5"$i" ; then
                $GREEN
                echo "
        $SERVER_5 is 'UP'
                "
                SERVER_5_RESULTS_COLOR="$GREEN"
                SERVER_5_RESULTS="$SERVER_5 is 'UP'"
        else
                SERVER_5_RESULTS_COLOR="$RED"
                SERVER_5_RESULTS="$SERVER_5 is 'DOWN'"
                $RED
                echo "
        $SERVER_5 is 'DOWN'
                "
        fi
}
function _PING_SERVER_6 {
        $YELLOW
        echo "Testing connectivity for $SERVER_6"
        echo
        $BLUE
        if ping -c1 $SERVER_6"$i" ; then
                $GREEN
                echo "
        $SERVER_6 is 'UP'
                "
                SERVER_6_RESULTS_COLOR="$GREEN"
                SERVER_6_RESULTS="$SERVER_6 is 'UP'"
        else
                SERVER_6_RESULTS_COLOR="$RED"
                SERVER_6_RESULTS="$SERVER_6 is 'DOWN'"
                $RED
                echo "
        $SERVER_6 is 'DOWN'
                "
        fi
}
function _PING_SERVER_7 {
        $YELLOW
        echo "Testing connectivity for $SERVER_7"
        echo
        $BLUE
        if ping -c1 $SERVER_7"$i" ; then
                $GREEN
                echo "
        $SERVER_7 is 'UP'
                "
                SERVER_7_RESULTS_COLOR="$GREEN"
                SERVER_7_RESULTS="$SERVER_7 is 'UP'"
        else
                SERVER_7_RESULTS_COLOR="$RED"
                SERVER_7_RESULTS="$SERVER_7 is 'DOWN'"
                $RED
                echo "
        $SERVER_7 is 'DOWN'
                "
        fi
}
function _PING_SERVER_8 {
        $YELLOW
        echo "Testing connectivity for $SERVER_8"
        echo
        $BLUE
        if ping -c1 $SERVER_8"$i" ; then
                $GREEN
                echo "
        $SERVER_8 is 'UP'
                "
                SERVER_8_RESULTS_COLOR="$GREEN"
                SERVER_8_RESULTS="$SERVER_8 is 'UP'"
        else
                SERVER_8_RESULTS_COLOR="$RED"
                SERVER_8_RESULTS="$SERVER_8 is 'DOWN'"
                $RED
                echo "
        $SERVER_8 is 'DOWN'
                "
        fi
}
function _PING_SERVER_9 {
        $YELLOW
        echo "Testing connectivity for $SERVER_9"
        echo
        $BLUE
        if ping -c1 $SERVER_9"$i" ; then
                $GREEN
                echo "
        $SERVER_9 is 'UP'
                "
                SERVER_9_RESULTS_COLOR="$GREEN"
                SERVER_9_RESULTS="$SERVER_9 is 'UP'"
        else
                SERVER_9_RESULTS_COLOR="$RED"
                SERVER_9_RESULTS="$SERVER_9 is 'DOWN'"
                $RED
                echo "
        $SERVER_9 is 'DOWN'
                "
        fi
}
function _PING_SERVER_10 {
        $YELLOW
        echo "Testing connectivity for $SERVER_10"
        echo
        $BLUE
        if ping -c1 $SERVER_10"$i" ; then
                $GREEN
                echo "
        $SERVER_10 is 'UP'
                "
                SERVER_10_RESULTS_COLOR="$GREEN"
                SERVER_10_RESULTS="$SERVER_10 is 'UP'"
        else
                SERVER_10_RESULTS_COLOR="$RED"
                SERVER_10_RESULTS="$SERVER_10 is 'DOWN'"
                $RED
                echo "
        $SERVER_10 is 'DOWN'
                "
        fi
}
function _PING_SERVER_11 {
        $YELLOW
        echo "Testing connectivity for $SERVER_11"
        echo
        $BLUE
        if ping -c1 $SERVER_11"$i" ; then
                $GREEN
                echo "
        $SERVER_11 is 'UP'
                "
                SERVER_11_RESULTS_COLOR="$GREEN"
                SERVER_11_RESULTS="$SERVER_11 is 'UP'"
        else
                SERVER_11_RESULTS_COLOR="$RED"
                SERVER_11_RESULTS="$SERVER_11 is 'DOWN'"
                $RED
                echo "
        $SERVER_11 is 'DOWN'
                "
        fi
}
function _PING_SERVER_12 {
        $YELLOW
        echo "Testing connectivity for $SERVER_12"
        echo
        $BLUE
        if ping -c1 $SERVER_12"$i" ; then
                $GREEN
                echo "
        $SERVER_12 is 'UP'
                "
                SERVER_12_RESULTS_COLOR="$GREEN"
                SERVER_12_RESULTS="$SERVER_12 is 'UP'"
        else
                SERVER_12_RESULTS_COLOR="$RED"
                SERVER_12_RESULTS="$SERVER_12 is 'DOWN'"
                $RED
                echo "
        $SERVER_12 is 'DOWN'
                "
        fi
}
function _PING_SERVER_13 {
        $YELLOW
        echo "Testing connectivity for $SERVER_13"
        echo
        $BLUE
        if ping -c1 $SERVER_13"$i" ; then
                $GREEN
                echo "
        $SERVER_13 is 'UP'
                "
                SERVER_13_RESULTS_COLOR="$GREEN"
                SERVER_13_RESULTS="$SERVER_13 is 'UP'"
        else
                SERVER_13_RESULTS_COLOR="$RED"
                SERVER_13_RESULTS="$SERVER_13 is 'DOWN'"
                $RED
                echo "
        $SERVER_13 is 'DOWN'
                "
        fi
}
function _PING_SERVER_14 {
        $YELLOW
        echo "Testing connectivity for $SERVER_14"
        echo
        $BLUE
        if ping -c1 $SERVER_14"$i" ; then
                $GREEN
                echo "
        $SERVER_14 is 'UP'
                "
                SERVER_14_RESULTS_COLOR="$GREEN"
                SERVER_14_RESULTS="$SERVER_14 is 'UP'"
        else
                SERVER_14_RESULTS_COLOR="$RED"
                SERVER_14_RESULTS="$SERVER_14 is 'DOWN'"
                $RED
                echo "
        $SERVER_14 is 'DOWN'
                "
        fi
}
function _PING_SERVER_15 {
        $YELLOW
        echo "Testing connectivity for $SERVER_15"
        echo
        $BLUE
        if ping -c1 $SERVER_15"$i" ; then
                $GREEN
                echo "
        $SERVER_15 is 'UP'
                "
                SERVER_15_RESULTS_COLOR="$GREEN"
                SERVER_15_RESULTS="$SERVER_15 is 'UP'"
        else
                SERVER_15_RESULTS_COLOR="$RED"
                SERVER_15_RESULTS="$SERVER_15 is 'DOWN'"
                $RED
                echo "
        $SERVER_15 is 'DOWN'
                "
        fi
}
function _PING_SERVER_16 {
        $YELLOW
        echo "Testing connectivity for $SERVER_16"
        echo
        $BLUE
        if ping -c1 $SERVER_16"$i" ; then
                $GREEN
                echo "
        $SERVER_16 is 'UP'
                "
                SERVER_16_RESULTS_COLOR="$GREEN"
                SERVER_16_RESULTS="$SERVER_16 is 'UP'"
        else
                SERVER_16_RESULTS_COLOR="$RED"
                SERVER_16_RESULTS="$SERVER_16 is 'DOWN'"
                $RED
                echo "
        $SERVER_16 is 'DOWN'
                "
        fi
}
function _PING_SERVER_17 {
        $YELLOW
        echo "Testing connectivity for $SERVER_17"
        echo
        $BLUE
        if ping -c1 $SERVER_17"$i" ; then
                $GREEN
                echo "
        $SERVER_17 is 'UP'
                "
                SERVER_17_RESULTS_COLOR="$GREEN"
                SERVER_17_RESULTS="$SERVER_17 is 'UP'"
        else
                SERVER_17_RESULTS_COLOR="$RED"
                SERVER_17_RESULTS="$SERVER_17 is 'DOWN'"
                $RED
                echo "
        $SERVER_17 is 'DOWN'
                "
        fi
}
function _PING_SERVER_18 {
        $YELLOW
        echo "Testing connectivity for $SERVER_18"
        echo
        $BLUE
        if ping -c1 $SERVER_18"$i" ; then
                $GREEN
                echo "
        $SERVER_18 is 'UP'
                "
                SERVER_18_RESULTS_COLOR="$GREEN"
                SERVER_18_RESULTS="$SERVER_18 is 'UP'"
        else
                SERVER_18_RESULTS_COLOR="$RED"
                SERVER_18_RESULTS="$SERVER_18 is 'DOWN'"
                $RED
                echo "
        $SERVER_18 is 'DOWN'
                "
        fi
}
function _PING_SERVER_19 {
        $YELLOW
        echo "Testing connectivity for $SERVER_19"
        echo
        $BLUE
        if ping -c1 $SERVER_19"$i" ; then
                $GREEN
                echo "
        $SERVER_19 is 'UP'
                "
                SERVER_19_RESULTS_COLOR="$GREEN"
                SERVER_19_RESULTS="$SERVER_19 is 'UP'"
        else
                SERVER_19_RESULTS_COLOR="$RED"
                SERVER_19_RESULTS="$SERVER_19 is 'DOWN'"
                $RED
                echo "
        $SERVER_19 is 'DOWN'
                "
        fi
}
function _PING_SERVER_20 {
        $YELLOW
        echo "Testing connectivity for $SERVER_20"
        echo
        $BLUE
        if ping -c1 $SERVER_20"$i" ; then
                $GREEN
                echo "
        $SERVER_20 is 'UP'
                "
                SERVER_20_RESULTS_COLOR="$GREEN"
                SERVER_20_RESULTS="$SERVER_20 is 'UP'"
        else
                SERVER_20_RESULTS_COLOR="$RED"
                SERVER_20_RESULTS="$SERVER_20 is 'DOWN'"
                $RED
                echo "
        $SERVER_20 is 'DOWN'
                "
        fi
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~END PING SERVERS FUNCTION~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#TO DO: change function name to _PING_SERVER_1_QUIET

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SERVER STATUS QUIET PING ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~Ping All Servers Quietly~~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVERS_QUIET_ALL {
	_PING_SERVER_1_QUIET
	_PING_SERVER_2_QUIET
	_PING_SERVER_3_QUIET
	_PING_SERVER_4_QUIET
	_PING_SERVER_5_QUIET
	_PING_SERVER_6_QUIET
	_PING_SERVER_7_QUIET
	_PING_SERVER_8_QUIET
	_PING_SERVER_9_QUIET
	_PING_SERVER_10_QUIET
	_PING_SERVER_11_QUIET
	_PING_SERVER_12_QUIET
	_PING_SERVER_13_QUIET
	_PING_SERVER_14_QUIET
	_PING_SERVER_15_QUIET
	_PING_SERVER_16_QUIET
	_PING_SERVER_17_QUIET
	_PING_SERVER_18_QUIET
	_PING_SERVER_19_QUIET
	_PING_SERVER_20_QUIET
        echo '###########RESULTS############'
        $SERVER_1_RESULTS_COLOR
        echo "$SERVER_1_RESULTS"
        $SERVER_2_RESULTS_COLOR
        echo "$SERVER_2_RESULTS"
        $SERVER_3_RESULTS_COLOR
        echo "$SERVER_3_RESULTS"
        $SERVER_4_RESULTS_COLOR
        echo "$SERVER_4_RESULTS"
        $SERVER_5_RESULTS_COLOR
        echo "$SERVER_5_RESULTS"
        $SERVER_6_RESULTS_COLOR
        echo "$SERVER_6_RESULTS"
        $SERVER_7_RESULTS_COLOR
        echo "$SERVER_7_RESULTS"
        $SERVER_8_RESULTS_COLOR
        echo "$SERVER_8_RESULTS"
        $SERVER_9_RESULTS_COLOR
        echo "$SERVER_9_RESULTS"
        $SERVER_10_RESULTS_COLOR
        echo "$SERVER_10_RESULTS"
        $SERVER_11_RESULTS_COLOR
        echo "$SERVER_11_RESULTS"
        $SERVER_12_RESULTS_COLOR
        echo "$SERVER_12_RESULTS"
        $SERVER_13_RESULTS_COLOR
        echo "$SERVER_13_RESULTS"
        $SERVER_14_RESULTS_COLOR
        echo "$SERVER_14_RESULTS"
        $SERVER_15_RESULTS_COLOR
        echo "$SERVER_15_RESULTS"
        $SERVER_16_RESULTS_COLOR
        echo "$SERVER_16_RESULTS"
        $SERVER_17_RESULTS_COLOR
        echo "$SERVER_17_RESULTS"
        $SERVER_18_RESULTS_COLOR
        echo "$SERVER_18_RESULTS"
        $SERVER_19_RESULTS_COLOR
        echo "$SERVER_19_RESULTS"
        $SERVER_20_RESULTS_COLOR
        echo "$SERVER_20_RESULTS"
        $WHITE
        echo '#############################'
}
#~~~~~~~~~~~~~~~~~~SERVER 1 ~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_1_QUIET {
	if ping -c1 > /dev/null 2>&1 $SERVER_1"$i" ; then
		SERVER_1_RESULTS_COLOR="$GREEN"
		SERVER_1_RESULTS="$SERVER_1 is 'UP'"
		$WHITE
	else
		SERVER_1_RESULTS_COLOR="$RED"
		SERVER_1_RESULTS="$SERVER_1 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~ SERVER 2 ~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_2_QUIET {
	if ping -c1 > /dev/null 2>&1 $SERVER_2"$i" ; then
		SERVER_2_RESULTS_COLOR="$GREEN"
		SERVER_2_RESULTS="$SERVER_2 is 'UP'"
		$WHITE
	else
		SERVER_2_RESULTS_COLOR="$RED"
		SERVER_2_RESULTS="$SERVER_2 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~ SERVER 3 ~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_3_QUIET {
	if ping -c1 > /dev/null 2>&1 $SERVER_3"$i" ; then
		SERVER_3_RESULTS_COLOR="$GREEN"
		SERVER_3_RESULTS="$SERVER_3 is 'UP'"
		$WHITE
	else
		SERVER_3_RESULTS_COLOR="$RED"
		SERVER_3_RESULTS="$SERVER_3 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~ SERVER 4 ~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_4_QUIET {
	if ping -c1 > /dev/null 2>&1 $SERVER_4"$i" ; then
		SERVER_4_RESULTS_COLOR="$GREEN"
		SERVER_4_RESULTS="$SERVER_4 is 'UP'"
		$WHITE
	else
		SERVER_4_RESULTS_COLOR="$RED"
		SERVER_4_RESULTS="$SERVER_4 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~ SERVER 5 ~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_5_QUIET {
	if ping -c1 > /dev/null 2>&1 $SERVER_5"$i" ; then
		SERVER_5_RESULTS_COLOR="$GREEN"
		SERVER_5_RESULTS="$SERVER_5 is 'UP'"
		$WHITE
	else
		SERVER_5_RESULTS_COLOR="$RED"
		SERVER_5_RESULTS="$SERVER_5 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~ SERVER 6 ~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_6_QUIET {
	if ping -c1 > /dev/null 2>&1 $SERVER_6"$i" ; then
		SERVER_6_RESULTS_COLOR="$GREEN"
		SERVER_6_RESULTS="$SERVER_6 is 'UP'"
		$WHITE
	else
		SERVER_6_RESULTS_COLOR="$RED"
		SERVER_6_RESULTS="$SERVER_6 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~ SERVER 7 ~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_7_QUIET {
	if ping -c1 > /dev/null 2>&1 $SERVER_7"$i" ; then
		SERVER_7_RESULTS_COLOR="$GREEN"
		SERVER_7_RESULTS="$SERVER_7 is 'UP'"
		$WHITE
	else
		SERVER_7_RESULTS_COLOR="$RED"
		SERVER_7_RESULTS="$SERVER_7 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~ SERVER 8 ~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_8_QUIET {
	if ping -c1 > /dev/null 2>&1 $SERVER_8"$i" ; then
		SERVER_8_RESULTS_COLOR="$GREEN"
		SERVER_8_RESULTS="$SERVER_8 is 'UP'"
		$WHITE
	else
		SERVER_8_RESULTS_COLOR="$RED"
		SERVER_8_RESULTS="$SERVER_8 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~ SERVER 9 ~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_9_QUIET {
	if ping -c1 > /dev/null 2>&1 $SERVER_9"$i" ; then
		SERVER_9_RESULTS_COLOR="$GREEN"
		SERVER_9_RESULTS="$SERVER_9 is 'UP'"
		$WHITE
	else
		SERVER_9_RESULTS_COLOR="$RED"
		SERVER_9_RESULTS="$SERVER_9 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~ SERVER 10 ~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_10_QUIET {
	if ping -c1 > /dev/null 2>&1 $SERVER_10"$i" ; then
		SERVER_10_RESULTS_COLOR="$GREEN"
		SERVER_10_RESULTS="$SERVER_10 is 'UP'"
		$WHITE
	else
		SERVER_10_RESULTS_COLOR="$RED"
		SERVER_10_RESULTS="$SERVER_10 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~ SERVER 11 ~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_11_QUIET {
	if ping -c1 > /dev/null 2>&1 $SERVER_11"$i" ; then
		SERVER_11_RESULTS_COLOR="$GREEN"
		SERVER_11_RESULTS="$SERVER_11 is 'UP'"
		$WHITE
	else
		SERVER_11_RESULTS_COLOR="$RED"
		SERVER_11_RESULTS="$SERVER_11 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~ SERVER 12 ~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_12_QUIET {
	if ping -c1 > /dev/null 2>&1 $SERVER_12"$i" ; then
		SERVER_12_RESULTS_COLOR="$GREEN"
		SERVER_12_RESULTS="$SERVER_12 is 'UP'"
		$WHITE
	else
		SERVER_12_RESULTS_COLOR="$RED"
		SERVER_12_RESULTS="$SERVER_12 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~ SERVER 13 ~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_13_QUIET {
	if ping -c1 > /dev/null 2>&1 $SERVER_13"$i" ; then
		SERVER_13_RESULTS_COLOR="$GREEN"
		SERVER_13_RESULTS="$SERVER_13 is 'UP'"
		$WHITE
	else
		SERVER_13_RESULTS_COLOR="$RED"
		SERVER_13_RESULTS="$SERVER_13 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~ SERVER 14 ~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_14_QUIET {
	if ping -c1 > /dev/null 2>&1 $SERVER_14"$i" ; then
		SERVER_14_RESULTS_COLOR="$GREEN"
		SERVER_14_RESULTS="$SERVER_14 is 'UP'"
		$WHITE
	else
		SERVER_14_RESULTS_COLOR="$RED"
		SERVER_14_RESULTS="$SERVER_14 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~ SERVER 15 ~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_15_QUIET {
	if ping -c1 > /dev/null 2>&1 $SERVER_15"$i" ; then
		SERVER_15_RESULTS_COLOR="$GREEN"
		SERVER_15_RESULTS="$SERVER_15 is 'UP'"
		$WHITE
	else
		SERVER_15_RESULTS_COLOR="$RED"
		SERVER_15_RESULTS="$SERVER_15 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~ SERVER 16 ~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_16_QUIET {
	if ping -c1 > /dev/null 2>&1 $SERVER_16"$i" ; then
		SERVER_16_RESULTS_COLOR="$GREEN"
		SERVER_16_RESULTS="$SERVER_16 is 'UP'"
		$WHITE
	else
		SERVER_16_RESULTS_COLOR="$RED"
		SERVER_16_RESULTS="$SERVER_16 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~ SERVER 17 ~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_17_QUIET {
	if ping -c1 > /dev/null 2>&1 $SERVER_17"$i" ; then
		SERVER_17_RESULTS_COLOR="$GREEN"
		SERVER_17_RESULTS="$SERVER_17 is 'UP'"
		$WHITE
	else
		SERVER_17_RESULTS_COLOR="$RED"
		SERVER_17_RESULTS="$SERVER_17 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~ SERVER 18 ~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_18_QUIET {
	if ping -c1 > /dev/null 2>&1 $SERVER_18"$i" ; then
		SERVER_18_RESULTS_COLOR="$GREEN"
		SERVER_18_RESULTS="$SERVER_18 is 'UP'"
		$WHITE
	else
		SERVER_18_RESULTS_COLOR="$RED"
		SERVER_18_RESULTS="$SERVER_18 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~ SERVER 19 ~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_19_QUIET {
	if ping -c1 > /dev/null 2>&1 $SERVER_19"$i" ; then
		SERVER_19_RESULTS_COLOR="$GREEN"
		SERVER_19_RESULTS="$SERVER_19 is 'UP'"
		$WHITE
	else
		SERVER_19_RESULTS_COLOR="$RED"
		SERVER_19_RESULTS="$SERVER_19 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~ SERVER 20 ~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_20_QUIET {
	if ping -c1 > /dev/null 2>&1 $SERVER_20"$i" ; then
		SERVER_20_RESULTS_COLOR="$GREEN"
		SERVER_20_RESULTS="$SERVER_20 is 'UP'"
		$WHITE
	else
		SERVER_20_RESULTS_COLOR="$RED"
		SERVER_20_RESULTS="$SERVER_20 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

############################################################
########### Begin View Entries Functions ###################
############################################################

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~ View Entries No Ping No Read~~~~~~~~~~~~~~~~~~~~
function VIEW_ENTREIS_QUICK {
	VIEW_ENTRY_1
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	VIEW_ENTRY_2
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	VIEW_ENTRY_3
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	VIEW_ENTRY_4
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	VIEW_ENTRY_5
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	VIEW_ENTRY_6
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	VIEW_ENTRY_7
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	VIEW_ENTRY_8
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	VIEW_ENTRY_9
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	VIEW_ENTRY_10
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	VIEW_ENTRY_11
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	VIEW_ENTRY_12
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	VIEW_ENTRY_13
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	VIEW_ENTRY_14
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	VIEW_ENTRY_15
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	VIEW_ENTRY_16
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	VIEW_ENTRY_17
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	VIEW_ENTRY_18
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	VIEW_ENTRY_19
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	VIEW_ENTRY_20
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~ View Entries No Ping ~~~~~~~~~~~~~~~~~~~~~~~~
function VIEW_ENTRIES_NO_PING {
	VIEW_ENTRY_1
	echo 'press enter to view the next entry'
	read
	VIEW_ENTRY_2
	echo 'press enter to view the next entry'
	read
	VIEW_ENTRY_3
	echo 'press enter to view the next entry'
	read
	VIEW_ENTRY_4
	echo 'press enter to view the next entry'
	read
	VIEW_ENTRY_5
	echo 'press enter to view the next entry'
	read
	VIEW_ENTRY_6
	echo 'press enter to view the next entry'
	read
	VIEW_ENTRY_7
	echo 'press enter to view the next entry'
	read
	VIEW_ENTRY_8
	echo 'press enter to view the next entry'
	read
	VIEW_ENTRY_9
	echo 'press enter to view the next entry'
	read
	VIEW_ENTRY_10
	echo 'press enter to view the next entry'
	read
	VIEW_ENTRY_11
	echo 'press enter to view the next entry'
	read
	VIEW_ENTRY_12
	echo 'press enter to view the next entry'
	read
	VIEW_ENTRY_13
	echo 'press enter to view the next entry'
	read
	VIEW_ENTRY_14
	echo 'press enter to view the next entry'
	read
	VIEW_ENTRY_15
	echo 'press enter to view the next entry'
	read
	VIEW_ENTRY_16
	echo 'press enter to view the next entry'
	read
	VIEW_ENTRY_17
	echo 'press enter to view the next entry'
	read
	VIEW_ENTRY_18
	echo 'press enter to view the next entry'
	read
	VIEW_ENTRY_19
	echo 'press enter to view the next entry'
	read
	VIEW_ENTRY_20
	echo 'press enter to go to the Main Menu'
	read
	MAIN	
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~ View Entries ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function VIEW_ENTRIES {
        VIEW_ENTRY_1
	echo
	echo "Testing network connectivity for $SERVER_1"
	_PING_SERVER_1_QUIET
	$SERVER_1_RESULTS_COLOR
	echo "$SERVER_1_RESULTS"
	$YELLOW
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$WHITE
        echo 'press enter to view the next entry'
	read -r
	VIEW_ENTRY_2
        echo
        echo "Testing network connectivity for $SERVER_2"
	_PING_SERVER_2_QUIET
	$SERVER_2_RESULTS_COLOR
	echo "$SERVER_2_RESULTS"
	$YELLOW
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$WHITE
        echo 'press enter to view the next entry'
        read -r
        VIEW_ENTRY_3
        echo
        echo "Testing network connectivity for $SERVER_3"
	_PING_SERVER_3_QUIET
	$SERVER_3_RESULTS_COLOR
	echo "$SERVER_3_RESULTS"
	$YELLOW
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$WHITE
        echo 'press enter to view the next entry'
        read -r
        VIEW_ENTRY_4
        echo
        echo "Testing network connectivity for $SERVER_4"
	_PING_SERVER_4_QUIET
	$SERVER_4_RESULTS_COLOR
	echo "$SERVER_4_RESULTS"
	$YELLOW
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$WHITE
        echo 'press enter to view the next entry'
        read -r
        VIEW_ENTRY_5
        echo
        echo "Testing network connectivity for $SERVER_5"
	_PING_SERVER_5_QUIET
	$SERVER_5_RESULTS_COLOR
	echo "$SERVER_5_RESULTS"
	$YELLOW
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$WHITE
        echo 'press enter to view the next entry'
        read -r
        VIEW_ENTRY_6
        echo
        echo "Testing network connectivity for $SERVER_6"
	_PING_SERVER_6_QUIET
	$SERVER_6_RESULTS_COLOR
	echo "$SERVER_6_RESULTS"
	$YELLOW
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$WHITE
        echo 'press enter to view the next entry'
        read -r
        VIEW_ENTRY_7
        echo
        echo "Testing network connectivity for $SERVER_7"
	_PING_SERVER_7_QUIET
	$SERVER_7_RESULTS_COLOR
	echo "$SERVER_7_RESULTS"
	$YELLOW
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$WHITE
        echo 'press enter to view the next entry'
        read -r
        VIEW_ENTRY_8
        echo
        echo "Testing network connectivity for $SERVER_8"
	_PING_SERVER_8_QUIET
	$SERVER_8_RESULTS_COLOR
	echo "$SERVER_8_RESULTS"
	$YELLOW
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$WHITE
        echo 'press enter to view the next entry'
        read -r
        VIEW_ENTRY_9
        echo
        echo "Testing network connectivity for $SERVER_9"
	_PING_SERVER_9_QUIET
	$SERVER_9_RESULTS_COLOR
	echo "$SERVER_9_RESULTS"
	$YELLOW
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$WHITE
        echo 'press enter to view the next entry'
        read -r
        VIEW_ENTRY_10
        echo
        echo "Testing network connectivity for $SERVER_10"
	_PING_SERVER_10_QUIET
	$SERVER_10_RESULTS_COLOR
	echo "$SERVER_10_RESULTS"
	$YELLOW
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$WHITE
        echo 'press enter to view the next entry'
        read -r
        VIEW_ENTRY_11
        echo
        echo "Testing network connectivity for $SERVER_11"
	_PING_SERVER_11_QUIET
	$SERVER_11_RESULTS_COLOR
	echo "$SERVER_11_RESULTS"
	$YELLOW
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$WHITE
        echo 'press enter to view the next entry'
        read -r
        VIEW_ENTRY_12
        echo
        echo "Testing network connectivity for $SERVER_12"
	_PING_SERVER_12_QUIET
	$SERVER_12_RESULTS_COLOR
	echo "$SERVER_12_RESULTS"
	$YELLOW
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$WHITE
        echo 'press enter to view the next entry'
        read -r
        VIEW_ENTRY_13
        echo
        echo "Testing network connectivity for $SERVER_13"
	_PING_SERVER_13_QUIET
	$SERVER_13_RESULTS_COLOR
	echo "$SERVER_13_RESULTS"
	$YELLOW
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$WHITE
        echo 'press enter to view the next entry'
        read -r
        VIEW_ENTRY_14
        echo
        echo "Testing network connectivity for $SERVER_14"
	_PING_SERVER_14_QUIET
	$SERVER_14_RESULTS_COLOR
	echo "$SERVER_14_RESULTS"
	$YELLOW
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$WHITE
        echo 'press enter to view the next entry'
        read -r
        VIEW_ENTRY_15
        echo
        echo "Testing network connectivity for $SERVER_15"
	_PING_SERVER_15_QUIET
	$SERVER_15_RESULTS_COLOR
	echo "$SERVER_15_RESULTS"
	$YELLOW
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$WHITE
        echo 'press enter to view the next entry'
        read -r
        VIEW_ENTRY_16
        echo
        echo "Testing network connectivity for $SERVER_16"
	_PING_SERVER_16_QUIET
	$SERVER_16_RESULTS_COLOR
	echo "$SERVER_16_RESULTS"
	$YELLOW
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$WHITE
        echo 'press enter to view the next entry'
        read -r
        VIEW_ENTRY_17
        echo
        echo "Testing network connectivity for $SERVER_17"
	_PING_SERVER_17_QUIET
	$SERVER_17_RESULTS_COLOR
	echo "$SERVER_17_RESULTS"
	$YELLOW
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$WHITE
        echo 'press enter to view the next entry'
        read -r
        VIEW_ENTRY_18
        echo
        echo "Testing network connectivity for $SERVER_18"
	_PING_SERVER_18_QUIET
	$SERVER_18_RESULTS_COLOR
	echo "$SERVER_18_RESULTS"
	$YELLOW
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$WHITE
        echo 'press enter to view the next entry'
        read -r
        VIEW_ENTRY_19
        echo
        echo "Testing network connectivity for $SERVER_19"
	_PING_SERVER_19_QUIET
	$SERVER_19_RESULTS_COLOR
	echo "$SERVER_19_RESULTS"
	$YELLOW
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$WHITE
        echo 'press enter to view the next entry'
        read -r
        VIEW_ENTRY_20
        echo
	echo "Testing network connectivity for $SERVER_20"
	_PING_SERVER_20_QUIET
	$SERVER_20_RESULTS_COLOR
	echo "$SERVER_20_RESULTS"
	$YELLOW
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$WHITE
	read
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 		Begin View Entries Functions
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function VIEW_ENTRY_1 {
	echo
	$CYAN
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	echo 'Server 1 Configuration:'
	echo
	$YELLOW
	echo "Hostname--------: $SERVER_1"
	echo "Username--------: $SERVER_1_USERNAME"
	echo "User SSH Keys---: $SERVER_1_USER_KEYS"
	echo "Root SSH Keys---: $SERVER_1_ROOT_KEYS"
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        $WHITE
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function VIEW_ENTRY_2 {
	echo
	$CYAN
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	echo 'Server 2 Configuration:'
	echo
	$YELLOW
	echo "Hostname--------: $SERVER_2"
	echo "Username--------: $SERVER_2_USERNAME"
	echo "User SSH Keys---: $SERVER_2_USER_KEYS"
	echo "Root SSH Keys---: $SERVER_2_ROOT_KEYS"
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$WHITE
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function VIEW_ENTRY_3 {
	echo
	$CYAN
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	echo 'Server 3 Configuration:'
	echo
	$YELLOW
	echo "Hostname--------: $SERVER_3"
	echo "Username--------: $SERVER_3_USERNAME"
	echo "User SSH Keys---: $SERVER_3_USER_KEYS"
	echo "Root SSH Keys---: $SERVER_3_ROOT_KEYS"
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$WHITE
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function VIEW_ENTRY_3 {
	echo
	$CYAN
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	echo 'Server 3 Configuration:'
	echo
	$YELLOW
	echo "Hostname--------: $SERVER_3"
	echo "Username--------: $SERVER_3_USERNAME"
	echo "User SSH Keys---: $SERVER_3_USER_KEYS"
	echo "Root SSH Keys---: $SERVER_3_ROOT_KEYS"
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$WHITE
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function VIEW_ENTRY_4 {
	echo
	$CYAN
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	echo 'Server 4 Configuration:'
	echo
	$YELLOW
	echo "Hostname--------: $SERVER_4"
	echo "Username--------: $SERVER_4_USERNAME"
	echo "User SSH Keys---: $SERVER_4_USER_KEYS"
	echo "Root SSH Keys---: $SERVER_4_ROOT_KEYS"
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$WHITE
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function VIEW_ENTRY_5 {
	echo
	$CYAN
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	echo 'Server 5 Configuration:'
	echo
	$YELLOW
	echo "Hostname--------: $SERVER_5"
	echo "Username--------: $SERVER_5_USERNAME"
	echo "User SSH Keys---: $SERVER_5_USER_KEYS"
	echo "Root SSH Keys---: $SERVER_5_ROOT_KEYS"
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$WHITE
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function VIEW_ENTRY_6 {
	echo
	$CYAN
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	echo 'Server 6 Configuration:'
	echo
	$YELLOW
	echo "Hostname--------: $SERVER_6"
	echo "Username--------: $SERVER_6_USERNAME"
	echo "User SSH Keys---: $SERVER_6_USER_KEYS"
	echo "Root SSH Keys---: $SERVER_6_ROOT_KEYS"
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        echo
	$WHITE
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function VIEW_ENTRY_7 {
	echo
	$CYAN
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	echo 'Server 7 Configuration:'
	echo
	$YELLOW
	echo "Hostname--------: $SERVER_7"
	echo "Username--------: $SERVER_7_USERNAME"
	echo "User SSH Keys---: $SERVER_7_USER_KEYS"
	echo "Root SSH Keys---: $SERVER_7_ROOT_KEYS"
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	$WHITE
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function VIEW_ENTRY_8 {
	echo
	$CYAN
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	echo 'Server 8 Configuration:'
	echo
	$YELLOW
	echo "Hostname--------: $SERVER_8"
	echo "Username--------: $SERVER_8_USERNAME"
	echo "User SSH Keys---: $SERVER_8_USER_KEYS"
	echo "Root SSH Keys---: $SERVER_8_ROOT_KEYS"
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        $WHITE
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function VIEW_ENTRY_9 {
	echo
	$CYAN
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	echo 'Server 9 Configuration:'
	echo
	$YELLOW
	echo "Hostname--------: $SERVER_9"
	echo "Username--------: $SERVER_9_USERNAME"
	echo "User SSH Keys---: $SERVER_9_USER_KEYS"
	echo "Root SSH Keys---: $SERVER_9_ROOT_KEYS"
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        $WHITE
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function VIEW_ENTRY_10 {
	echo
	$CYAN
	echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	echo 'Server 10 Configuration:'
	echo
	$YELLOW
	echo "Hostname--------: $SERVER_10"
	echo "Username--------: $SERVER_10_USERNAME"
	echo "User SSH Keys---: $SERVER_10_USER_KEYS"
	echo "Root SSH Keys---: $SERVER_10_ROOT_KEYS"
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        $WHITE
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function VIEW_ENTRY_11 {
        echo 
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        echo 'Server 11 Configuration:'
        echo 
        $YELLOW
        echo "Hostname--------: $SERVER_11"
        echo "Username--------: $SERVER_11_USERNAME"
        echo "User SSH Keys---: $SERVER_11_USER_KEYS"
        echo "Root SSH Keys---: $SERVER_11_ROOT_KEYS"
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        $WHITE
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function VIEW_ENTRY_12 {
        echo 
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        echo 'Server 12 Configuration:'
        echo 
        $YELLOW
        echo "Hostname--------: $SERVER_12"
        echo "Username--------: $SERVER_12_USERNAME"
        echo "User SSH Keys---: $SERVER_12_USER_KEYS"
        echo "Root SSH Keys---: $SERVER_12_ROOT_KEYS"
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        $WHITE
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function VIEW_ENTRY_13 {
        echo 
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        echo 'Server 13 Configuration:'
        echo 
        $YELLOW
        echo "Hostname--------: $SERVER_13"
        echo "Username--------: $SERVER_13_USERNAME"
        echo "User SSH Keys---: $SERVER_13_USER_KEYS"
        echo "Root SSH Keys---: $SERVER_13_ROOT_KEYS"
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        $WHITE
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function VIEW_ENTRY_14 {
        echo 
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        echo 'Server 14 Configuration:'
        echo 
        $YELLOW
        echo "Hostname--------: $SERVER_14"
        echo "Username--------: $SERVER_14_USERNAME"
        echo "User SSH Keys---: $SERVER_14_USER_KEYS"
        echo "Root SSH Keys---: $SERVER_14_ROOT_KEYS"
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        $WHITE
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function VIEW_ENTRY_15 {
        echo 
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        echo 'Server 15 Configuration:'
        echo 
        $YELLOW
        echo "Hostname--------: $SERVER_15"
        echo "Username--------: $SERVER_15_USERNAME"
        echo "User SSH Keys---: $SERVER_15_USER_KEYS"
        echo "Root SSH Keys---: $SERVER_15_ROOT_KEYS"
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        $WHITE
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function VIEW_ENTRY_16 {
        echo 
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        echo 'Server 16 Configuration:'
        echo 
        $YELLOW
        echo "Hostname--------: $SERVER_16"
        echo "Username--------: $SERVER_16_USERNAME"
        echo "User SSH Keys---: $SERVER_16_USER_KEYS"
        echo "Root SSH Keys---: $SERVER_16_ROOT_KEYS"
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        $WHITE
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function VIEW_ENTRY_17 {
        echo 
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        echo 'Server 17 Configuration:'
        echo 
        $YELLOW
        echo "Hostname--------: $SERVER_17"
        echo "Username--------: $SERVER_17_USERNAME"
        echo "User SSH Keys---: $SERVER_17_USER_KEYS"
        echo "Root SSH Keys---: $SERVER_17_ROOT_KEYS"
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        $WHITE
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function VIEW_ENTRY_18 {
        echo 
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        echo 'Server 18 Configuration:'
        echo 
        $YELLOW
        echo "Hostname--------: $SERVER_18"
        echo "Username--------: $SERVER_18_USERNAME"
        echo "User SSH Keys---: $SERVER_18_USER_KEYS"
        echo "Root SSH Keys---: $SERVER_18_ROOT_KEYS"
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        $WHITE
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function VIEW_ENTRY_19 {
        echo 
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        echo 'Server 19 Configuration:'
        echo 
        $YELLOW
        echo "Hostname--------: $SERVER_19"
        echo "Username--------: $SERVER_19_USERNAME"
        echo "User SSH Keys---: $SERVER_19_USER_KEYS"
        echo "Root SSH Keys---: $SERVER_19_ROOT_KEYS"
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        $WHITE
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function VIEW_ENTRY_20 {
        echo 
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        echo 'Server 20 Configuration:'
        echo 
        $YELLOW
        echo "Hostname--------: $SERVER_20"
        echo "Username--------: $SERVER_20_USERNAME"
        echo "User SSH Keys---: $SERVER_20_USER_KEYS"
        echo "Root SSH Keys---: $SERVER_20_ROOT_KEYS"
        $CYAN
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        $WHITE
}

############################################################
########### Begin Server Status Functions ##################
############################################################

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_1_QUIET {
	$YELLOW
	echo
#	echo "Testing Network Connectivity..."
	if ping -c1 > /dev/null 2>&1 $SERVER_1"$i" ; then
		SERVER_1_RESULTS_COLOR="$GREEN"
		SERVER_1_RESULTS="$SERVER_1 is 'UP'"
		$WHITE
	else
		SERVER_1_RESULTS_COLOR="$RED"
		SERVER_1_RESULTS="$SERVER_1 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_2_QUIET {
	$YELLOW
	echo
#	echo "Testing Network Connectivity..."
	if ping -c1 > /dev/null 2>&1 $SERVER_2"$i" ; then
		SERVER_2_RESULTS_COLOR="$GREEN"
		SERVER_2_RESULTS="$SERVER_2 is 'UP'"
		$WHITE
	else
		SERVER_2_RESULTS_COLOR="$RED"
		SERVER_2_RESULTS="$SERVER_2 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_3_QUIET {
	$YELLOW
	echo
#	echo "Testing Network Connectivity..."
	if ping -c1 > /dev/null 2>&1 $SERVER_3"$i" ; then
		SERVER_3_RESULTS_COLOR="$GREEN"
		SERVER_3_RESULTS="$SERVER_3 is 'UP'"
		$WHITE
	else
		SERVER_3_RESULTS_COLOR="$RED"
		SERVER_3_RESULTS="$SERVER_3 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_4_QUIET {
	$YELLOW
	echo
#	echo "Testing Network Connectivity..."
	if ping -c1 > /dev/null 2>&1 $SERVER_4"$i" ; then
		SERVER_4_RESULTS_COLOR="$GREEN"
		SERVER_4_RESULTS="$SERVER_4 is 'UP'"
		$WHITE
	else
		SERVER_4_RESULTS_COLOR="$RED"
		SERVER_4_RESULTS="$SERVER_4 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_5_QUIET {
	$YELLOW
	echo
#      	echo "Testing Network Connectivity..."
	if ping -c1 > /dev/null 2>&1 $SERVER_5"$i" ; then
		SERVER_5_RESULTS_COLOR="$GREEN"
		SERVER_5_RESULTS="$SERVER_5 is 'UP'"
		$WHITE
	else
		SERVER_5_RESULTS_COLOR="$RED"
		SERVER_5_RESULTS="$SERVER_5 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_6_QUIET {
	$YELLOW
	echo
#	echo "Testing Network Connectivity..."
	if ping -c1 > /dev/null 2>&1 $SERVER_6"$i" ; then
		SERVER_6_RESULTS_COLOR="$GREEN"
		SERVER_6_RESULTS="$SERVER_6 is 'UP'"
		$WHITE
	else
		SERVER_6_RESULTS_COLOR="$RED"
		SERVER_6_RESULTS="$SERVER_6 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_7_QUIET {
	$YELLOW
	echo
#	echo "Testing Network Connectivity..."
	if ping -c1 > /dev/null 2>&1 $SERVER_7"$i" ; then
		SERVER_7_RESULTS_COLOR="$GREEN"
		SERVER_7_RESULTS="$SERVER_7 is 'UP'"
		$WHITE
	else
		SERVER_7_RESULTS_COLOR="$RED"
		SERVER_7_RESULTS="$SERVER_7 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_8_QUIET {
	$YELLOW
	echo
#	echo "Testing Network Connectivity..."
	if ping -c1 > /dev/null 2>&1 $SERVER_8"$i" ; then
		SERVER_8_RESULTS_COLOR="$GREEN"
		SERVER_8_RESULTS="$SERVER_8 is 'UP'"
		$WHITE
	else
		SERVER_8_RESULTS_COLOR="$RED"
		SERVER_8_RESULTS="$SERVER_8 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_9_QUIET {
	$YELLOW
	echo
#	echo "Testing Network Connectivity..."
	if ping -c1 > /dev/null 2>&1 $SERVER_9"$i" ; then
		SERVER_9_RESULTS_COLOR="$GREEN"
		SERVER_9_RESULTS="$SERVER_9 is 'UP'"
		$WHITE
	else
		SERVER_9_RESULTS_COLOR="$RED"
		SERVER_9_RESULTS="$SERVER_9 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_10_QUIET {
	$YELLOW
	echo
#	echo "Testing Network Connectivity..."
	if ping -c1 > /dev/null 2>&1 $SERVER_10"$i" ; then
		SERVER_10_RESULTS_COLOR="$GREEN"
		SERVER_10_RESULTS="$SERVER_10 is 'UP'"
		$WHITE
	else
		SERVER_10_RESULTS_COLOR="$RED"
		SERVER_10_RESULTS="$SERVER_10 is 'DOWN'"
		$WHITE
	fi
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_11_QUIET {
        $YELLOW
        echo
#        echo "Testing Network Connectivity..."
        if ping -c1 > /dev/null 2>&1 $SERVER_11"$i" ; then
                SERVER_11_RESULTS_COLOR="$GREEN"
                SERVER_11_RESULTS="$SERVER_11 is 'UP'"
                $WHITE
        else
                SERVER_11_RESULTS_COLOR="$RED"
                SERVER_11_RESULTS="$SERVER_11 is 'DOWN'"
                $WHITE
        fi
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_12_QUIET {
        $YELLOW
        echo
#        echo "Testing Network Connectivity..."
        if ping -c1 > /dev/null 2>&1 $SERVER_12"$i" ; then
                SERVER_12_RESULTS_COLOR="$GREEN"
                SERVER_12_RESULTS="$SERVER_12 is 'UP'"
                $WHITE
        else
                SERVER_12_RESULTS_COLOR="$RED"
                SERVER_12_RESULTS="$SERVER_12 is 'DOWN'"
                $WHITE
        fi
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_13_QUIET {
        $YELLOW
        echo
#        echo "Testing Network Connectivity..."
        if ping -c1 > /dev/null 2>&1 $SERVER_13"$i" ; then
                SERVER_13_RESULTS_COLOR="$GREEN"
                SERVER_13_RESULTS="$SERVER_13 is 'UP'"
                $WHITE
        else
                SERVER_13_RESULTS_COLOR="$RED"
                SERVER_13_RESULTS="$SERVER_13 is 'DOWN'"
                $WHITE
        fi
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_14_QUIET {
        $YELLOW
        echo
#        echo "Testing Network Connectivity..."
        if ping -c1 > /dev/null 2>&1 $SERVER_14"$i" ; then
                SERVER_14_RESULTS_COLOR="$GREEN"
                SERVER_14_RESULTS="$SERVER_14 is 'UP'"
                $WHITE
        else
                SERVER_14_RESULTS_COLOR="$RED"
                SERVER_14_RESULTS="$SERVER_14 is 'DOWN'"
                $WHITE
        fi
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_15_QUIET {
        $YELLOW
        echo
#        echo "Testing Network Connectivity..."
        if ping -c1 > /dev/null 2>&1 $SERVER_15"$i" ; then
                SERVER_15_RESULTS_COLOR="$GREEN"
                SERVER_15_RESULTS="$SERVER_15 is 'UP'"
                $WHITE
        else
                SERVER_15_RESULTS_COLOR="$RED"
                SERVER_15_RESULTS="$SERVER_15 is 'DOWN'"
                $WHITE
        fi
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_16_QUIET {
        $YELLOW
        echo
#        echo "Testing Network Connectivity..."
        if ping -c1 > /dev/null 2>&1 $SERVER_16"$i" ; then
                SERVER_16_RESULTS_COLOR="$GREEN"
                SERVER_16_RESULTS="$SERVER_16 is 'UP'"
                $WHITE
        else
                SERVER_16_RESULTS_COLOR="$RED"
                SERVER_16_RESULTS="$SERVER_16 is 'DOWN'"
                $WHITE
        fi
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_17_QUIET {
        $YELLOW
        echo
#        echo "Testing Network Connectivity..."
        if ping -c1 > /dev/null 2>&1 $SERVER_17"$i" ; then
                SERVER_17_RESULTS_COLOR="$GREEN"
                SERVER_17_RESULTS="$SERVER_17 is 'UP'"
                $WHITE
        else
                SERVER_17_RESULTS_COLOR="$RED"
                SERVER_17_RESULTS="$SERVER_17 is 'DOWN'"
                $WHITE
        fi
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_18_QUIET {
        $YELLOW
        echo
#        echo "Testing Network Connectivity..."
        if ping -c1 > /dev/null 2>&1 $SERVER_18"$i" ; then
                SERVER_18_RESULTS_COLOR="$GREEN"
                SERVER_18_RESULTS="$SERVER_18 is 'UP'"
                $WHITE
        else
                SERVER_18_RESULTS_COLOR="$RED"
                SERVER_18_RESULTS="$SERVER_18 is 'DOWN'"
                $WHITE
        fi
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_19_QUIET {
        $YELLOW
        echo
#        echo "Testing Network Connectivity..."
        if ping -c1 > /dev/null 2>&1 $SERVER_19"$i" ; then
                SERVER_19_RESULTS_COLOR="$GREEN"
                SERVER_19_RESULTS="$SERVER_19 is 'UP'"
                $WHITE
        else
                SERVER_19_RESULTS_COLOR="$RED"
                SERVER_19_RESULTS="$SERVER_19 is 'DOWN'"
                $WHITE
        fi
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function _PING_SERVER_20_QUIET {
        $YELLOW
        echo
#        echo "Testing Network Connectivity..."
        if ping -c1 > /dev/null 2>&1 $SERVER_20"$i" ; then
                SERVER_20_RESULTS_COLOR="$GREEN"
                SERVER_20_RESULTS="$SERVER_20 is 'UP'"
                $WHITE
        else
                SERVER_20_RESULTS_COLOR="$RED"
                SERVER_20_RESULTS="$SERVER_20 is 'DOWN'"
                $WHITE
        fi
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#TO DO: rework this beore copying server 1 to others

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ BEGIN SSH SERVER FUNCTIONS~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################# $SERVER_1 #################################
function SSH_SERVER_1 {
	$GREEN
	echo
	echo -e "\e[1mConnect to 'https://$SERVER_1' as:\e[0m"
	$WHITE
		PS3='Select choice:'
		options=("User" "Root" "Other" "Back to selection" "Quit")
		select opt in "${options[@]}"
		do
		    case $opt in
		        "User")
				$YELLOW
				echo
	 		        echo "Connecting to $SERVER_1 as '$SERVER_1_USERNAME'"
			        $WHITE
			        ssh -i "$SERVER_1_USER_KEYS" "${SERVER_1_USERNAME}@${SERVER_1}"
        		    ;;
		        "Root")
				$RED
				echo
			        echo "Connecting to https://$SERVER_1 as root account"
				$WHITE
			        ssh -i "$SERVER_1_ROOT_KEYS" root@"${SERVER_1}"
		            ;;
			"Other")
				echo
				echo -n "Enter Username: "
				read -r SERVER_1_OTHER

	function SERVER_1_SELECT_KEY {
		read -r -p "Do you have an SSH key? [Y/n] " input
		        case $input in
		            [yY][eE][sS]|[yY])
		                echo -n "Enter File Location of SSH Key for $SERVER_1_OTHER: "
		                read -r SERVER_1_OTHER_KEY
		                ssh -i "$SERVER_1_OTHER_KEY" "$SERVER_1_OTHER"@"$SERVER_1"
			       ;;
		            [nN][oO]|[nN])
		                ssh "$SERVER_1_OTHER"@"$SERVER_1"
		               ;;
		            *)
		         	echo "Invalid input..."
		         ;;
		        esac
	}
	SERVER_1_SELECT_KEY
			    break
			    ;;
		        "Back to selection")
		        SERVER_LIST
		            break
			    ;;
		        "Quit")
		            break
		            ;;
		        *) echo "invalid option $REPLY";;
		    esac
		done
}

################################# $SERVER_2 #################################

function SSH_SERVER_2 {
$GREEN
echo
echo -e "\e[1mConnect to 'https://$SERVER_2' as:\e[0m"
$WHITE
PS3='Select choice:'
options=("User" "Root" "Other" "Back to selection" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "User")
$YELLOW
	echo
        echo "Connecting to https://$SERVER_2 as user account"
$WHITE
        ssh -i "$HOME/.ssh/$SERVER_2_USER_KEYS" "$SERVER_2_USERNAME"@"$SERVER_2"
            break
            ;;
        "Root")
$RED
	echo
        echo "Connecting to https://$SERVER_2 as root account"
$WHITE
        ssh -i "$HOME/.ssh/$SERVER_2_ROOT_KEYS" root@$SERVER_2
            break
            ;;
        "Other")
        echo
        echo -n "Enter Username: "
        read -r SERVER_2_OTHER
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function SERVER_2_SELECT_KEY {
        read -r -p "Do you have an SSH key? [Y/n] " input
        case $input in
            [yY][eE][sS]|[yY])
                echo -n "Enter File Location of SSH Key for $SERVER_2_OTHER: "
                read -r SERVER_2_OTHER_KEY
                ssh -i "$SERVER_2_OTHER_KEY" "$SERVER_2_OTHER"@$SERVER_2
         ;;
            [nN][oO]|[nN])
                ssh "$SERVER_2_OTHER"@$SERVER_2
               ;;
            *)
         echo "Invalid input..."
         ;;
        esac
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        SERVER_2_SELECT_KEY
            break
            ;;
        "Back to selection")
        SERVER_LIST
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
}

################################# $SERVER_3 #################################

function SSH_SERVER_3 {
$GREEN
echo
echo -e "\e[1mConnect to 'https://$SERVER_3' as:\e[0m"
$WHITE
PS3='Select choice:'
options=("User" "Root" "Other" "Back to selection" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "User")
$YELLOW
	echo
        echo "Connecting to https://$SERVER_3 as user account"
$WHITE
        ssh -i "$HOME/.ssh/$SERVER_3_USER_KEYS" $SERVER_3_USERNAME@$SERVER_3
            break
            ;;
        "Root")
$RED
	echo
        echo "Connecting to https://$SERVER_3 as root account"
$WHITE
        ssh -i "$HOME/.ssh/$SERVER_3_ROOT_KEYS" root@$SERVER_3
            break
            ;;
        "Other")
        echo
        echo -n "Enter Username: "
        read -r SERVER_3_OTHER
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function SERVER_3_SELECT_KEY {
        read -r -p "Do you have an SSH key? [Y/n] " input
        case $input in
            [yY][eE][sS]|[yY])
                echo -n "Enter File Location of SSH Key for $SERVER_3_OTHER: "
                read -r SERVER_3_OTHER_KEY
                ssh -i "$SERVER_3_OTHER_KEY" "$SERVER_3_OTHER"@$SERVER_3
         ;;
            [nN][oO]|[nN])
                ssh "$SERVER_3_OTHER"@$SERVER_3
               ;;
            *)
         echo "Invalid input..."
         ;;
        esac
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        SERVER_3_SELECT_KEY
            break
            ;;
        "Back to selection")
        SERVER_LIST
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
}
################################# $SERVER_3 #################################

function SSH_SERVER_3 {
$GREEN
echo
echo -e "\e[1mConnect to 'https://$SERVER_3' as:\e[0m"
$WHITE
PS3='Select choice:'
options=("User" "Root" "Other" "Back to selection" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "User")
$YELLOW
	echo
        echo "Connecting to https://$SERVER_3 as user account"
$WHITE
        ssh -i "$HOME/.ssh/$SERVER_3_USER_KEYS" $SERVER_3_USERNAME@$SERVER_3
            break
            ;;
        "Root")
$RED
	echo
        echo "Connecting to https://$SERVER_3 as root account"
$WHITE
        ssh -i "$HOME/.ssh/$SERVER_3_ROOT_KEYS" root@$SERVER_3
            break
            ;;
        "Other")
        echo
        echo -n "Enter Username: "
        read -r SERVER_3_OTHER
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function SERVER_3_SELECT_KEY {
        read -r -p "Do you have an SSH key? [Y/n] " input
        case $input in
            [yY][eE][sS]|[yY])
                echo -n "Enter File Location of SSH Key for $SERVER_3_OTHER: "
                read -r SERVER_3_OTHER_KEY
                ssh -i "$SERVER_3_OTHER_KEY" "$SERVER_3_OTHER"@$SERVER_3
         ;;
            [nN][oO]|[nN])
                ssh "$SERVER_3_OTHER"@$SERVER_3
               ;;
            *)
         echo "Invalid input..."
         ;;
        esac
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        SERVER_3_SELECT_KEY
            break
            ;;
        "Back to selection")
        SERVER_LIST
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
}
################################# $SERVER_4 #################################

function SSH_SERVER_4 {
$GREEN
echo
echo -e "\e[1mConnect to 'https://$SERVER_4' as:\e[0m"
$WHITE
PS3='Select choice:'
options=("User" "Root" "Other" "Back to selection" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "User")
$YELLOW
	echo
        echo "Connecting to https://$SERVER_4 as user account"
$WHITE
        ssh -i "$HOME/.ssh/$SERVER_4_USER_KEYS" $SERVER_4_USERNAME@$SERVER_4
            break
            ;;
        "Root")
$RED
	echo
        echo "Connecting to https://$SERVER_4 as root account"
$WHITE
        ssh -i "$HOME/.ssh/$SERVER_4_ROOT_KEYS" root@$SERVER_4
            break
            ;;
        "Other")
        echo
        echo -n "Enter Username: "
        read -r SERVER_4_OTHER
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function SERVER_4_SELECT_KEY {
        read -r -p "Do you have an SSH key? [Y/n] " input
        case $input in
            [yY][eE][sS]|[yY])
                echo -n "Enter File Location of SSH Key for $SERVER_4_OTHER: "
                read -r SERVER_4_OTHER_KEY
                ssh -i "$SERVER_4_OTHER_KEY" "$SERVER_4_OTHER"@$SERVER_4
         ;;
            [nN][oO]|[nN])
                ssh "$SERVER_4_OTHER"@$SERVER_4
               ;;
            *)
         echo "Invalid input..."
         ;;
        esac
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        SERVER_4_SELECT_KEY
            break
            ;;
        "Back to selection")
        SERVER_LIST
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
}

################################# $SERVER_5 #################################

function SSH_SERVER_5 {
$GREEN
echoecho -e "\e[1mConnect to 'https://$SERVER_5' as:\e[0m"
$WHITE
PS3='Select choice:'
options=("User" "Root" "Other" "Back to selection" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "User")
$YELLOW
	echo
        echo "Connecting to https://$SERVER_5 as user account"
$WHITE
        ssh -i "$HOME/.ssh/$SERVER_5_USER_KEYS" $SERVER_5_USERNAME@$SERVER_5
            break
            ;;
        "Root")
$RED
	echo
        echo "Connecting to https://$SERVER_5 as root account"
$WHITE
        ssh -i "$HOME/.ssh/$SERVER_5_ROOT_KEYS" root@$SERVER_5
            break
            ;;
        "Other")
        echo
        echo -n "Enter Username: "
        read -r SERVER_5_OTHER
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function SERVER_5_SELECT_KEY {
        read -r -p "Do you have an SSH key? [Y/n] " input
        case $input in
            [yY][eE][sS]|[yY])
                echo -n "Enter File Location of SSH Key for $SERVER_5_OTHER: "
                read -r SERVER_5_OTHER_KEY
                ssh -i "$SERVER_5_OTHER_KEY" "$SERVER_5_OTHER"@$SERVER_5
         ;;
            [nN][oO]|[nN])
                ssh "$SERVER_5_OTHER"@$SERVER_5
               ;;
            *)
         echo "Invalid input..."
         ;;
        esac
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        SERVER_5_SELECT_KEY
            break
            ;;
        "Back to selection")
        SERVER_LIST
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
}

################################# $SERVER_6 #################################

function SSH_SERVER_6 {
$GREEN
echo
echo -e "\e[1mConnect to 'https://$SERVER_6' as:\e[0m"
$WHITE
PS3='Select choice:'
options=("User" "Root" "Other" "Back to selection" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "User")
$YELLOW
	echo
        echo "Connecting to https://$SERVER_6 as user account"
$WHITE
        ssh -i "$HOME/.ssh/$SERVER_6_USER_KEYS" $SERVER_6_USERNAME@$SERVER_6
            break
            ;;
        "Root")
$RED
	echo
        echo "Connecting to https://$SERVER_6 as root account"
$WHITE
        ssh -i "$HOME/.ssh/$SERVER_6_ROOT_KEYS" root@$SERVER_6
            break
            ;;
        "Other")
        echo
        echo -n "Enter Username: "
        read -r SERVER_6_OTHER
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function SERVER_6_SELECT_KEY {
        read -r -p "Do you have an SSH key? [Y/n] " input
        case $input in
            [yY][eE][sS]|[yY])
                echo -n "Enter File Location of SSH Key for $SERVER_6_OTHER: "
                read -r SERVER_6_OTHER_KEY
                ssh -i "$SERVER_6_OTHER_KEY" "$SERVER_6_OTHER"@$SERVER_6
         ;;
            [nN][oO]|[nN])
                ssh "$SERVER_6_OTHER"@$SERVER_6
               ;;
            *)
         echo "Invalid input..."
         ;;
        esac
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        SERVER_6_SELECT_KEY
            break
            ;;
        "Back to selection")
        SERVER_LIST
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
}

################################# $SERVER_7 #################################

function SSH_SERVER_7 {
$GREEN
echo
echo -e "\e[1mConnect to 'https://$SERVER_7' as:\e[0m"
$WHITE
PS3='Select choice:'
options=("User" "Root" "Other" "Back to selection" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "User")
$YELLOW
	echo
        echo "Connecting to https://$SERVER_7 as user account"
$WHITE
        ssh -i "$HOME/.ssh/$SERVER_7_USER_KEYS" $SERVER_7_USERNAME@$SERVER_7
            break
            ;;
        "Root")
$RED
	echo
        echo "Connecting to https://$SERVER_7 as root account"
$WHITE
        ssh -i "$HOME/.ssh/$SERVER_7_ROOT_KEYS" root@$SERVER_7
            break
            ;;
        "Other")
        echo
        echo -n "Enter Username: "
        read -r SERVER_7_OTHER
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function SERVER_7_SELECT_KEY {
        read -r -p "Do you have an SSH key? [Y/n] " input
        case $input in
            [yY][eE][sS]|[yY])
                echo -n "Enter File Location of SSH Key for $SERVER_7_OTHER: "
                read -r SERVER_7_OTHER_KEY
                ssh -i "$SERVER_7_OTHER_KEY" "$SERVER_7_OTHER"@$SERVER_7
         ;;
            [nN][oO]|[nN])
		CREATE_KEY
                ssh "$SERVER_7_OTHER"@$SERVER_7
               ;;
            *)
         echo "Invalid input..."
         ;;
        esac
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        SERVER_7_SELECT_KEY
            break
            ;;
        "Back to selection")
        SERVER_LIST
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
# TO DO: make servers 8, 9 and 10 and move this whole function down i think
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SERVER LIST for SSH ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function SERVER_LIST {
	$YELLOW
	echo
	echo 'Which server do you want to connect to?'
		PS3='Enter your choice: '
		$WHITE
		options=("$SERVER_1" "$SERVER_2" "$SERVER_3" "$SERVER_4" "$SERVER_5" "$SERVER_6" "$SERVER_7" "$SERVER_8" "$SERVER_9" "$SERVER_10" "$SERVER_11" "$SERVER_12" "$SERVER_13" "$SERVER_14" "$SERVER_15" "$SERVER_16" "$SERVER_17" "$SERVER_18" "$SERVER_19" "$SERVER_20" "Other" "Back" "Quit")
		select opt in "${options[@]}"
		do
		    case $opt in
		        "$SERVER_1")
				CHOSEN_SERVER="$SERVER_1"
				SSH_SERVER_1
				break
		            ;;
		        "$SERVER_2")
		        	CHOSEN_SERVER="$SERVER_2"
				SSH_SERVER_2
				break
		            ;;
		        "$SERVER_3")
			        CHOSEN_SERVER="$SERVER_3"
				SSH_SERVER_3
			        break
		            ;;
			"$SERVER_4")
			        CHOSEN_SERVER="$SERVER_4"
				SSH_SERVER_4
				break
			    ;;
			"$SERVER_5")
			        CHOSEN_SERVER="$SERVER_5"
				SSH_SERVER_5
				break
			    ;;
			"$SERVER_6")
			        CHOSEN_SERVER="$SERVER_6"
				SSH_SERVER_6
			    ;;
			"$SERVER_7")
			        CHOSEN_SERVER="$SERVER_7"
				SSH_SERVER_7
			    ;;
		        "Other")
				echo 'enter server'
				echo 'jk lol i didnt make a function yet'
				break
		            ;;
			"Back")
				MAIN
			    ;;
		        "Quit")
	 	                break
		            ;;
		        *) echo "invalid option $REPLY";;
		    esac
		done
}











#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~SERVER LIST FOR EDIT CONFIG~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function SERVER_LIST_EDIT_CONFIG {
	$RED
	echo
	echo 'Which server do you want to EDIT?'
		PS3='Enter your choice: '
		$WHITE
#               options=("$SERVER_1" "Edit Server Count" "Back" "Quit")
#		options=("$SERVER_1" "$SERVER_2" "Edit Server Count" "Back" "Quit")
#               options=("$SERVER_1" "$SERVER_2" "$SERVER_3" "Edit Server Count" "Back" "Quit")
#               options=("$SERVER_1" "$SERVER_2" "$SERVER_3" "$SERVER_4" "Edit Server Count" "Back" "Quit")
#               options=("$SERVER_1" "$SERVER_2" "$SERVER_3" "$SERVER_4" "$SERVER_5" "Edit Server Count" "Back" "Quit")
#               options=("$SERVER_1" "$SERVER_2" "$SERVER_3" "$SERVER_4" "$SERVER_5" "$SERVER_6" "Edit Server Count" "Back" "Quit")
#               options=("$SERVER_1" "$SERVER_2" "$SERVER_3" "$SERVER_4" "$SERVER_5" "$SERVER_6" "$SERVER_7" "Edit Server Count" "Back" "Quit")
#               options=("$SERVER_1" "$SERVER_2" "$SERVER_3" "$SERVER_4" "$SERVER_5" "$SERVER_6" "$SERVER_7" "$SERVER_8" "Edit Server Count" "Back" "Quit")
#               options=("$SERVER_1" "$SERVER_2" "$SERVER_3" "$SERVER_4" "$SERVER_5" "$SERVER_6" "$SERVER_7" "$SERVER_8" "$SERVER_9" "Edit Server Count" "Back" "Quit")
#               options=("$SERVER_1" "$SERVER_2" "$SERVER_3" "$SERVER_4" "$SERVER_5" "$SERVER_6" "$SERVER_7" "$SERVER_8" "$SERVER_9" "$SERVER_10" "Edit Server Count" "Back" "Quit")
#               options=("$SERVER_1" "$SERVER_2" "$SERVER_3" "$SERVER_4" "$SERVER_5" "$SERVER_6" "$SERVER_7" "$SERVER_8" "$SERVER_9" "$SERVER_10" "$SERVER_11" "Edit Server Count" "Back" "Quit")
#               options=("$SERVER_1" "$SERVER_2" "$SERVER_3" "$SERVER_4" "$SERVER_5" "$SERVER_6" "$SERVER_7" "$SERVER_8" "$SERVER_9" "$SERVER_10" "$SERVER_11" "$SERVER_12" "Edit Server Count" "Back" "Quit")
#               options=("$SERVER_1" "$SERVER_2" "$SERVER_3" "$SERVER_4" "$SERVER_5" "$SERVER_6" "$SERVER_7" "$SERVER_8" "$SERVER_9" "$SERVER_10" "$SERVER_11" "$SERVER_12" "$SERVER_13" "Edit Server Count" "Back" "Quit")
#               options=("$SERVER_1" "$SERVER_2" "$SERVER_3" "$SERVER_4" "$SERVER_5" "$SERVER_6" "$SERVER_7" "$SERVER_8" "$SERVER_9" "$SERVER_10" "$SERVER_11" "$SERVER_12" "$SERVER_13" "$SERVER_14" "Edit Server Count" "Back" "Quit")
#               options=("$SERVER_1" "$SERVER_2" "$SERVER_3" "$SERVER_4" "$SERVER_5" "$SERVER_6" "$SERVER_7" "$SERVER_8" "$SERVER_9" "$SERVER_10" "$SERVER_11" "$SERVER_12" "$SERVER_13" "$SERVER_14" "$SERVER_15" "Edit Server Count" "Back" "Quit")
#               options=("$SERVER_1" "$SERVER_2" "$SERVER_3" "$SERVER_4" "$SERVER_5" "$SERVER_6" "$SERVER_7" "$SERVER_8" "$SERVER_9" "$SERVER_10" "$SERVER_11" "$SERVER_12" "$SERVER_13" "$SERVER_14" "$SERVER_15" "$SERVER_16" "Edit Server Count" "Back" "Quit")
#               options=("$SERVER_1" "$SERVER_2" "$SERVER_3" "$SERVER_4" "$SERVER_5" "$SERVER_6" "$SERVER_7" "$SERVER_8" "$SERVER_9" "$SERVER_10" "$SERVER_11" "$SERVER_12" "$SERVER_13" "$SERVER_14" "$SERVER_15" "$SERVER_16" "$SERVER_17" "Edit Server Count" "Back" "Quit")
#               options=("$SERVER_1" "$SERVER_2" "$SERVER_3" "$SERVER_4" "$SERVER_5" "$SERVER_6" "$SERVER_7" "$SERVER_8" "$SERVER_9" "$SERVER_10" "$SERVER_11" "$SERVER_12" "$SERVER_13" "$SERVER_14" "$SERVER_15" "$SERVER_16" "$SERVER_17" "$SERVER_18" "Edit Server Count" "Back" "Quit")
#               options=("$SERVER_1" "$SERVER_2" "$SERVER_3" "$SERVER_4" "$SERVER_5" "$SERVER_6" "$SERVER_7" "$SERVER_8" "$SERVER_9" "$SERVER_10" "$SERVER_11" "$SERVER_12" "$SERVER_13" "$SERVER_14" "$SERVER_15" "$SERVER_16" "$SERVER_17" "$SERVER_18" "$SERVER_19" "Edit Server Count" "Back" "Quit")
		options=("$SERVER_1" "$SERVER_2" "$SERVER_3" "$SERVER_4" "$SERVER_5" "$SERVER_6" "$SERVER_7" "$SERVER_8" "$SERVER_9" "$SERVER_10" "$SERVER_11" "$SERVER_12" "$SERVER_13" "$SERVER_14" "$SERVER_15" "$SERVER_16" "$SERVER_17" "$SERVER_18" "$SERVER_19" "$SERVER_20" "Edit Server Count" "Back" "Quit")

		select opt in "${options[@]}"
	do
	    case $opt in
	        "$SERVER_1")
#YOOOOO
function EDIT_SERVER_1_NAME_EDIT_CONFIG {
VIEW_ENTRY_1
$WHITE
echo
read -r -p "Edit Server Name? [Y/n] " input
 case $input in
    [yY][eE][sS]|[yY])
EDIT_SERVER_1_NAME
 ;;
    [nN][oO]|[nN])
 echo "No"
S_1_EDITED_NAME="$SERVER_1"
       ;;

	"$SERVER_2")
echo "im server 2"
	;;
        "$SERVER_3")
echo "im server 3"
        ;;
        "$SERVER_4")
echo "im server 4"
        ;;
        "$SERVER_5")
echo "im server 5"
        ;;
        "$SERVER_6")
echo "im server 6"
        ;;
        "$SERVER_7")
echo "im server 7"
        ;;
        "$SERVER_8")
echo "im server 8"
        ;;
        "$SERVER_9")
echo "im server 9"
        ;;
        "$SERVER_10")
echo "im server 10"
        ;;
        "$SERVER_11")
echo "im server 11"
        ;;
        "$SERVER_12")
echo "im server 12"
        ;;
        "$SERVER_13")
echo "im server 13"
        ;;
        "$SERVER_14")
echo "im server 14"
        ;;
        "$SERVER_15")
echo "im server 15"
        ;;
        "$SERVER_16")
echo "im server 16"
        ;;
        "$SERVER_17")
echo "im server 17"
        ;;
        "$SERVER_18")
echo "im server 18"
        ;;
        "$SERVER_19")
echo "im server 19"
        ;;
        "$SERVER_20")
echo "im server 20"
        ;;
        "Edit Server Count")
	_SED_SERVER_COUNT_
	./server.sh
        ;;
        "Back")
        ;;
        "Quit")
        ;;
*) echo "invalid option $REPLY"
   EDIT_SERVER_1_NAME_EDIT_CONFIG
#    *)
# echo "Invalid input..."
 ;;
esac
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function EDIT_SERVER_1_USERNAME_EDIT_CONFIG {
echo
#$CYAN
#echo "[Current Configuration for Entry 1]"
#$YELLOW
#echo "Server: '$S_1_EDITED_NAME'"
#echo "Username: '$SERVER_1_USERNAME'"
#echo "User Keys: '$SERVER_1_USER_KEYS'"
$WHITE
read -r -p "Edit Username? [Y/n] " input
 
case $input in
    [yY][eE][sS]|[yY])
EDIT_SERVER_1_USERNAME
 ;;
    [nN][oO]|[nN])
 echo "No"
S_1_EDITED_USERNAME="$SERVER_1_USERNAME"
       ;;
    *)
 echo "Invalid input..."
 ;;
esac
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function EDIT_SERVER_1_USER_KEYS_EDIT_CONFIG {
echo
#$CYAN
#echo "[Current Configuration for Entry #1]"
#$YELLOW
#echo "Server: '$SERVER_1' Username: '$SERVER_1_USERNAME' Keys: '$SERVER_1_USER_KEYS'"
#echo "current user keys for '$S_1_EDITED_USERNAME' '$S_1_EDITED_NAME'is '$SERVER_1_USER_KEYS'"
$WHITE
read -r -p "Edit User Keys? [Y/n] " input
 
case $input in
    [yY][eE][sS]|[yY])
EDIT_SERVER_1_USER_KEYS
 ;;
    [nN][oO]|[nN])
 echo "No"
       ;;
    *)
 echo "Invalid input..."
 ;;
esac
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function EDIT_SERVER_1_ROOT_KEYS_EDIT_CONFIG {
echo
#$YELLOW
#echo "current ROOT keys for user '$S_1_EDITED_USERNAME' and server '$S_1_EDITED_NAME' is '$SERVER_1_ROOT_KEYS'"
$WHITE
read -r -p "Edit Root Keys? [Y/n] " input
 
case $input in
    [yY][eE][sS]|[yY])
EDIT_SERVER_1_ROOT_KEYS
 ;;
    [nN][oO]|[nN])
 echo "No"
       ;;
    *)
 echo "Invalid input..."
 ;;
esac
}


EDIT_SERVER_1_NAME_EDIT_CONFIG
EDIT_SERVER_1_USERNAME_EDIT_CONFIG
EDIT_SERVER_1_USER_KEYS_EDIT_CONFIG
EDIT_SERVER_1_ROOT_KEYS_EDIT_CONFIG
$CYAN
echo
echo "Server 1 configuration complete."

#### BREAKS THE SCRIPT SOMEHOW

function EDIT_MORE_ENTRIES {

echo
$WHITE
read -r -p "Edit more entries? [Y/n] " input

case $input in
    [yY][eE][sS]|[yY])
 echo "Yes"
#SERVER_LIST_EDIT_CONFIG
echo '1'
./server.sh -e
exit
 ;;
    [nN][oO]|[nN])
 echo "No more entries will be edited.. Saving Configurations"
       ;;
    *)
 echo "Invalid input..."
 echo "Configurations were not saved"
break
 ;;
esac
}

EDIT_MORE_ENTRIES

	echo 'restarting script'
	./server.sh
#	exit
            ;;
        "$SERVER_2")
        echo 'i am server 2'
        break
            ;;
        "$SERVER_3")
        echo 'i am server 3'
        break
            ;;
        "$SERVER_4")
        echo 'i am server 4'
        break
            ;;
        "$SERVER_5")
        echo 'i am server 5'
        break
            ;;
        "$SERVER_6")
        echo 'i am server 6'
	break
            ;;
        "$SERVER_7")
	echo 'i am server 7'
	break
            ;;
        "$SERVER_8")
        echo 'i am server 8'
        break
            ;;
        "$SERVER_9")
        echo 'i am server 9'
        break
            ;;
        "$SERVER_10")
        echo 'i am server 10'
        break
            ;;
        "$SERVER_11")
        echo 'i am server 11'
        break
            ;;
        "$SERVER_12")
        echo 'i am server 12'
        break
            ;;
        "$SERVER_13")
        echo 'i am server 13'
        break
            ;;
        "$SERVER_14")
        echo 'i am server 14'
        break
            ;;
        "$SERVER_15")
        echo 'i am server 15'
        break
            ;;
        "$SERVER_16")
        echo 'i am server 16'
        break
            ;;
        "$SERVER_17")
        echo 'i am server 17'
        break
            ;;
        "$SERVER_18")
        echo 'i am server 18'
        break
            ;;
        "$SERVER_19")
        echo 'i am server 19'
        break
            ;;
        "$SERVER_20")
        echo 'i am server 20'
        break
            ;;
        "Edit Server Count")
	#idk anymore
	_SED_SERVER_COUNT_
	_SED_UPDATE_SERVER_COUNT_
	./server.sh -e
        break
            ;;
        "Back")
#	MAIN does not work
	./server.sh
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
}

















#################################################################
















#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~FTP~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function FTP_SERVER {
echo 'I am the ftp function'

echo "set up sftp on server:
     sudo apt update
     sudo apt upgrade
     sudo addgroup sftp_fosslinux
     sudo useradd -m sftpfossuser -g sftp_fosslinux
     sudo passwd sftpfossuser
sudo chmod 700 /home/sftpfossuser
sudo apt install ssh
sudo vi /etc/ssh/sshd_config

add these lines to the end

Match group sftp_fosslinux
ChrootDirectory /home
X11Forwarding no
AllowTcpForwarding no
ForceCommand internal-sftp

sudo systemctl restart ssh

sftp sftpfossuser@127.0.0.1



cd sftpfossuser
ls
mkdir sftpdir
ls
exit
~~~~~~~~~~~~~~~
retrieve file
sftp [user@]host[:file ...]"
~~~~~~~~~~~~~~~~
}







#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~USEFUL_COMMANDS FUNCTION  BASH SERVER EXAMPLES~~~~~~~~~~~~~~~~~~~~~~
function USEFUL_COMMANDS {
echo
echo
echo '                  __       _                               '
echo '                 / _|     | |                              '
echo '  _   _ ___  ___| |_ _   _| |                              '
echo ' | | | / __|/ _ \  _| | | | |                              '
echo ' | |_| \__ \  __/ | | |_| | |                   _          '
echo '  \__,_|___/\___|_|  \__,_|_|                  | |     _   '
echo '   ___ ___  _ __ ___  _ __ ___   __ _ _ __   __| |___ (_)  '
echo '  / __/ _ \| `_ ` _ \| `_ ` _ \ / _` | `_ \ / _` / __|     '
echo ' | (_| (_) | | | | | | | | | | | (_| | | | | (_| \__ \ _   '
echo '  \___\___/|_| |_| |_|_| |_| |_|\__,_|_| |_|\__,_|___/(_)  '
echo
PS3='Please enter your choice: '
options=("Set up new server" "Set up VPN" "ssl" "Option 3" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Set up new server")
            echo "you chose choice 1"
            ;;
        "Set up VPN")
            echo "hi"
            ;;
        "ssl")
            echo "you chose choice 2"
            ;;
        "Option 3")
            echo "you chose choice $REPLY which is $opt"
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done



}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ README ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function VIEW_README {
clear
echo
echo
echo
echo -e "\e[1;33;4;44mThis is the README file for server.sh\e[0m"
echo
echo 'Creator: ComputerJerms'
echo 'https://www.computerjerms.com/'
echo 'https://github.com/computerjerms/'
echo
echo 'This program is a front-end terminal client for managing'
echo 'your SSH connections to remote servers'
echo
$RED
echo 'Key Features:'
$YELLOW
echo 'Easily manage 1-20 Servers'
echo 'SSH into servers as user or root -- more users coming soon'
echo 'SFTP into servers as user or root -- more users coming soon'
echo 'Easy SSH key creation'
echo 'Send keys to server'
echo 'Set up a new web server'
echo 'Deploy VPN on Server'
echo 'Deploy Nextcloud Instance on Server -- coming soon'
echo 'Test network connectivity on all servers in seconds'
echo
echo 'POSIX Shell Compliant'

$BLUE
echo 'Configuration:'
echo '1) Via program'
echo '   -- Recommended'
echo '2) Manually'
echo '   -- If you choose this option you must edit only between lines 25-209'
echo '   -- You must use the full path for keys or $HOME ( ~ will not work)'
echo
echo
$RED
echo ' TO THE DEVS WHO WANT TO EDIT THIS PROGRAM '
$YELLOW
echo ' some nuggets of information are:'
echo
echo ' first and foremost, editing any of the lines will fuck this script up'
echo ' im not saying its impossible to fix, i tried my best to organize it'
echo ' theres a ton of sed functions going here, sorry, what did you want me to do?'
echo ' you fucking fag... anyway heres the other information'
echo '#INFO_1 '
echo '#INFO_2 '
echo '#INFO_3 '
echo '#INFO_4 '
echo '#INFO_5 '
echo '#INFO_6 '
echo '#INFO_7 '

}





################################# HELP SCREEN #################################

#Help()
function HELP_FUNCTION {
   # Display Help
   $CYAN
   echo 
   echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
   $YELLOW
   echo -e "\e[1mHelp Screen for server.sh\e[0m"
   echo
   echo "Syntax: [ |-1|-2|-3|-4|-5|-6|-7|-8|-9|-0|-e|-h|-l|-r|-v| ]"
   echo
   $GREEN
   echo "Option:    Description:"
   $WHITE
   echo ""
   echo "-1  ~~~~~  connect to $SERVER_1 as '$SERVER_1_USERNAME'"
   echo "-2  ~~~~~  connect to $SERVER_2 as '$SERVER_2_USERNAME'"
   echo "-3  ~~~~~  connect to $SERVER_3 as '$SERVER_3_USERNAME'"
   echo "-4  ~~~~~  connect to $SERVER_4 as '$SERVER_4_USERNAME'"
   echo "-5  ~~~~~  connect to $SERVER_5 as '$SERVER_5_USERNAME'"
   echo "-6  ~~~~~  connect to $SERVER_6 as '$SERVER_6_USERNAME'"
   echo "-7  ~~~~~  connect to $SERVER_7 as '$SERVER_7_USERNAME'"
   echo "-8  ~~~~~  connect to $SERVER_8 as '$SERVER_8_USERNAME'"
   echo "-9  ~~~~~  connect to $SERVER_9 as '$SERVER_9_USERNAME'"
   echo "-0  ~~~~~  connect to $SERVER_10 as '$SERVER_10_USERNAME'"
   echo "-c  ~~~~~  connect to server (ex. ./server.sh -c 2)"
   echo "-e  ~~~~~  Edit Current Configuration"
   echo "-h  ~~~~~  Print this Help."
   echo "-l  ~~~~~  List current configuration"
   echo "-r  ~~~~~  Prints the README documentation"
   echo "-u  ~~~~~  Useful Server Commands"
   echo "-v  ~~~~~  Print software version and exit."
   $CYAN
   echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
   $WHITE
}

################################# Flag options #################################
# Get the options
while getopts ":1234567890cehlruv" option; do
   case $option in
      1) # connect to Server 1 as User
	$MAGENTA
	echo "Connecting to $SERVER_1 as '$SERVER_1_USERNAME'"
	$WHITE
        ssh -i "$HOME/.ssh/$SERVER_1_USER_KEYS" "${SERVER_1_USERNAME}@${SERVER_1}"
         exit;;
      2) # connect to Server 2 as User
        $MAGENTA
        echo "Connecting to $SERVER_2 as '$SERVER_2_USERNAME'"
        $WHITE
        ssh -i "$HOME/.ssh/$SERVER_2_USER_KEYS" "${SERVER_2_USERNAME}@${SERVER_2}"
         exit;;
      3) # connect to Server 3 as User
        $MAGENTA
        echo "Connecting to $SERVER_3 as '$SERVER_3_USERNAME'"
        $WHITE
        ssh -i "$HOME/.ssh/$SERVER_3_USER_KEYS" "${SERVER_3_USERNAME}@${SERVER_3}"
         exit;;
      4) # connect to Server 4 as User
        $MAGENTA
        echo "Connecting to $SERVER_4 as '$SERVER_4_USERNAME'"
        $WHITE
        ssh -i "$HOME/.ssh/$SERVER_4_USER_KEYS" "${SERVER_4_USERNAME}@${SERVER_4}"
         exit;;
      5) # connect to Server 5 as User
        $MAGENTA
        echo "Connecting to $SERVER_5 as '$SERVER_5_USERNAME'"
        $WHITE
        ssh -i "$HOME/.ssh/$SERVER_5_USER_KEYS" "${SERVER_5_USERNAME}@${SERVER_5}"
         exit;;
      6) # connect to Server 6 as User
        $MAGENTA
        echo "Connecting to $SERVER_6 as '$SERVER_6_USERNAME'"
        $WHITE
        ssh -i "$HOME/.ssh/$SERVER_6_USER_KEYS" "${SERVER_6_USERNAME}@${SERVER_6}"
         exit;;
      7) # connect to Server 7 as User
        $MAGENTA
        echo "Connecting to $SERVER_7 as '$SERVER_7_USERNAME'"
        $WHITE
        ssh -i "$HOME/.ssh/$SERVER_7_USER_KEYS" "${SERVER_7_USERNAME}@${SERVER_7}"
         exit;;
      8) # connect to Server 8 as User
        $MAGENTA
        echo "Connecting to $SERVER_8 as '$SERVER_8_USERNAME'"
        $WHITE
        ssh -i "$HOME/.ssh/$SERVER_8_USER_KEYS" "${SERVER_8_USERNAME}@${SERVER_8}"
         exit;;
      9) # connect to Server 9 as User
        $MAGENTA
        echo "Connecting to $SERVER_9 as '$SERVER_9_USERNAME'"
        $WHITE
        ssh -i "$HOME/.ssh/$SERVER_9_USER_KEYS" "${SERVER_9_USERNAME}@${SERVER_9}"
         exit;;
      0) # connect to Server 10 as User
        $MAGENTA
        echo "Connecting to $SERVER_10 as '$SERVER_10_USERNAME'"
        $WHITE
        ssh -i "$HOME/.ssh/$SERVER_10_USER_KEYS" "${SERVER_10_USERNAME}@${SERVER_10}"
         exit;;
      10) # echo hello and if option 2 then echo hello2
         echo 'hello'
         exit;;
      c) # connect to server
	echo 'checking your input'
	if [[ ${#} -eq 0 ]]; then
	   echo "0"
	elif [[ ${#} -eq 1 ]]; then
	   echo "1"
	fi
	 exit;;
      e) # edit configuration
	 SERVER_LIST_EDIT_CONFIG
         exit;;
      h) # display Help
         HELP_FUNCTION
         exit;;
      l) # list configuration details
	 echo 'im the view entries function'
#	 VIEW_ENTRIES
#	echo 'im the _ping_servers_all function'
#	_PING_SERVERS_ALL
	echo 'im the ping_servers_quiet_all function'
	_PING_SERVERS_QUIET_ALL
	 exit;;
      r) # view README for full documentation
         VIEW_README
         exit;;
      u) # view useful commands
	 USEFUL_COMMANDS
	 exit;;
      v) # version number
	echo "awesomeness 1.0"
	 exit;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done

################################# initial prompt #################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~MAIN FUNCTION~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function MAIN {
$YELLOW
echo
echo 'What do you want to do?'
$WHITE
PS3='Enter your choice: '
options=("SSH into Server" "View Server Status" "Create SSH Keys" "View Configuration" "Edit Configuration" "SFTP" "Set Cron Job" "Useful Commands" "Edit Server Count" "Help" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "SSH into Server")
        SERVER_LIST
        MAIN
            break
            ;;
        "View Server Status")
        PING_SERVERS
	MAIN
            break
            ;;
	"Create SSH Keys")
	CREATE_KEY
	    break
	    ;;
	"View Configuration")
	VIEW_ENTRIES
	    break
	    ;;
	"Edit Configuration")
	SERVER_LIST_EDIT_CONFIG
	break
	    ;;
	"SFTP")
	FTP_SERVER
	break
	    ;;
        "Set Cron Job")
$YELLOW
	echo
	echo 'Set Cron Job for: '
$WHITE
	PS3='Please enter your choice: '
options=("Server" "Local Machine" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Server")
            echo "you chose choice 1"
            break
            ;;
        "Local Machine")
        echo 'checking if crontab is installed'
        which crontab
        echo 'crontab is installed!!'
        echo 'now do this correctly please'
            break
            ;;
        "Option 3")
            echo "you chose choice $REPLY which is $opt"
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
            ;;
        "Useful Commands")
        USEFUL_COMMANDS
	MAIN
            break
            ;;
	"Edit Server Count")
	#incorrect one (main menu)
	_SED_SERVER_COUNT_
	./server.sh
	    ;;
        "Help")
        HELP_FUNCTION
	MAIN
	    ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
}

################################# Script ########################################

_LOGO_
_CHECK_SERVER_COUNT_
MAIN
