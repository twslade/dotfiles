psa-get-aws-ip(){
	getent hosts prod-alb-v00-619032734.us-east-1.elb.amazonaws.com | awk 'NR==1{ print $1}'
}
