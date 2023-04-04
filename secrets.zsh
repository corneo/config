#/usr/bin/zsh
#
# Load secret environment variables if it appears they do not exist
#
sev_dir=config
sev_dir_path=$HOME/$sev_dir
file_root=$sev_dir/secrets
tpl_file=$file_root.tpl
tpl_path=$HOME/$tpl_file
env_file=$file_root.env
env_path=$HOME/$env_file

if ! test -r "$env_path" ; then
  # See if the SEV template file (~/.secrets.tpl) exists. If so, use it to
  # create the .env file with the help of the 1Password command line
  # interface (CLI) command, "op inject ...".  When that command is invoked
  # 1Pasword will authenticate the user executing this script.  See the
  # 1Passwword online documentation for information about the various ways
  # that authentication process can be implemented.  (I set up 1Password on
  # my mac to authenticate with touch-ID.  One of the two main motivations
  # for creating this script was to minimize how often that happens.  The
  # other was to avoid the inherent delay introduced by doing ao.)
  #
  # Make sure .secrets.tpl exists.
  if test -r "$tpl_path"; then
    # The template file eists so let's do this thing..
    echo "Creating $env_path"
    touch $env_path
    grep -v '^###' <$tpl_path |
      op inject -o $env_path --force >/dev/null ||
      echo "Error: Failure during creation of $env_file."
    chmod 700 $env_path
    ls -l $env_path
    else
    # The template file does not exist or can't be read.
    echo "Error: The .secrets.zsh script could not find $tpl_path"
    echo "Secret environment variables file cannot be created."
  fi

  # For some reason I do not understand, environment variables
  # loaded by this script, well, they're not.  It works if they'rr
  # loaded by .zprofile so it is done there after invoking this
  # script.  Hence the following lines have been commented out
  #
  # # Load the secret environment variables from .secrets.env
  # if test -r "$env_path"; then
  #   echo "Loading secrets from $env_path"
  #   . $env_path
  # else
  #   echo "File $env_path does not exist." 
  #   echo "Secret environment will not be (re)loaded."
  # fi

fi
