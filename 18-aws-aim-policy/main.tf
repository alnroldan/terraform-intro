
resource "aws_iam_user" "admin-user" {
  name = "carly"
  
  tags = {
  Description = "Jefe Tecnico"
  }
}

resource "aws_iam_policy" "adminUser" {
  name = "AdminUsers"
  policy =  file("admin-policy.json")
}

resource "aws_iam_user_policy_attachment" "carly-admin-access" {
  
  user = aws_iam_user.admin-user.name

  policy_arn = aws_iam_policy.adminUser.arn


}