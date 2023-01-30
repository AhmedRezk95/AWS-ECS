resource "aws_ecr_repository" "ecr" {
  name = "rizk"
}


resource "aws_ecs_cluster" "ecs_cluster" {
  name = "my-cluster"
}


resource "aws_ecs_task_definition" "task_definition" {
  # family if required
  family                = "worker"
  container_definitions = file("./task_definition.json")
}


resource "aws_ecs_service" "worker" {
  name            = "worker"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.task_definition.arn
  desired_count   = 2
}
