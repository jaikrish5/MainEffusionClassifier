FROM python:3.7

RUN pip install virtualenv
ENV VIRTUAL_ENV=/venv
RUN virtualenv venv -p python3
ENV PATH="VIRTUAL_ENV/bin:$PATH"

# COPY . /usr/app/

WORKDIR /app
ADD . /app

# Install dependencies
# RUN python -m pip install --upgrade pip
# RUN pip install -r requirements.txt --ignore-installed six
RUN pip --no-cache-dir install  -r requirements.txt

# Expose port 
ENV PORT 8080

# Run the application:
# CMD ["gunicorn", "app:app", "--config=config.py"]
# ENTRYPOINT [ "python" ]

# CMD ["app.py"]
# Run the application:
CMD ["gunicorn", "app:app", "--config=config.py"]
