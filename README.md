# Домашнее задание к занятию "Что такое DevOps. CI/CD" - Штанько Богдан

---

## Задание 1

### Что было сделано:

1. Установлен Jenkins
2. Установлен Go
3. Установлен Docker
4. Настроен доступ Jenkins к Docker (добавлен в группу docker)
5. Создан Freestyle Project в Jenkins

### Настройки сборки:

```bash
go version
docker version
go test .
docker build .
```
### Скриншоты настроек:
![settings_1](/img/settings_1.jpg)
![settings_2](/img/settings_2.jpg)

### Скриншот выполнено проекта:
![project](/img/project.jpg)

### Результат:

- Сборка проекта выполнена успешно
- Тесты Go выполнены без ошибок
- Docker-образ успешно собран


## Задание 2

### Что было сделано:

1. Создан новый Pipeline проект в Jenkins
2. Подключен GitHub репозиторий
3. Настроен declarative pipeline
4. Добавлены стадии сборки: Checkout, Test, Docker Build
5. Выполнена сборка проекта через pipeline
6. Получен успешный результат выполнения

### Pipeline:

```groovy
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Fuyumiki/netology_hw_jenkins.git'
            }
        }

        stage('Test') {
            steps {
                sh 'go test .'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build .'
            }
        }
    }
}
```
### Скриншоты:
![go_pipeline](/img/go_pipeline.jpg)
![go_pipeline_settings](/img/go_pipeline_settings.jpg)


## Задание 3

### Что было сделано:

1. Установлен Nexus Repository Manager.
2. Создан raw-hosted репозиторий go-binaries.
3. Pipeline изменён для сборки бинарного Go-файла.
4. Бинарный файл загружен в Nexus с помощью Jenkins.

### Pipeline:

```groovy
pipeline {
    agent any

    environment {
        NEXUS_URL = 'http://158.160.199.110:8085'
        NEXUS_REPO = 'go-binaries'
        APP_NAME = 'app'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Fuyumiki/netology_hw_jenkins.git'
            }
        }

        stage('Build binary') {
            steps {
                sh 'go build -o ${APP_NAME} .'
            }
        }

        stage('Upload to Nexus') {
            steps {
                sh '''
                curl -f -v -u 'admin:***' \
                --upload-file ${APP_NAME} \
                ${NEXUS_URL}/repository/${NEXUS_REPO}/${APP_NAME}
                '''
            }
        }
    }
}
```
### Скриншоты:
![go_nexus](/img/go_nexus.jpg)
![go_nexus_app](/img/go_nexus_app.jpg)