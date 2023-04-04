echo "--- env | grep 'PASSWORD' results:"
env | grep 'PASSWORD'
echo "---"

if [ -n "${OTA_PASSWORD+1}" ]; then
  echo "OTA_PASSWORD is defined"
else
  echo "OTA_PASSWORD is not defined"
fi

env_file=config/secrets.env
env_path=$HOME/$env_file

if [[ -r "$env_path" ]]; then
  echo "$env_file exists and is readable (-r)"
else
  echo "$env_file does not exist and/or is not readable (! -r)"
fi