FROM quali/terraform:2.0.dca0bc9-tfincluded

# Additional dependencies go here
RUN apt install python3 && pip install  pymongo pymongo[aws]  awscli --upgrade
