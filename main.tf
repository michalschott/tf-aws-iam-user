resource "aws_iam_user" "user" {
  name          = "${var.name}"
  path          = "${var.path}"
  force_destroy = "${var.force_destroy}"
}

resource "aws_iam_access_key" "user" {
  user    = "${aws_iam_user.user.name}"
  pgp_key = "${var.pgp_key}"
}
