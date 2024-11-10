FROM quali/terraform:2.0.b99a1b8160-tfincluded

# Additional dependencies go here
RUN apt install python3 && pip install  pymongo pymongo[aws]  awscli --upgrade
