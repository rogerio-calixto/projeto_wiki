# # Criando Tópico SNS
# resource "aws_sns_topic" "futura-events" {
#   name = "${var.environment}-jenkins-sns"
# }

# resource "aws_sns_topic_subscription" "futura-events-email" {
#   topic_arn = aws_sns_topic.futura-events.arn
#   protocol  = "email"
#   endpoint  = var.sns-email
# }