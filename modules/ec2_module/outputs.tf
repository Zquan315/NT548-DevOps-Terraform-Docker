output "nhom16_ec2_public_dev_id" {
  value = aws_instance.nhom16_ec2_public_dev.id
}
output "nhom16_ec2_public_prod_id" {
  value = aws_instance.nhom16_ec2_public_prod.id
}
output "nhom16_eip_dev_id" {
  value = aws_eip.nhom16_eip_dev.id
}
output "nhom16_eip_prod_id" {
  value = aws_eip.nhom16_eip_prod.id
}