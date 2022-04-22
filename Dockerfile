FROM ubuntu:20.04
SHELL ["/bin/bash", "-c"]
ENV FLASK_APP=js_example
COPY student-exam2 /student-exam2
WORKDIR /student-exam2
RUN apt update && apt install -y pip && pip install -e .
ENTRYPOINT [ "flask", "run", "--host=0.0.0.0" ]



