# devops
deploy nodeapp

Please complete your DevOps prerequisite course from Kode Kloud and complete your assignment.

1. Create a code repository in GitHub (It should be a meaningful name).
2. Commit a sample project code of any language (It can be Python, Nodejs, Go, c#).
3. Create a branch in the code repository.
4. Install Docker on the local machine using Linux Bash script ( Do read Docker basic stuff like volume, network, etc) 
5. Create Jenkins and SonarQube Container using Docker-Compose.
6. Create a declarative pipeline in Jenkins (checkout code from code repo, run analysis in Sonarqube, then build docker image )
7. Please add your Bash script and Docker-Compose file to the GitHub repo.
On completion please share the repo/artifacts/demo.


sudo chmod 777 /var/run/docker.sock

docker build -t jenkins-docker -f jenkinsdockerfile .