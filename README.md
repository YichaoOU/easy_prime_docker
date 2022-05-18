# How to build docker container


```bash
# create docker
docker build -t easy_prime .
# test docker container to identify bugs before publish
docker run -p 80:80 easy_prime
# upload docker container
docker tag easy_prime:latest liyc1989/easy_prime:latest
docker push liyc1989/easy_prime:latest

```

# Note

1. To build AWS server, it is much easier to just use port 80

2. conda activate myenv in Docker is relatively difficult. I have to use a `run.sh` to first activate and then run python.

3. For easy-prime conda package, I didn't specify different dash package versions, this caused some problem recently. Specifically, I fixed the following versions:

```
RUN pip install xgboost==1.4.0
RUN pip install dash-bootstrap-components==0.12.2
RUN pip install dash==1.20.0
RUN pip install dash-bio==0.2.0
RUN pip install dash-core-components==1.16.0
RUN pip install dash-html-components==1.1.3
RUN pip install dash-renderer==1.9.1
RUN pip install dash-table==4.11.3
RUN pip install Werkzeug==2.0.0
```

