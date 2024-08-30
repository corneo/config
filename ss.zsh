echo "--- env | grep '_PASSWORD' results:"
env | grep '_PASSWORD'
echo "---"

env_file=config/secrets.env
env_path=$HOME/$env_file

if [[ -r "$env_path" ]]; then
  echo "$env_file exists and is readable (-r)"
  echo "--- $env_path file contents:"
  cat $env_path
  echo "---"
else
  echo "$env_file does not exist and/or is not readable (! -r)"
fi
