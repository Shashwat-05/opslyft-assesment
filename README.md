## opslyft-assesment

### components

#### ansible-playbooks
*contains the ansible playbooks to setup a jenkins server and k8s cluster locally*
**Note -** for redhat distributions only
run - `ansible-playbook initiator.yml`

#### Dockerfile
*contains the blueprint for the flask application*
(change the ENV 'msg' value to update the flask app home page msg )
1. `docker built -t <username>/<img-name>:<tag-version>`
2. `docker push <username>/<img-name>:<tag-version>`

#### app.py
*the flask application code*
1. `flask run`
2. (need to install pylint first - `pip install pylint`)
3. and to test  - `pylint app.py`


#### deploy-files
*contains the deployment and service k8s configuration for the application*
1. `kubectl apply -f deploy-files/flask-deploy.yaml`
2. `kubectl apply -f deploy-files/flask-service.yaml`

#### Jenkinsfile
*contains all stages for the multi-branch pipeline*
Just make sure all the credentials are set eg- DockerHub, k8s config file, GitHub credentials
*further config and plugins needs to be installed via web console*

**All the manual work of each section above is automated with this Jenkins CI/CD pipeline**
- trigger looks for changes in repo
- builds the pipeline
    - forks the updated repo
    - tests the application code first
    - builds docker image from Dockerfile template
    - pushes the image to DockerHub
    - starts the deployment in the k8s multi-node cluster
    - updates the image version and does rollout on triggering 


*Walkthrough of the practical - https://drive.google.com/file/d/1wnByMnH5qNaQj2lyHC_u_58Mi9PJ6F2R/view?usp=sharing*