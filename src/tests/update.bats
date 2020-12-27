# Runs prior to every test
# setup() {
#     # Load our script file.
#     source ./src/scripts/update.sh
# }
# 
# @test '1: Update test' {
#     # Mock environment variables or functions by exporting them (after the script has been sourced)
#     export PARAM_BUCKET=""
#     export PARAM_OBJECT_PATH=""
#     export PARAM_META_DATAS=""
#     # Capture the output of our "Greet" function
#     result=$(Update)
#     [ "$result" == "" ]
# }