import boto3

region = 'ap-southeast-1'
#place your instances here
instances = ['instance1id', 'instance2id']

def lambda_handler(event, context):
    ec2 = boto3.client('ec2', region_name=region)
    ec2.stop_instances(InstanceIds=instances)
    print 'stopped your instances: ' + str(instances)