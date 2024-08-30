# Intent

This repository is intended to build a 'secrets.env' file for subsequent loading into the environment (env) as necessary.

Typically things like passwords and WiFi SSID's are contained in the file.

The secrets.tpl file contains the 'template' used to create the secrets.env file.
The 1Password CLI command "op" is used to extract the 'secrets'.
The secrets.zsh shell script does the work, using secrets.tpl as input to
create secrets.env.

TODO: consider changing the name of the folder that contins the files to some
'.hidden' name. It would be nice if the shell script allowed this name to be specified.
It should probably also allow for the specification of the path and name of the env
file it creates. E.g. it could be used to generate a 'secrets.h' file.

This was motivated by a desire to be more consistent with how I manage secrets. I woulld
like to do more but... well... when I need it to do more I'll consider making it do more.

Feel free, of course, to fork or clone this and use it as you see fit. If you make
change you believe
would be useful to others (or myself), please create a pull request. As I type this I
have not been on either side of a pull request so I would need to learn about that;
I would like to learn about it so please give it a go.
