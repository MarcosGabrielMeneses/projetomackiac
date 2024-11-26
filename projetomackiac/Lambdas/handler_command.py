def command(event, context):
    print("Command received:", event)
    return {
        "statusCode": 200,
        "body": "Command handler executed successfully!"
    }
