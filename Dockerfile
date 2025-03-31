FROM quali/terraform:2.0.8328c1a-tfincluded

# Additional dependencies go here
RUN apt install python3 && pip install  pymongo pymongo[aws]  awscli --upgrade
