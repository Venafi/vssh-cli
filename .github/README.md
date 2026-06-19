<!-- HEADER BEGIN-->
<picture>
  <!-- Dark-mode logo -->
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Venafi/vssh-cli/master/.github/images/panw-logo-dark-bg.png">
  <!-- Light-mode fallback -->
  <img alt="Palo Alto Networks" src="https://raw.githubusercontent.com/Venafi/vssh-cli/master/.github/images/panw-logo-light-bg.svg" width="200" height="auto">
</picture>
<br />
<br />

[![Apache 2.0 License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
![Community Supported](https://img.shields.io/badge/Support%20Level-Community-brightgreen)
![Compatible with TPP 21.4+](https://img.shields.io/badge/Compatibility-TPP%2021.4+-f9a90c)  
_To report a problem or share an idea, use **[Issues](../../../issues)**; and if you have a suggestion for fixing the issue, please include those details, too._
<!-- HEADER END-->

# vSSH CLI
vSSH CLI is a command line utility designed to simplify generation and enrollment of machine identities for SSH access. System administrators can enroll SSH certificates from [Palo Alto Networks SSH Manager](https://www.cyberark.com/products/ssh-manager-for-machines/) and use them to connect to their infrastructure. vSSH CLI can be used to enroll SSH certificates for applications and hosts.

## Compatibility
vSSH CLI releases are tested using the latest version of [Palo Alto Networks SSH Manager](https://www.cyberark.com/products/ssh-manager-for-machines/).  General functionality of the
[latest vSSH CLI release](../releases/latest) should be compatible with SSH Manager 21.4 or higher.

## Links
Use these to quickly jump to a relevant section:
- Installation of vSSH CLI
    - [Installing or updating to the latest version](../../../wiki/Installing-or-updating-to-the-latest-version)
    - [Adding vSSH CLI to your OS path](../../../wiki/Adding-the-vSSH-CLI-to-your-path)
- Initial configuration
    - [Prerequisites to use vSSH CLI with SSH Manager](../../../wiki/Prerequisites-to-use-vSSH-CLI-with-Venafi-SSH-Protect)
    - [Working with configuration profiles](../../../wiki/Working-with-configuration-profiles)
    - [Start OpenSSH authentication agent](../../../wiki/OpenSSH-authentication-agent)
    - [Configure OpenSSH server on your hosts to allow client authentication](../../../wiki/Configure-OpenSSH-server-for-client-authentication)
- Using the vSSH CLI
    - [Command line options](../../../wiki/Command-line-options)
    - [Command reference](../../../wiki/Command-reference)
    - [Understanding the return codes from the vSSH CLI](../../../wiki/Understanding-return-codes-from-the-vSSH-CLI)
 - Tutorials of using vSSH CLI with SSH Manager
    - [Interactive logins to remote hosts using the `login` command](../../../wiki/Enrolling-SSH-certificates-for-interactive-logins-to-remote-hosts)
    - [Enrolling SSH certificates for applications or hosts using the `certificate enroll` command](../../../wiki/Enrolling-an-SSH-certificate-for-an-application-or-host)
    - [Renewing SSH certificates using the `certificate renew` command](../../../wiki/Renewing-an-SSH-certificate)

## Installation
Download the appropriate archive from the latest release and extract it manually.

- [Linux x64 (zip)](../../../releases/latest/download/vssh_linux_amd64.zip)
- [Linux ARM64 (zip)](../../../releases/latest/download/vssh_linux_arm64.zip)
- [macOS x64 (zip)](../../../releases/latest/download/vssh_darwin_amd64.zip)
- [macOS ARM64 (zip)](../../../releases/latest/download/vssh_darwin_arm64.zip)
- [Windows x64 (zip)](../../../releases/latest/download/vssh_windows_amd64.zip)
- [Windows x86 (zip)](../../../releases/latest/download/vssh_windows_386.zip)

## Short usage examples
The examples bellow applies to the latest version of vSSH CLI.

### Example 1: Enrolling an SSH certificate for interactive logins to remote hosts
1. Create a configuration profile in vSSH CLI, so that you can use vSSH CLI without passing any parameters to the `vssh` command.
```bash
user@workstation:~$ vssh profile configure --url tpp.example.com --user alice --template-login "Users - Web Admins"
? Profile name: default
? Service URL: tpp.example.com
? Username for authentication: alice
? [Login Operation] Template name: Users - ENG Admins
? [Enroll Operation] Template name: 
? Do you want to configure more settings? No
? Do you want to save the configuration (as 'default')? Yes
  Configuration profile 'default' was successfully saved.
```

2. Enroll an SSH certificate for interactive logins. Before you perform the step below you need to complete the [prerequisites to use vSSH CLI with SSH Manager](../../../wiki/Prerequisites-to-use-vSSH-CLI-with-Venafi-SSH-Protect)
```bash
user@workstation:~$ vssh login
  Logging in as alice...              
? Enter password for user alice: [? for help] ************
  Authenticating...
  Logged in as alice                            
  One template (Users - Web Admins) found. Using it.    
  Your identity is alice            
  Your role is Users - Web Admins (expires in 12 hours) 
  Credentials have been added to your OpenSSH agent. 
  Now you can perform SSH logins to remote servers.
```

3. Open an interactive SSH session to a remote host.
```bash
user@workstation:~$ ssh alice@web.example.com
Linux web.example.com 5.10.0-10-amd64

You have new mail.
Last login: Tue May 17 13:20:12 2022 from 172.17.254.151

alice@web:~$ 
```

## License

Copyright &copy; 2026 Palo Alto Networks, Inc. All rights reserved.

vSSH CLI is licensed under the Apache License, Version 2.0. See `LICENSE` for the full license text.

Please direct questions/comments to security@venafi.com.
