#!/bin/bash
if [ -z "${PG_PASS}" ]
then
  echo "You need to set PG_PASS environment variable to run this script"
  exit 1
fi

GHA2DB_PROJECTS_YAML="cdf/projects.yaml" ONLY="spinnaker tekton jenkinsx cdevents ortelius" ./devel/all_affs.sh || exit 2
GHA2DB_PROJECTS_YAML="cdf_projects.yaml" GHA2DB_RECENT_RANGE="4 hours" GHA2DB_TMOFFSET="-4" devstats

GHA2DB_PROJECTS_YAML="cdf/projects.yaml" ONLY="jenkins pyrsia screwdrivercd shipwright allcdf" ./devel/all_affs.sh || exit 3
GHA2DB_PROJECTS_YAML="cdf_projects.yaml" GHA2DB_RECENT_RANGE="4 hours" GHA2DB_TMOFFSET="-4" devstats

./devel/columns_all.sh
