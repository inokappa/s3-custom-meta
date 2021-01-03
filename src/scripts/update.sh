Update() {
  # aws s3api copy-object \
  #   --bucket "${PARAM_BUCKET}" \
  #   --copy-source "${PARAM_BUCKET}/${PARAM_OBJECT_PATH}" \
  #   --key "${PARAM_OBJECT_PATH}" \
  #   --metadata-directive REPLACE \
  #   --metadata "${PARAM_META_DATAS}" 
  aws s3api copy-object \
    --bucket example.bucket.com \
    --copy-source example.bucket.com/path/to/object \
    --key /path/to/object \
    --metadata-directive REPLACE \
    --metadata "{\"foo\": 1, \"bar\": 2}"
}

# Will not run if sourced for bats-core tests.
# View src/tests for more information.
ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    Update
fi
