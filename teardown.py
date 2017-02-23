#!/usr/bin/env python3

import boto3
import os

client = boto3.client('ec2')

filters = [
    {'Name':'tag:application', 'Values':[os.environ['TEST_SUITE']]},
    {'Name':'tag:version', 'Values':['test']}
]

images = client.describe_images(Filters=filters)

# Deregister all 'ecat' images marked as 'previous'
for image in images['Images']:
  print('Deregistering: ' + image['ImageId'])
  client.deregister_image(
    ImageId = image['ImageId']
  )
