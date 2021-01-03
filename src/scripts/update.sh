Update() {
  if [ -n "${PARAM_ENDPOINT}" ];then
    aws --endpoint-url "${PARAM_ENDPOINT}" s3api copy-object \
      --bucket "${PARAM_BUCKET}" \
      --copy-source "${PARAM_BUCKET}/${PARAM_OBJECT_PATH}" \
      --key "${PARAM_OBJECT_PATH}" \
      --metadata-directive REPLACE \
      --metadata "${PARAM_META_DATAS}" 
  else
    aws s3api copy-object \
      --bucket "${PARAM_BUCKET}" \
      --copy-source "${PARAM_BUCKET}/${PARAM_OBJECT_PATH}" \
      --key "${PARAM_OBJECT_PATH}" \
      --metadata-directive REPLACE \
      --metadata "${PARAM_META_DATAS}" 
  fi
}

# Will not run if sourced for bats-core tests.
# View src/tests for more information.
ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    Update
fi
