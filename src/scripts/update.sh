Update() {
  echo "${PARAM_ENDPOINT}"
  OPTIONS=""
  if [ -n "${PARAM_ENDPOINT}" ];then
    OPTIONS="--endpoint-url ${PARAM_ENDPOINT}"
  fi

  echo "${OPTIONS}"
  aws --debug "${OPTIONS}" s3api copy-object \
    --bucket "${PARAM_BUCKET}" \
    --copy-source "${PARAM_BUCKET}/${PARAM_OBJECT_PATH}" \
    --key "${PARAM_OBJECT_PATH}" \
    --metadata-directive REPLACE \
    --metadata "${PARAM_META_DATAS}" 
}

# Will not run if sourced for bats-core tests.
# View src/tests for more information.
ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    Update
fi
