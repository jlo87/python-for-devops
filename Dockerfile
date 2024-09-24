FROM python:3.9.20-slim-bullseye

RUN mkdir -p /app

COPY . main.py /app/

WORKDIR /app

# textblob.download_corpora is necessary to do NLP
RUN pip install -r requirements.txt && \
    python -m textblob.download_corpora

EXPOSE 8080

CMD [ "main.py" ]

ENTRYPOINT [ "python" ]