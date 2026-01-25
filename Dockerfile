FROM quali/terraform:2.0.dev1769209264

# Additional dependencies go here
RUN apt install python3 && pip install  pymongo pymongo[aws]  awscli --upgrade
