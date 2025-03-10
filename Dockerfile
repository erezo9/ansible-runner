FROM quali/terraform:2.0.67eab97-tfincluded

# Additional dependencies go here
RUN apt install python3 && pip install  pymongo pymongo[aws]  awscli --upgrade
