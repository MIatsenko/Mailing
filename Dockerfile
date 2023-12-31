FROM python:3.10-slim-bullseye

WORKDIR /app

COPY requirements.txt /app/

RUN pip install -r requirements.txt

COPY . /app/

COPY ./entrypoint /

RUN sed -i 's/\r$//g' /entrypoint

RUN chmod u+x /entrypoint

ENTRYPOINT ["/entrypoint"]