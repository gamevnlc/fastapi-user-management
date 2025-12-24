# Docker Command

## Clean project
```
docker compose down --rmi all --volumes --remove-orphans
```

## Rebuild & run
```
docker compose up -d --build
```

## Force rebuild no cache
```
docker compose build --no-cache
docker compose up -d
```

## create uv.lock
```
uv pip compile pyproject.toml -o uv.lock
```