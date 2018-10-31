#!/bin/python

#Import necessary functions from Jinja2 module
from jinja2 import Environment, FileSystemLoader

#Import YAML module
import yaml

#Load data from YAML into Python dictionary
config_data = yaml.load(open('./data/env.yml'))

#Load Jinja2 template
env = Environment(loader = FileSystemLoader('./templates'), trim_blocks=True, lstrip_blocks=True)
template = env.get_template('aws-ec2-template.yml')

#Render the template with data and print the output
#print(template.render(config_data))

#Render the template with data to a YAML file
fh=open("main.yml","w")
fh.write(template.render(config_data))
fh.close

