# Docker commands
build
```bash
docker build -t devops-final-db .
```

image security scanning
```bash
trivy image devops-final-db
```

run
```bash
docker run -d -p 5432:5432 --name devops_final_db --env-file .env devops-final-db
```

tag
```bash
docker tag devops-final-db denture8278/devops-final-db:v1.0
docker tag devops-final-db denture8278/devops-final-db:latest
```

push
```bash
docker push denture8278/devops-final-db:v1.0
docker push denture8278/devops-final-db:latest
```