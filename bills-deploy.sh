#!/bin/bash
############################
# This script deploy wars and ears files to jboss
# Usefull commands:
# 1) example update enviroment for some module:
# java -jar ./jboss-cli-client.jar --controller=localhost:9999 -c --file=./hcsejenv.cli --properties=./hcsejenv.props --user=jboss --password=jboss_123
############################

########## Variables
# ear files
ear_files="service-impl/bills-service/build/libs/bills-service-ear.ear \
	service-impl/agreements-service/build/libs/agreements-service-ear.ear \
	service-impl/home-management-service/build/libs/home-management-service-ear.ear \
	service-impl/int-bus-bills-service/build/libs/int-bus-bills-service-ear.ear \
	service-impl/int-bus-agreements-service/build/libs/int-bus-agreements-service-ear.ear \
	service-impl/int-bus-organization-registry-service/build/libs/int-bus-organization-registry-service-ear.ear \
	service-impl/int-bus-ppa-service/build/libs/int-bus-ppa-service-ear.ear \
	service-impl/metrics-service/build/libs/metrics-service-ear.ear \
	service-impl/nsi-service/build/libs/nsi-service-ear.ear \
	service-impl/org-nsi-service/build/libs/org-nsi-service-ear.ear \
	service-impl/ppa-service/build/libs/ppa-service-ear.ear \
	service-impl/int-bus-home-management-service/build/libs/int-bus-home-management-service-ear.ear \
	service-impl/person-registry-service/build/libs/person-registry-service-ear.ear \
	service-impl/int-bus-person-registry-service/build/libs/int-bus-person-registry-service-ear.ear \
	service-impl/rosreestr-service/build/libs/rosreestr-service-ear.ear \
	service-impl/organization-registry-service/build/libs/organization-registry-service-ear.ear \
	service-impl/int-bus-nsi-service/build/libs/int-bus-nsi-service-ear.ear \
	service-impl/filestore-service/build/libs/filestore-service-ear.ear \
	service-impl/int-bus-nsi-service/build/libs/int-bus-nsi-service-ear.ear \
	service-impl/int-bus-capital-repair-programs-service/build/libs/int-bus-capital-repair-programs-service-ear.ear \
	service-impl/capital-repair-programs-service/build/libs/capital-repair-programs-service-ear.ear \
	service-impl/indices-service/build/libs/indices-service-ear.ear \
	service-impl/int-bus-indices-service/build/libs/int-bus-indices-service-ear.ear \
	service-impl/int-bus-org-nsi-service/build/libs/int-bus-org-nsi-service-ear.ear \
	service-impl/licenses-service/build/libs/licenses-service-ear.ear \
	service-impl/int-bus-licenses-service/build/libs/int-bus-licenses-service-ear.ear \
	service-impl/int-bus-event-journal-service/build/libs/int-bus-event-journal-service-ear.ear \
	service-impl/event-journal-service/build/libs/event-journal-service-ear.ear \
	service-impl/int-bus-filestore-service/build/libs/int-bus-filestore-service-ear.ear"    

war_files="web/rest/bills-rest/build/libs/bills.war \
	web/rest/home-management-rest/build/libs/homemanagement.war \
	web/rest/ppa-auth-rest/build/libs/auth.war \
	web/rest/ppa-rest/build/libs/ppa.war \
	web/rest/person-registry-rest/build/libs/personregistry.war \
	web/rest/nsi-rest/build/libs/nsi.war \
	web/rest/organization-registry-rest/build/libs/organizationregistry.war \
	web/rest/agreements-rest/build/libs/agreements.war \
	web/rest/ext-ppa-rest/build/libs/ext-ppa.war \
	web/sp-web/build/libs/sp-web.war \
	web/rest/capital-repair-programs-rest/build/libs/capital-repair-programs.war \
	web/rest/org-nsi-rest/build/libs/orgnsi.war \
	web/rest/filestore-rest/build/libs/filestore.war"    

jboss_management_addr="localhost:9999"
jboss_user="jboss"
jboss_password="jboss_123"

deploy_dir="/home/$USER/Downloads"

RED='\033[0;31m'
NC='\033[0m' # No Color

##########
all_files=""
if [ -z "$1" ]; then
	all_files=$ear_files
	all_files+=" "
	all_files+=$war_files
else
	echo "use files from argument"
	for var in "$@"
	do
		echo "$var"
		all_files+=$var
		all_files+=" "
	done
fi

# deploy
echo "start deploy"
errors_arr=()
for file in $all_files; do
	echo 
    echo "********** deploy: '$file'"
    cp -v $file $deploy_dir/
	if [ $? -ne 0 ]; then
		errors_arr+=$file
		echo -e "${RED}$file${NC} failed copy"
		break
	fi

	filename=$(basename $file)
	deploy_file=$deploy_dir/$filename
	java -jar ./deployment/cliclient/jboss-cli-client.jar --controller=$jboss_management_addr -c --commands="\
		deploy --force $deploy_file" --user=$jboss_user --password=$jboss_password
	if [ $? -eq 0 ]; then
		echo "successed deploy '$file'"
	else
		errors_arr+=($file)
		echo -e "${RED}$file${NC} failed deploy"
	fi
done

if [ ${#errors_arr[*]} -eq 0 ]; then
	echo "all files deployed success"
else
	echo "not deployed files:"
	for item in ${errors_arr[*]}
   	do
		echo -e "${RED}$item${NC}"
	done
fi

echo "done"
