# Домашнее задание к занятию "Что такое DevOps. CI/CD" - Штанько Богдан

---

## Задание 1

### Что было сделано:

1. Развернута виртуальная машина в Yandex Cloud
2. Установлен Jenkins
3. Установлен Go
4. Установлен Docker
5. Настроен доступ Jenkins к Docker (добавлен в группу docker)
6. Создан Freestyle Project в Jenkins

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