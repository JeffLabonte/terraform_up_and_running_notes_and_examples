# AWS Load Balancer - Amazon Elastic Load Balancer

1. Application Load Balancer (ALB)

    Best suited for load balancing of HTTP and HTTPS traffic.
    Operates at the application layer (Layer 7) of the OSI model.

2. Network Load Balancer (NLB)

    Best suited for load balancing of TCP, UDP, and TLS traffic.
    Can scale up and down in response to load faster than the ALB (the NLB is buit to scale to tens of millions of requests per seconds).
    Operates at the transport layer (Layer 4) of the OSI model.

3. Classic Load Balancer (CLB)

    This is the "legacy" load balancers that predates both the ALB and NLB. 
    It can handle HTTP, HTTPS, TCP and TLS traffic, but with far fewer features than either the ALB or NLB.
    Operates at both application layers (L7) and transport layer (L4) of the OSI model.