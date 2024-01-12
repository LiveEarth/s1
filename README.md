# s1
We'd like you to create a solution using Terraform that sets up a simple web app on Amazon EC2.
The web app itself doesn't matter: Node, and PHP, don't matter as long as it exposes a web interface. 
The site should be load-balanced using an ELB and connects to an RDS instance that's not publicly reachable. 
We use EFS for shared storage between the two nodes. [not implemented]
Setup autoscaling.
Add at least a CloudWatch alarm that triggers when the total number of requests exceeds X. [not implemented]