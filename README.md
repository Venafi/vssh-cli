[![Venafi](https://github.com/Venafi/vcert/raw/master/.github/images/Venafi_logo.png)](https://www.venafi.com/)
[![Apache 2.0 License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
![Community Supported](https://img.shields.io/badge/Support%20Level-Community-brightgreen)
![Compatible with TPP 21.4+](https://img.shields.io/badge/Compatibility-TPP%2021.4+-f9a90c)  
_**This open source project is community-supported.** To report a problem or share an idea, use
**[Issues](../../issues)**; and if you have a suggestion for fixing the issue, please include those details, too.
In addition, use **[Pull Requests](../../pulls)** to contribute actual bug fixes or proposed enhancements.
We welcome and appreciate all contributions. Got questions or want to discuss something with our team?
**[Join us on Slack](https://join.slack.com/t/venafi-integrations/shared_invite/zt-i8fwc379-kDJlmzU8OiIQOJFSwiA~dg)**!_

# vSSH CLI

vSSH CLI is a command line utility designed to simplify generation and enrollment of machine identities for SSH access. System administrators can enroll SSH certificates from Venafi SSH Protect and use them to connect to their infrastructure. vSSH CLI can be used to enroll SSH certificates for applications and hosts.

## Compatibility
vSSH CLI releases are tested using the latest version of [Venafi SSH Protect](https://www.venafi.com/platform/ssh-protect).  General functionality of the
[latest vSSH CLI release](../../releases/latest) should be compatible with Venafi SSH Protect 21.4 or higher.

## Prerequisites for using vSSH CLI with Venafi SSH Protect

1. A user account that has been granted to acquire an authentication tokens for WebSDK access with "ssh:manage" scope
2. Properly configured SSH certificate issuance template in Venafi SSH Protect:
    1. Issuance restrictions applied to the template compliant with the organizational policies
    2. Permissions (View & Create) to the template set to allow only desired users and groups to use it
    3. When you want to use vSSH CLI to get credentials for interactive SSH access (i.e.Login operation) you need to configure the template with the following:
        1. The default values of all certificate fields are set to be automatically populated by Venafi SSH Protect
        2. Allow API clients to receive issued certificates in response to their enrollment requests


## Usage examples

Venafi vSSH CLI is a command line utility designed to simplify generation and enrollment of SSH machine identities, eliminating the need to write code that's required to interact with the Venafi REST API. vSSH CLI is available in 32- and 64-bit versions for Linux, Windows, and macOS.

This article applies to the latest version of vSSH CLI, which you can [download here](../../releases/latest).

### Quick Links

Use these to quickly jump to a relevant section lower on this page:

- [Options for enrolling an SSH certificate for interactive login to remote hosts using the `login` command](#enrolling-an-ssh-certificate-for-interactive-login-to-remote-hosts)
- [Options for enrolling an SSH certificate for an application or host from Venafi SSH Protect using the `certificate enroll` command](#enrolling-an-ssh-certificate-for-an-application-or-host)
- [Options for renewing a certificate from Venafi SSH Protect using the `certificate renew` command](#renewing-an-ssh-certificate)


### General Command Line Parameters

The following options apply to the `login`, `certificate enroll`, `certificate renew`, and `service ca retrieve` actions:

| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description                                                  |
| ------------------- | ------------------------------------------------------------ |
| `-p`, `--profile`   | Use to specify the name of the configuration profile to use. Configuration profiles can contain connection information. the name of the configuration profile to use. You can use the command `vssh profile list` to list all available profiles.|
| `-u`, `--url`       | URL of the Venafi SSH Protect API service.<br/>Example: `--url https://tpp.venafi.example.com ` |
| `--no-prompt`       | Use to disable user prompts. If you disable the prompts and you enter incorrect information, an error is displayed.  This option is useful with scripting. |
| `--user`            | Use to specify username required to authenticate to Venafi SSH Protect. If not specified, the current user name is used |
| `--client-id`       | Use to specify Client ID to be used for authentication to Venafi SSH Protect. Default is `vssh-cli`. |
| `--scope`           | Use to specify the scope which will be used when requesting a token from Venafi SSH Protect. Default is `ssh:manage` |
| `-t`, `--token`     | Use to specify an authorization token to be used instead of username and password for authentication to Venafi SSH Protect. This option is useful with scripting. |
| `-a`, `--auth`        |  Use to specify method to be used for authentication to Venafi SSH Protect. You can specify 'auto', 'userpass, or 'browser'. |
| `--ca-cert`    | Use to specify a file with PEM formatted certificates to be used as trust anchors when communicating with Venafi SSH Protect. If not specified, the system CA certificates are used.<br/>Example: `--ca-cert /path-to/bundle.pem` |
| `--ca-dir`    | Use to specify a directory with with PEM formatted certificates to be used as trust anchors when communicating with Venafi SSH Protect. If not specified, the system CA certificates are used.<br/>Example: `--ca-dir /path-to/my-ca/` |

### Environment Variables

As an alternative to passing parameters you can use environment variables. You have to use prefix `VSSH_` and the name of the parameter that you want to specify. Examples `VSSH_PROFILE`, `VSSH_URL`, `VSSH_TEMPLATE`, etc.

## Enrolling an SSH certificate for interactive login to remote hosts
```
vssh login --user alice --url https://tpp.venafi.example.com
```

## Enrolling an SSH certificate for an application or host
```
vssh certificate enroll --url https://tpp.venafi.example.com --principal srv-account1,srv-account2
```
## Renewing an SSH certificate
```
vssh certificate renew --file /etc/ssh/ssh_host_ed25519_key-cert.pub --expires-in 30d
```

## License

Copyright &copy; Venafi, Inc. All rights reserved.

vSSH CLI is licensed under the Apache License, Version 2.0. See `LICENSE` for the full license text.

Please direct questions/comments to opensource@venafi.com.