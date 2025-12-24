# Use the official lightweight python image
FROM python:3.12-slim

# Set environment variable
# Prevents Python from writing .pyc files and ensures output is sent to logs
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Copy the uv binary from the official image
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/


WORKDIR /app

COPY pyproject.toml uv.lock ./

RUN uv sync

COPY . .

ENV PATH="/app/.venv/bin:${PATH}"

EXPOSE 80

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]