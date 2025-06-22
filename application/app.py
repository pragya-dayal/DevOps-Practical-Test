from flask import Flask
import boto3
import pymysql
import json

app = Flask(__name__)

def get_secret():
    print("[INFO] Connecting to Secrets Manager...")
    client = boto3.client('secretsmanager', region_name='eu-west-1')
    secret = client.get_secret_value(SecretId='rds!db-68176872-7025-4199-85ed-5d42ad73ea95')
    creds = json.loads(secret['SecretString'])
    print("[DEBUG] Secret fetched:", creds['username'])
    return creds

@app.route("/")
def connect_to_db():
    print("[INFO] Incoming request received.")
    creds = get_secret()
    
    try:
        connection = pymysql.connect(
            host='devopsdb.c5gsc4oq6tmt.eu-west-1.rds.amazonaws.com',
            user=creds['username'],
            password=creds['password'],
            db='devopsdb'
        )
        print("[SUCCESS] Connected to DB")
        connection.close()
        return f"""
            <h2>✅ Connected to DB successfully!</h2>
            <p><strong>Username:</strong> {creds['username']}</p>
        """
    except Exception as e:
        print("[ERROR] Failed to connect to DB:", str(e))
        return f"""
            <h2>❌ DB Connection Failed</h2>
            <p><strong>Error:</strong> {str(e)}</p>
            <p><strong>Fetched Secret:</strong> {json.dumps(creds)}</p>
        """, 500

if __name__ == "__main__":
    print("[START] Flask app is starting on port 80...")
    app.run(host="0.0.0.0", port=80)
