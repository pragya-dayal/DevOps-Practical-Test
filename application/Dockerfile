FROM python:3.9-slim

RUN pip install flask boto3 pymysql

COPY app.py /app.py

EXPOSE 80

CMD ["python", "app.py"]
