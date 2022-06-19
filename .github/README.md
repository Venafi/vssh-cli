<!-- HEADER BEGIN-->
<img src="https://raw.githubusercontent.com/Venafi/vssh-cli/master/.github/images/Venafi_LOGO_OrangeWhite_rgb_f.svg#gh-dark-mode-only" width="200px">
<img src="https://raw.githubusercontent.com/Venafi/vssh-cli/master/.github/images/Venafi_LOGO_OrangeIndigo_rgb_f.svg#gh-light-mode-only" width="200px">

[![Apache 2.0 License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
![Community Supported](https://img.shields.io/badge/Support%20Level-Community-brightgreen)
![Compatible with TPP 21.4+](https://img.shields.io/badge/Compatibility-TPP%2021.4+-f9a90c)  
_To report a problem or share an idea, use **[Issues](../../issues)**; and if you have a suggestion for fixing the issue, please include those details, too.
Got questions or want to discuss something with our team? **[Join us on Slack](https://join.slack.com/t/venafi-integrations/shared_invite/zt-i8fwc379-kDJlmzU8OiIQOJFSwiA~dg)**!_
<!-- HEADER END-->

# vSSH CLI
vSSH CLI is a command line utility designed to simplify generation and enrollment of machine identities for SSH access. System administrators can enroll SSH certificates from Venafi SSH Protect and use them to connect to their infrastructure. vSSH CLI can be used to enroll SSH certificates for applications and hosts.

## Compatibility
vSSH CLI releases are tested using the latest version of [Venafi SSH Protect](https://www.venafi.com/platform/ssh-protect).  General functionality of the
[latest vSSH CLI release](../releases/latest) should be compatible with Venafi SSH Protect 21.4 or higher.

## Links
Use these to quickly jump to a relevant section:
- Installation of vSSH CLI
    - [Installing or updating to the latest version](../../../wiki/Installing-or-updating-to-the-latest-version)
    - [Adding vSSH CLI to your OS path](../../../wiki/Adding-the-vSSH-CLI-to-your-path)
- Initial configuration
    - [Prerequisites to use vSSH CLI with Venafi SSH Protect](../../../wiki/Prerequisites-to-use-vSSH-CLI-with-Venafi-SSH-Protect)
    - [Working with configuration profiles](../../../wiki/Working-with-configuration-profiles)
    - [Start OpenSSH authentication agent](../../../wiki/OpenSSH-authentication-agent)
    - [Configure OpenSSH server on your hosts to allow client authentication](../../../wiki/Configure-OpenSSH-server-for-client-authentication)
- Using the vSSH CLI
    - [Command line options](../../../wiki/Command-line-options)
    - [Command reference](../../../wiki/Command-reference)
    - [Understanding the return codes from the vSSH CLI](../../../wiki/Understanding-return-codes-from-the-vSSH-CLI)
 - Tutorials of using vSSH CLI with Venafi SSH Protect
    - [Interactive logins to remote hosts using the `login` command](../../../wiki/Enrolling-SSH-certificates-for-interactive-logins-to-remote-hosts)
    - [Enrolling SSH certificates for applications or hosts using the `certificate enroll` command](../../../wiki/Enrolling-an-SSH-certificate-for-an-application-or-host)
    - [Renewing SSH certificates using the `certificate renew` command](../../../wiki/Renewing-an-SSH-certificate)

## Short usage examples
The examples bellow applies to the latest version of vSSH CLI, which you can [download here](../../../releases/latest).

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

2. Enroll an SSH certificate for interactive logins. Before you perform the step below you need to complete the [prerequisites to use vSSH CLI with Venafi SSH Protect](../../../wiki/Prerequisites-to-use-vSSH-CLI-with-Venafi-SSH-Protect)
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

Copyright &copy; Venafi, Inc. All rights reserved.

vSSH CLI is licensed under the Apache License, Version 2.0. See `LICENSE` for the full license text.

Please direct questions/comments to opensource@venafi.com.