FROM --platform=$BUILDPLATFORM python:3.14-slim AS builder

WORKDIR /app

# Set environment variables
# Prevents Python from writing pyc files to disc (equivalent to python -B option)
ENV PYTHONDONTWRITEBYTECODE=1
# Prevents Python from buffering stdout and stderr (equivalent to python -u option)
ENV PYTHONUNBUFFERED=1

# Install dependencies
# https://discuss.python.org/t/information-for-python-users-regarding-emudhra-emsign-ca-certificate-security-incident/109576
RUN pip install --upgrade "pip>=26.2.2"

COPY requirements.txt /app
RUN pip3 install -r requirements.txt --no-cache-dir

# Copy project
COPY . /app

RUN sed -i 's/\r$//g' /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# run entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
