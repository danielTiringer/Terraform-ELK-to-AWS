resource "aws_key_pair" "default" {
  key_name = "danielaws"
  public_key = file("/home/daniel/.ssh/danielaws.pub")
}
