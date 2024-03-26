<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0001.jpg">

## Table of Contents
- [Roles & Responsibilities](#roles--responsibilities)
- [Purpose](#purpose)
- [Project Steps](#project-steps)
  - [1. Cloning and testing the original app](#1-cloning-and-testing-the-original-app)
  - [2. Containerizing the application](#2-containerizing-the-application)
  - [3. Building fault tolerance from the application level to the infrastructure level](#3-building-fault-tolerance-from-the-application-level-to-the-infrastructure-level)
  - [4. Building CICD pipeline, pushing code to GitHub and images to DockerHub](#4-building-cicd-pipeline-pushing-code-to-github-and-images-to-dockerhub)
  - [5. Load Testing the application with Apache JMeter](#5-load-testing-the-application-with-apache-jmeter)
  - [6. Building an ETL pipeline for extra credit](#6-building-an-etl-pipeline-for-extra-credit)
  - [7. Infrastructure Diagram](#7-infrastructure-diagram)


## Roles & Responsibilities
#### Dwayne Toler - Lead Architect
##### Andrew Mullen - System Admin
##### Nalani Daniels - Project Manager
##### Khalil Elkharbibi - Co-Director

## Purpose
#### Final Project for Kura Labs. Containerizing and deploying a NodeJS Quiz application to Kubernetes and building a ETL pipeline. We chose this particular application as a way to help students learn DevOps concepts via quiz questions.


## Project Steps

### 1. Cloning and testing the original app
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0003.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0004.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0005.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0006.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0007.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0008.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0009.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0010.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0011.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0012.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0013.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0014.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0015.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0016.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0017.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0018.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0019.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0020.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0021.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0022.jpg" width="450" height="300">

### 2. Containerizing the application
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0023.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0024.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0025.jpg" width="450" height="300">

### 3. Building fault tolerance from the application level to the infrastructure level
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0026.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0027.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0028.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0029.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0030.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0031.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0032.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0033.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0034.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0035.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0036.jpg" width="450" height="300">

### 4. Building CICD pipeline, pushing code to GitHub and images to DockerHub
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0037.jpg" width="450" height="300">

### 5. Load Testing the application with Apache JMeter
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0038.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0039.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0040.jpg" width="450" height="300">
<img src="https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0041.jpg" width="450" height="300">

### 6. Building an ETL pipeline for extra credit
![Page 42](https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0042.jpg)
![Page 43](https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0043.jpg)

### 7. Infrastructure Diagram
![Page 44](https://github.com/djtoler/Deploying-A-NodeJS-Application-to-Kubernetes-with-a-Serverless-ETL-Pipeline/raw/main/presentation/Final%20Project%20Presentation-2_page-0044.jpg)
