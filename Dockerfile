FROM quali/terraform:2.0.50aca2a-tfincluded

# Additional dependencies go here
RUN apt install python3 && pip install  pymongo pymongo[aws] --upgrade
