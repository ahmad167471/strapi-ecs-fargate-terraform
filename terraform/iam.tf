resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole-strapi"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_execution_policy" {
  role       = ecs_fargate_taskRole
  policy_arn = "arn:aws:iam::811738710312:role/ecs_fargate_taskRole"
}