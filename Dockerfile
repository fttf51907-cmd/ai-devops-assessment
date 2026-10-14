# syntax=docker/dockerfile:1

# Production image
FROM python:3.11-slim AS production

WORKDIR /app

ENV PYTHONUNBUFFERED=1 \
    APP_ENV=production \
    FLASK_DEBUG=0

COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

COPY app.py .

EXPOSE 5000

CMD ["python", "app.py"]

# Development image: adds debugger and enables Flask debug mode
FROM production AS development

ENV APP_ENV=development \
    FLASK_DEBUG=1

RUN pip install --no-cache-dir debugpy
