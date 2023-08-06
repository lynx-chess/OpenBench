#!/bin/sh

# python3 manage.py migrate --noinput
# python3 manage.py makemigrations
# python3 manage.py migrate --run-syncdb
python manage.py collectstatic --no-input --clear

exec "$@"