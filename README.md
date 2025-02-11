# CI-CDmedDockerKubernetesochAnsible

# CI/CD with Docker, Kubernetes, and Ansible

This repository implements a **CI/CD pipeline** using **Docker, GitHub Actions, Kubernetes, and Ansible**. It builds, pushes, and deploys an **Nginx application** and automates rolling updates.

---

## **Table of Contents**

- [Prerequisites](#-prerequisites)
- [Build and Push Docker Image](#1️⃣-build-and-push-docker-image)
- [Set Up GitHub Actions CI/CD Pipeline](#2️⃣-set-up-github-actions-cicd-pipeline)
- [Automate Versioning with Git Tags](#3️⃣-automate-versioning-with-git-tags)
- [Deploy to Kubernetes with Minikube](#4️⃣-deploy-to-kubernetes-with-minikube)
- [Rolling Updates with Ansible](#5️⃣-rolling-updates-with-ansible)
- [Future Improvements](#-future-improvements)

---

## **Prerequisites**

Ensure you have installed:

- [Docker](https://docs.docker.com/get-docker/)
- [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- [GitHub CLI (Optional)](https://cli.github.com/)

---

## **Build and Push Docker Image**

### **Build the Image**

```sh
docker build -t ghcr.io/florinelfrancisc/nginx-app:latest .
```

### **Push the Image to GitHub Container Registry (GHCR)**

**Authenticate to GHCR**

```sh
echo "YOUR_GHCR_PAT" | docker login ghcr.io -u florinelfrancisc --password-stdin
```

**Push the Image**

```sh
docker push ghcr.io/florinelfrancisc/nginx-app:latest
```

---

## **Set Up GitHub Actions CI/CD Pipeline**

A **GitHub Actions pipeline** is already included in `.github/workflows/docker-image-build-pipeline.yml`. It will:
**Build the Docker image**  
 **Push it to GHCR**

### **Trigger the Pipeline Manually**

```sh
git push
```

💡 GitHub Actions will automatically build and push the image.

---

## ** Automate Versioning with Git Tags**

The pipeline **only triggers when a new tag is pushed**.

### **Create a New Version Tag**

```sh
git tag -a v1.0.1 -m "Release version 1.0.1"
git push origin v1.0.1
```

---

## ** Deploy to Kubernetes with Minikube**

### **Start Minikube**

```sh
minikube start
```

### **Apply Kubernetes Deployment and Service**

```sh
kubectl apply -f nginx-deployment.yml
kubectl apply -f nginx-service.yml
```

### **Check Deployment and Service**

```sh
kubectl get deployments
kubectl get services
```

### **Access the App**

```sh
minikube service nginx-service
```

## **Rolling Updates with Ansible**

The **Ansible playbook** automates **rolling updates** and **rollback on failure**.

### **Run the Playbook**

```sh
ansible-playbook rolling_update.yml
```

### **Rollback Deployment (If Needed)**

```sh
kubectl rollout undo deployment/nginx-app
```

## **Final Steps**

🔹 **Push your code to GitHub**  
🔹 **Verify pipeline runs correctly**  
🔹 **Ensure Kubernetes updates properly**

**Your CI/CD pipeline is now fully automated!**
