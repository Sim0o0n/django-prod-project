FROM python:3.11-slim

WORKDIR /app

COPY Pipfile Pipfile.lock ./

RUN pip install --no-cache-dir pipenv && \
    pipenv install --system --deploy

COPY mysite/ ./mysite/

EXPOSE 8003

CMD ["sh", "-c", "python mysite/manage.py migrate && python mysite/manage.py runserver 0.0.0.0:8003"]
