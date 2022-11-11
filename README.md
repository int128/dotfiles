# dotfiles [![build](https://github.com/int128/dotfiles/actions/workflows/build.yaml/badge.svg)](https://github.com/int128/dotfiles/actions/workflows/build.yaml)

This is a dotfiles of my environment.

## Getting Started

```sh
# Clone the repository
git clone https://github.com/int128/dotfiles.git

# Run the installation script
./dotfiles/install
```

It supports the following platforms:

- [macOS](macos)
- [Google Cloud Shell](cloudshell)
- [Windows Subsystem for Linux (WSL)](wsl)

You can put environment specific configuration to `.zshrc.local`.
For example,

```zsh
echo enable_proxy >> .zshrc.local
```

### AWS access

Set up your `.aws/config` for AWS SSO.

```ini
[profile PROFILE]
region = ap-northeast-1
sso_start_url = https://SPACE.awsapps.com/start
sso_region = ap-northeast-1
sso_account_id = NUMBER
sso_role_name = AdministratorAccess
```

For [SSH connections through Session Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-getting-started-enable-ssh-connections.html), set up your `.ssh/config`.

```
host i-* mi-*
  ProxyCommand sh -c "aws ssm start-session --target %h --document-name AWS-StartSSHSession --parameters 'portNumber=%p'"
  User ssm-user
  ServerAliveInterval 60
```

## Sandbox

To run an ephemeral pod:

```sh
k run --rm -it --image ghcr.io/int128/dotfiles:main int128-sandbox
```
