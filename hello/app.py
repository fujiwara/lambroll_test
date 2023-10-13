import sys, os

def handler(event, context):
    env_vars = os.environ
    formatted_vars = [f"{key}={value}" for key, value in env_vars.items()]
    return 'Hello from AWS Lambda using Python' + sys.version + '!\n' + '\n'.join(formatted_vars)
