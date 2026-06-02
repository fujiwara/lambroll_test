resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = var.project
  }
}

resource "aws_subnet" "public" {
  for_each          = { a = 1, c = 2, d = 3 }
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.${each.value}.0/24"
  availability_zone = "ap-northeast-1${each.key}"
  tags = {
    Name = "${var.project}-public-${each.key}"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.project
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name = "${var.project}-public"
  }
}

resource "aws_route_table_association" "public" {
  for_each       = toset(["a", "c", "d"])
  subnet_id      = aws_subnet.public[each.key].id
  route_table_id = aws_route_table.public.id
}
