############################################################
# Builder
############################################################
FROM --platform=$BUILDPLATFORM python:3.12.5-slim AS builder

WORKDIR /usr/src/app

# Set environment variables
# Prevents Python from writing pyc files to disc (equivalent to python -B option)
ENV PYTHONDONTWRITEBYTECODE=1
# Prevents Python from buffering stdout and stderr (equivalent to python -u option)
ENV PYTHONUNBUFFERED=1

# Install system dependencies
RUN apt-get update && \
    apt-get install -y python3 pip

# Install python dependencies
COPY ./requirements.txt .
RUN pip wheel --no-cache-dir --no-deps --wheel-dir /usr/src/app/wheels -r requirements.txt

############################################################
# Setup OpenBench
############################################################
FROM --platform=$BUILDPLATFORM python:3.12.5-slim AS final

WORKDIR /app

# Create directory for the app user
RUN mkdir -p /home/app
ENV HOME=/home/app

# Create the app user
RUN addgroup --system app && adduser --system --group app

# Create a directory for the client and make it .NET CLI home and workdir
ENV APP_HOME=/home/app/client
ENV DOTNET_CLI_HOME=$APP_HOME
WORKDIR $APP_HOME

# Install dependencies
RUN apt-get update && \
    apt-get install -y build-essential wget  && \
    wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install -y dotnet-sdk-8.0

COPY --from=builder /usr/src/app/wheels /wheels
COPY --from=builder /usr/src/app/requirements.txt .
# RUN pip install --upgrade pip
RUN pip install --no-cache /wheels/*

# Copy entrypoint.prod.sh
COPY ./client-entrypoint.sh .
RUN sed -i 's/\r$//g'  $APP_HOME/client-entrypoint.sh
RUN chmod +x $APP_HOME/client-entrypoint.sh

# Copy project
COPY . $APP_HOME

# chown all the files to the app user
RUN chown -R app:app $APP_HOME

# Change to the app user
USER app

# run entrypoint.prod.sh
ENTRYPOINT ["/home/app/client/client-entrypoint.sh"]
