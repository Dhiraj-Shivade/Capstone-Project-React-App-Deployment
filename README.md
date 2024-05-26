                     —Submission—



****Capstone-Project Reference Links and Screenshots****

## Links:

Github URL:  https://github.com/Dhiraj-Shivade/devops-build.git

DockerHub URL: https://hub.docker.com/repositories/dhirajshivade

React-app URL: http://3.108.95.24:80


##Screenshots: 

#Docker Images:
Dev Repo - dhirajshivade/dev:my-react-app-v1 (container ID-33ada7f559d6)

Prod Repo - dhirajshivade/prod:my-react-app-v1 (container ID-e0ff855121f2)





#Dockerhub repo: 






# Github Webhook Integration - 


















#Jenkins (Port 8080)
Login page-
 


Jenkins Credentials passed as secret text and defined as Env. Variables-






3) Pre-Build script for build.sh in job configure-
 




















build.sh -



Pre-build step for deploy.sh in job configure- 















deploy.sh -





6) Jenkins Project (Home) -


7) GitSCM polling config and Github server config -



#AWS:
EC2 Instance-


Security Group -

# Deployed Application running in docker container on ec2 (Port 80)




# Monitoring :
        Prometheus with targets to scrape metrics from instance and react-app (Port - 9090)



# Blackbox_Exporter (Port- 9115) collects metrics for running app with the help of http status codes






# Node_Exporter (Port- 9100) collects metrics for running instance(node) with the health status -
















# Alertmanager (Port 9093) showing alert when i stopped container -





# Alert email (SNS Notification) for App goes Down (when Container stopped- blackbox_exporter)



## Alert email (SNS Notification) for App goes Down (when ec2 stopped- node_exporter)




# Grafana ( Metrics Visualization and Monitoring) (Port - 3000) -

