tf-aws-iam-user
----------------

This simple module is designed to:
* create IAM user
* create IAM access and secret key
* attach iam policies to user if specified

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| force_destroy | When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed. | string | `false` | no |
| name | The user's name. The name must consist of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: =,.@-_.. User names are not distinguished by case. For example, you cannot create users named both "TESTUSER" and "testuser". | string | - | yes |
| path | Path in which to create the user. | string | `/` | no |
| pgp_key | Either a base-64 encoded PGP public key, or a keybase username in the form keybase:username. | string | `` | no |
| policy | The policy document. | string | `` | no |
| policy_arns | Policy ARNs to attach. | string | `<list>` | no |
| policy_name | The name of the policy. | string | `` | no |

## Outputs

| Name | Description |
|------|-------------|
| access_key_encrypted_secret | The encrypted secret, base64 encoded. |
| access_key_id | The access key ID. |
| access_key_key_fingerprint | The fingerprint of the PGP key used to encrypt the secret. |
| access_key_ses_smtp_password | The secret access key converted into an SES SMTP password by applying AWS's documented conversion algorithm. |
| access_key_status | "Active" or "Inactive". Keys are initially active, but can be made inactive by other means. |
| user_arn | The ARN assigned by AWS for this user. |
| user_name | The users's name. |
| user_unique_id | The unique ID assigned by AWS. |

Example Usage
----------------

Including an example of how to use this module:

    module "iam_user" {
      source  = "git::https://github.com/michalschott/tf-aws-iam-user.git?ref=master"
      name    = "my_user"
      pgp_key = "keybase:schottmichal"
    }

License
-------

MIT

Author Information
------------------

This role was created in 2017 by [Michal Schott](http://github.com/michalschott).
