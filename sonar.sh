#!/usr/bin/env bash

export sk__sonar_dir=$(readlink -f "$(dirname "${BASH_SOURCE[0]}")")
if [ ${SK_EXP__SONAR__TOKEN} ]; then
  mvn sonar:sonar -Dsonar.host.url=http://sonar.shaneking.org -Dsonar.login=${SK_EXP__SONAR__TOKEN}
  sk_modules=("org.shaneking.ling" "org.shaneking.roc" "org.shaneking.leon" "org.shaneking.sunny")
  for sk_module in ${sk_modules[@]}; do
    if [ -f ${sk__sonar_dir}/../${sk_module}/sonar.sh ]; then
      ### the cd is must in context
      cd ${sk__sonar_dir}/../${sk_module}
      source ${sk__sonar_dir}/../${sk_module}/sonar.sh
    else
      echo "${sk__sonar_dir}/../${sk_module}/sonar.sh not exist."
    fi
  done
else
  echo 'SK_EXP__SONAR__TOKEN not exist.'
fi
cd ${sk__sonar_dir}
