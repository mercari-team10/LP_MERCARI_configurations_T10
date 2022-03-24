FROM python:3.7 

WORKDIR /suggestion

COPY requirements.txt ./
RUN pip install -r ./requirements.txt

COPY . ./

ENTRYPOINT ["python", "ml_model.py"]

