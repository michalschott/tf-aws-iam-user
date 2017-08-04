variable "name" {
  description = "The user's name. The name must consist of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: =,.@-_.. User names are not distinguished by case. For example, you cannot create users named both \"TESTUSER\" and \"testuser\"."
}

variable "path" {
  description = "Path in which to create the user."
  default     = "/"
}

variable "force_destroy" {
  description = "When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed."
  default     = false
}

variable "pgp_key" {
  description = "Either a base-64 encoded PGP public key, or a keybase username in the form keybase:username."
}

output "user_arn" {
  value       = "${aws_iam_user.user.arn}"
  description = "The ARN assigned by AWS for this user."
}

output "user_name" {
  value       = "${aws_iam_user.user.name}"
  description = "The users's name."
}

output "user_unique_id" {
  value       = "${aws_iam_user.user.unique_id}"
  description = "The unique ID assigned by AWS."
}

output "access_key_id" {
  value       = "${aws_iam_access_key.user.id}"
  description = "The access key ID."
}

output "access_key_key_fingerprint" {
  value       = "${aws_iam_access_key.user.key_fingerprint}"
  description = "The fingerprint of the PGP key used to encrypt the secret."
}

output "access_key_encrypted_secret" {
  value       = "${aws_iam_access_key.user.encrypted_secret}"
  description = "The encrypted secret, base64 encoded."
}

output "access_key_ses_smtp_password" {
  value       = "${aws_iam_access_key.user.ses_smtp_password}"
  description = "The secret access key converted into an SES SMTP password by applying AWS's documented conversion algorithm."
}

output "access_key_status" {
  value       = "${aws_iam_access_key.user.status}"
  description = "\"Active\" or \"Inactive\". Keys are initially active, but can be made inactive by other means."
}
