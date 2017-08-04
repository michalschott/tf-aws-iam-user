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
  count   = "${length(var.pgp_key) > 0 ? 1 : 0}"
  user    = "${aws_iam_user.user.name}"
  pgp_key = "${var.pgp_key}"
}
