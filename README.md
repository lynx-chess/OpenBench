# OpenBench

Fork from [AndyGrant/OpenBench](https://github.com/AndyGrant/OpenBench) with the purpose of testing Lynx chess engine.

## Run

Using `docker compose`.

```bash
docker compose up -d --build --force-recreate
# or
sudo docker compose -f docker-compose.prod.yaml up -d --build && sudo chown -R $(sudo docker compose exec web id -u) ./db && sudo chown -R $(sudo docker compose exec web id -u) ./media && sudo chown -R $(sudo docker compose exec web id -u) ./OpenBench/migrations
# Includes workaround of changing owner of media/ so that the app can save files there

# To stop it:
docker compose down -v --remove-orphans --rmi local
#or
sudo docker compose -f docker-compose.prod.yaml down --remove-orphans --rmi local
```

PS: don't forget to create an `.env` or `.env.prod` file or manually set the environment variables for those values where `os.environ.get()` is used in [settings.py](./OpenSite/settings.py), i.e:

```.env
DJANGO_SECRET_KEY='<your_secret>'
DJANGO_DEBUG=1
DJANGO_SECURE_SSL_REDIRECT=0
DJANGO_SESSION_COOKIE_SECURE=1
DJANGO_CSRF_COOKIE_SECURE=1
```

## First time setup

Entering the container created using `docker compose up`.

```bash
docker exec -it <container-id> bash
python3 manage.py migrate
python3 manage.py makemigrations
python3 manage.py migrate --run-syncdb
```

## Update

[Quoting Andrew](https://discord.com/channels/759496923324874762/1157627941635764314/1216551094893805598)

### Backup
python3 manage.py dumpdata > backup.datetime.json

### Update to latest
git pull
python3 manage.py makemigrations
python3 manage.py migrate

## Test/experiment

Using python docker image.

⚠ db/ directory is excluded by default, to avoid messing up with local db, comment if you want to test stuff and persist the db, but probably first edit DB name in settings in [settings.py](./OpenSite/settings.py).

```bash
# Starts a container, mounts the whole dir as volume (excluding db/) and exposes OB server in localhost:8001
.\run.sh

# To be run inside of the container
pip install -r requirements.txt
python manage.py check --deploy

python3 manage.py migrate
python3 manage.py makemigrations
python3 manage.py migrate --run-syncdb

python3 manage.py runserver 0.0.0.0:8000

python3 manage.py createsuperuser
```

## A few useful/interesting links:

- [Old instance setup instructions](https://web.archive.org/web/20211223142116/https://github.com/AndyGrant/OpenBench)

- [Configuring new engines](https://github.com/AndyGrant/OpenBench/wiki/Configuring-New-Engines)

- [crippa1337 instance](https://github.com/crippa1337/OpenBench)

- [Dockerizing Django with Postgres, Gunicorn, and Nginx](https://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/#project-setup)

----

# OpenBench

OpenBench is an open-source Chess Engine Testing Framework for UCI engines. OpenBench provides a lightweight interface and client to facilitate running fixed-game tests as well as SPRT tests to benchmark changes to engines for performance and stability. OpenBench supports [Fischer Random Chess](https://en.wikipedia.org/wiki/Chess960).

OpenBench is the primary testing framework used for the development of [Ethereal.](https://github.com/AndyGrant/Ethereal) The primary instance of OpenBench can be found at [http://chess.grantnet.us](http://chess.grantnet.us/). The Primary instance of OpenBench supports development for
[Berserk](https://github.com/jhonnold/berserk), [Bit-Genie](https://github.com/Aryan1508/Bit-Genie), [BlackMarlin](https://github.com/dsekercioglu/blackmarlin), [Demolito](https://github.com/lucasart/Demolito), [Drofa](https://github.com/justNo4b/Drofa), [Ethereal](https://github.com/AndyGrant/Ethereal), [FabChess](https://github.com/fabianvdW/FabChess), [Halogen](https://github.com/KierenP/Halogen), [Igel](https://github.com/vshcherbyna/igel), [Koivisto](https://github.com/Luecx/Koivisto), [Laser](https://github.com/jeffreyan11/laser-chess-engine), [RubiChess](https://github.com/Matthies/RubiChess), [Seer](https://github.com/connormcmonigle/seer-nnue), [Stash](https://github.com/mhouppin/stash-bot), [Weiss](https://github.com/TerjeKir/weiss), [Winter](https://github.com/rosenthj/Winter), and [Zahak](https://github.com/amanjpro/zahak). A dozen or more engines are using their own private, local instances of OpenBench.

You can join OpenBench's [Discord server](https://discord.com/invite/9MVg7fBTpM) to join the discussion, see what developers are working on and talking about, or to find out how you can contribute to the project and become a part of it. OpenBench is heavily inspired by [Fishtest](https://github.com/glinscott/fishtest). The project is powered by the [Django Web Framework](https://www.djangoproject.com/) and [Cutechess](https://github.com/cutechess/cutechess).

Documentation for OpenBench is available in the [Wiki](https://github.com/AndyGrant/OpenBench/wiki)