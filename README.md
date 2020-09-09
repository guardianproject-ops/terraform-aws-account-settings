<!-- 














  ** DO NOT EDIT THIS FILE
  ** 
  ** This file was automatically generated by the `build-harness`. 
  ** 1) Make all changes to `README.yaml` 
  ** 2) Run `make init` (you only need to do this once)
  ** 3) Run`make readme` to rebuild this file. 
  **
  ** (We maintain HUNDREDS of open source projects. This is how we maintain our sanity.)
  **















  -->

# terraform-aws-account-settings


This is a terraform module that sets opinionated settings on an account wide basis


---


This project is part of the [Guardian Project Ops](https://gitlab.com/guardianproject-ops/) collection.







It's free and open source made available under the the [GNU Affero General Public v3 License](LICENSE.md).





## Introduction

This module:

  * Account wide policy to disable public S3 buckets
  * Configure IAM account alias and pretty login URL
  * Account password policy
  * Log bucket suitable for receiving logs from other AWS services such as S3, CloudFront
  * CloudTrail setup across all regions



## Usage


**IMPORTANT:** The `master` branch is used in `source` just as an example. In your code, do not pin to `master` because there may be breaking changes between releases.
Instead pin to the release tag (e.g. `?ref=tags/x.y.z`) of one of our [latest releases](https://gitlab.com/guardianproject-ops/terraform-aws-account-settings/releases).



The tag below is not up to date. Check the repo for the latest version.

It is recommended that the s3 bucket be created in a separate audit account.

```hcl
module "account_settings" {
  source  = "git::https://gitlab.com/guardianproject-ops/terraform-aws-account-settings?ref=tags/0.1.0"
  context = module.this.context
  cloudtrail_s3_bucket_name = module.cloudtrail_s3_bucket.bucket_id
}
```






## Providers

| Name | Version |
|------|---------|
| aws | >= 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| additional\_tag\_map | Additional tags for appending to tags\_as\_list\_of\_maps. Not added to `tags`. | `map(string)` | `{}` | no |
| allow\_users\_to\_change\_password | Whether to allow users to change their own password | `bool` | `true` | no |
| attributes | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| cloudtrail\_bucket\_id | S3 bucket name for cloudtrail logs | `string` | n/a | yes |
| cloudtrail\_enabled | Specifies whether to create the mutlri-region cloudtrail | `bool` | `true` | no |
| context | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | <pre>object({<br>    enabled             = bool<br>    namespace           = string<br>    environment         = string<br>    stage               = string<br>    name                = string<br>    delimiter           = string<br>    attributes          = list(string)<br>    tags                = map(string)<br>    additional_tag_map  = map(string)<br>    regex_replace_chars = string<br>    label_order         = list(string)<br>    id_length_limit     = number<br>  })</pre> | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_order": [],<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {}<br>}</pre> | no |
| delimiter | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes`.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | n/a | yes |
| enabled | Set to false to prevent the module from creating any resources | `bool` | n/a | yes |
| environment | Environment, e.g. 'uw2', 'us-west-2', OR 'prod', 'staging', 'dev', 'UAT' | `string` | n/a | yes |
| hard\_expiry | Whether users are prevented from setting a new password after their password has expired (i.e. require administrator reset) | `bool` | `false` | no |
| id\_length\_limit | Limit `id` to this many characters.<br>Set to `0` for unlimited length.<br>Set to `null` for default, which is `0`.<br>Does not affect `id_full`. | `number` | n/a | yes |
| label\_order | The naming order of the id output and Name tag.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 5 elements, but at least one must be present. | `list(string)` | n/a | yes |
| log\_expiration\_days | Number of days after which to expunge the objects from the log bucket | `number` | `90` | no |
| max\_password\_age | The number of days that a user's password is valid | `number` | `0` | no |
| minimum\_password\_length | Minimum length to require for user passwords | `number` | `8` | no |
| name | Solution name, e.g. 'app' or 'jenkins' | `string` | n/a | yes |
| namespace | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | n/a | yes |
| password\_policy\_enabled | Whether or not to create the IAM account password policy | `bool` | `true` | no |
| password\_reuse\_prevention | The number of previous passwords that users are prevented from reusing | `bool` | `true` | no |
| regex\_replace\_chars | Regex to replace chars with empty string in `namespace`, `environment`, `stage` and `name`.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | n/a | yes |
| require\_lowercase\_characters | Whether to require lowercase characters for user passwords | `bool` | `true` | no |
| require\_numbers | Whether to require numbers for user passwords | `bool` | `true` | no |
| require\_symbols | Whether to require symbols for user passwords | `bool` | `true` | no |
| require\_uppercase\_characters | Whether to require uppercase characters for user passwords | `bool` | `true` | no |
| stage | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | n/a | yes |
| tags | Additional tags (e.g. `map('BusinessUnit','XYZ')` | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| account\_alias | IAM account alias |
| cloudtrail | n/a |
| log\_bucket | n/a |
| minimum\_password\_length | IAM account minimum password length |
| signin\_url | IAM users sign-in URL |




## Share the Love 

Like this project? Please give it a ★ on [GitLab](https://gitlab.com/guardianproject-ops/terraform-aws-account-settings)

Are you using this project or any of our other projects? Let us know at [@guardianproject][twitter] or [email us directly][email]


## Related Projects

Check out these related projects.

- [terraform-aws-cloudtrail-s3-bucket](https://github.com/cloudposse/terraform-aws-cloudtrail-s3-bucket) - S3 bucket with built in IAM policy to allow CloudTrail logs




## Help

File an [issue](https://gitlab.com/guardianproject-ops/terraform-aws-account-settings/issues), send us an [email][email] or join us in the Matrix 'verse at [#guardianproject:matrix.org][matrix] or IRC at `#guardianproject` on Freenode.

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://gitlab.com/guardianproject-ops/terraform-aws-account-settings/issues) to report any bugs or file feature requests.

### Developing

If you are interested in becoming a contributor, want to get involved in
developing this project, other projects, or want to [join our team][join], we
would love to hear from you! Shoot us an [email][join-email].

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

 1. **Fork** the repo on GitLab
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Merge Request** so that we can review your changes

**NOTE:** Be sure to merge the latest changes from "upstream" before making a pull request!

## Credits & License 


Copyright © 2017-2020 [Guardian Project][website]












[![License: AGPL v3](https://img.shields.io/badge/License-AGPL%20v3-blue.svg)](https://www.gnu.org/licenses/agpl-3.0.en.html)

    GNU AFFERO GENERAL PUBLIC LICENSE
    Version 3, 19 November 2007

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as
    published by the Free Software Foundation, either version 3 of the
    License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.


See [LICENSE.md](LICENSE.md) for full details.

## Trademarks

All other trademarks referenced herein are the property of their respective owners.

## About

**This project is maintained and funded by [The Guardian Project][website].**

[<img src="https://gitlab.com/guardianproject/guardianprojectpublic/-/raw/master/Graphics/GuardianProject/pngs/logo-black-w256.png"/>][website]

We're a [collective of designers and developers][website] focused on useable
privacy and security. Everything we do is 100% FOSS. Check out out other [ops
projects][gitlab] and [non-ops projects][nonops], follow us on
[mastadon][mastadon] or [twitter][twitter], [apply for a job][join], or
[partner with us][partner].







### Contributors

|  [![Abel Luck][abelxluck_avatar]][abelxluck_homepage]<br/>[Abel Luck][abelxluck_homepage] |
|---|

  [abelxluck_homepage]: https://gitlab.com/abelxluck

  [abelxluck_avatar]: https://secure.gravatar.com/avatar/0f605397e0ead93a68e1be26dc26481a?s=100&amp;d=identicon





[logo-square]: https://assets.gitlab-static.net/uploads/-/system/group/avatar/3262938/guardianproject.png?width=88
[logo]: https://guardianproject.info/GP_Logo_with_text.png
[join]: https://guardianproject.info/contact/join/
[website]: https://guardianproject.info
[cdr]: https://digiresilience.org
[cdr-tech]: https://digiresilience.org/tech/
[matrix]: https://riot.im/app/#/room/#guardianproject:matrix.org
[join-email]: mailto:jobs@guardianproject.info
[email]: mailto:support@guardianproject.info
[cdr-email]: mailto:info@digiresilience.org
[twitter]: https://twitter.com/guardianproject
[mastadon]: https://social.librem.one/@guardianproject
[gitlab]: https://gitlab.com/guardianproject-ops
[nonops]: https://gitlab.com/guardianproject
[partner]: https://guardianproject.info/how-you-can-work-with-us/