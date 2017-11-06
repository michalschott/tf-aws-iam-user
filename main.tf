resource "aws_iam_user" "user" {
  name          = "${var.name}"
  path          = "${var.path}"
  force_destroy = "${var.force_destroy}"
}

resource "aws_iam_user_policy_attachment" "user_policy_attachment" {
  count      = "${length(compact(distinct(var.policy_arns)))}"
  user       = "${aws_iam_user.user.name}"
  policy_arn = "${element(var.policy_arns, count.index)}"
}

resource "aws_iam_access_key" "user" {
  count   = "${var.create_api_keys && length(var.pgp_key) > 0 ? 1 : 0}"
  user    = "${aws_iam_user.user.name}"
  pgp_key = "${var.pgp_key}"
}

resource "aws_iam_user_policy" "policy" {
  count  = "${length(var.policy) > 0 ? 1 : 0}"
  policy = "${var.policy}"
  name   = "${var.policy_name}"
  user   = "${aws_iam_user.user.name}"
}

resource "aws_iam_user_login_profile" "user" {
  count                   = "${var.create_console_password && length(var.pgp_key) > 0 ? 1 : 0}"
  user                    = "${aws_iam_user.user.name}"
  pgp_key                 = "${var.pgp_key}"
  password_reset_required = "${var.password_reset_required}"
  password_length         = "${var.password_length}"
}
