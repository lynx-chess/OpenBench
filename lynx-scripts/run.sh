# Exposes internal 8000 port via machine's 8001 one with -p 8001:8000

# Excludes db/ by doing --mount type=volume,dst=/ob/db
#   to avoid messing with local db while inside of the container,
#   so the db created inside of the container will be ephimeral

docker run -it --rm \
  --name test-ob \
  --mount type=bind,src=$PWD,dst=/ob \
  --mount type=volume,dst=/ob/db \
  -w /ob \
  -p 8001:8000 \
  python:3.11-slim \
  bash
