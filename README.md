# Jail Shells

Various shell scripts to prepare an environment to mainly use `unshare` with `chroot` to create jails for different *nix based OSes.

## Overall Approach
1. Get paths to allowed commands.
1. Copy the commands locally.
1. Copy dependencies for the commands locally.
1. Create any symlinks that might be needed.
1. Depending on OS either:
    1. unshare -r chroot . bin/sh
    1. sudo -r chroot . bin/sh

The primary reason for these scripts was to create shells where users couldn't shoot themselves in the foot when learning to use the CLI. All the scripts are similar and vary depending on the nuances of the target OS and contain comments to reflect that.