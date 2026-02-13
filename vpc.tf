resource "aws_vpc" "custom_main" {
  cidr_block           = "192.168.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "custom-vpc"
  }
}

# ---------------- PUBLIC SUBNET ----------------
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.custom_main.id
  cidr_block              = "192.168.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet"
  }
}

# ---------------- PRIVATE SUBNET ----------------
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.custom_main.id
  cidr_block        = "192.168.2.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "private_subnet"
  }
}

# ---------------- IGW ----------------
resource "aws_internet_gateway" "custom_igw" {
  vpc_id = aws_vpc.custom_main.id

  tags = {
    Name = "custom-igw"
  }
}

# ---------------- PUBLIC ROUTE TABLE ----------------
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.custom_main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.custom_igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

# Associate PUBLIC subnet
resource "aws_route_table_association" "public_asso" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# ---------------- PRIVATE ROUTE TABLE ----------------
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.custom_main.id

  tags = {
    Name = "private-route-table"
  }
}

# Associate PRIVATE subnet
resource "aws_route_table_association" "private_asso" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}
