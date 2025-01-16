# Docker-Jenkins-Prometheus-Grafana (Test Task)

Solution for deploying a Python application in a Docker container, configuring ci/cd with Jenkins, and monitoring with Prometheus, Grafana, cAdvisor, NodeExporter

## Objective
Create a simple infrastructure that includes:
1. CI/CD pipeline for a containerized application.
2. System monitoring.
3. Documentation for the work performed.


## CI/CD Pipeline Setup

### Overview:
The CI/CD pipeline has been created using **Jenkins** to automate the build, deployment, and testing of a simple Python application in a Docker container. The pipeline stages include:
- **Building Docker Image**: A Docker image is built from the Python application.
- **Deployment**: The Docker container is deployed on a local machine or virtual machine, potentially using Docker Compose for orchestration.
- **Automated Tests**: A simple test verifies that the HTTP server responds correctly.

### Jenkins Pipeline:
The Jenkins pipeline uses a **Jenkinsfile** that defines the stages and steps required for the build and deployment of the application. It performs:
1. **Build**: Builds the Docker image using the Dockerfile.
2. **Test**: Runs basic HTTP requests against the container to verify its operation.
3. **Deploy**: Deploys the Docker container to a machine, ensuring that it is running the application.

---

## Monitoring Setup

### Overview:
The monitoring system is set up using **Prometheus** and **Grafana** to track the health of the server and the application container.

- **Prometheus** collects and stores metrics on the server's health (e.g., CPU, memory usage) and the container’s performance.
- **Grafana** is used to visualize these metrics and display them on a dashboard.

### Steps:
1. **Prometheus Installation**: Prometheus is installed and configured to scrape metrics from the system and Docker containers.
2. **Grafana Installation**: Grafana is installed to visualize the metrics collected by Prometheus.
3. **Alert Configuration**: Alerts are set up in Prometheus for:
   - High CPU load
   - High memory usage by the application container

### Expected Result:
A Grafana dashboard displays the status of the server and container. Prometheus will send alerts for any high resource usage.

---

## Installation and Setup

### Prerequisites:
- Ubuntu or Debian-based system
- Access to a terminal with `sudo` privileges

### 1. **System Update**:
Update the system with the following commands:
```bash
sudo apt-get update && sudo apt-get upgrade -y


sudo usermod -aG docker $USER


sudo apt-get update
sudo apt-get install docker-compose

Кроки для установки Jenkins на Ubuntu:
Оновлення системи:

Спочатку оновіть список доступних пакетів:

bash
Копіювати
Редагувати
sudo apt-get update
sudo apt-get upgrade -y
Додавання репозиторію Jenkins:

Додайте ключ репозиторію Jenkins для вашої системи:

bash
Копіювати
Редагувати
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
Далі додайте сам репозиторій Jenkins до списку джерел:

bash
Копіювати
Редагувати
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable/ binary/ > /etc/apt/sources.list.d/jenkins.list'


sudo apt update
sudo apt install openjdk-17-jdk -y
Налаштування Java 17 як за замовчуванням
Після встановлення Java 17, потрібно налаштувати її як основну версію для системи:

bash
Копіювати
Редагувати
sudo update-alternatives --config java



Встановлення Jenkins:

Тепер оновіть пакети і встановіть Jenkins:

bash
Копіювати
Редагувати
sudo apt-get update
sudo apt-get install jenkins -y
Запуск і налаштування Jenkins:

Запустіть Jenkins як сервіс:

bash
Копіювати
Редагувати
sudo systemctl start jenkins
Для того, щоб Jenkins запускався автоматично після перезавантаження системи, додайте його в автозапуск:

bash
Копіювати
Редагувати
sudo systemctl enable jenkins
Перевірка статусу Jenkins:

Перевірте, чи працює Jenkins:

bash
Копіювати
Редагувати
sudo systemctl status jenkins


sudo ufw allow 8080
sudo ufw allow 5000

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

Щоб цей Jenkins pipeline працював належним чином, вам потрібно встановити кілька плагінів для підтримки Docker і Git. Ось перелік плагінів, які необхідно встановити:

1. Git Plugin:
Для роботи з Git, для клонування репозиторіїв у вашому pipeline.

Плагін: Git Plugin
Опис: Дозволяє Jenkins клонувати репозиторії з Git.
2. Docker Pipeline Plugin:
Для виконання команд Docker, таких як docker.build, docker.image, тощо.

Плагін: Docker Pipeline
Опис: Плагін для інтеграції Jenkins з Docker, дозволяє запускати Docker-контейнери, будувати образи та інші операції з Docker.
3. Docker Plugin:
Плагін для інтеграції Jenkins із Docker і для створення Docker контейнерів.

Плагін: Docker Plugin
Опис: Плагін для інтеграції Jenkins з Docker. Дає змогу управляти Docker контейнерами з Jenkins.
4. Pipeline: Declarative:
Цей плагін дозволяє використовувати декларативні синтаксиси для написання pipeline, як в вашому прикладі.

Плагін: Pipeline: Declarative
Опис: Плагін для підтримки декларативних pipeline у Jenkins.
5. Pipeline: Groovy:
Для підтримки скриптів Groovy, які можуть використовуватися в pipeline.

Плагін: Pipeline: Groovy
Опис: Дозволяє використовувати Groovy скрипти в pipeline для написання коду, що виконується на етапах pipeline.
6. Blue Ocean Plugin (необов'язково):
Для зручнішого перегляду pipeline у графічному вигляді.

Плагін: Blue Ocean
Опис: Зручний інтерфейс для перегляду та керування pipeline.  
1. Додати користувача Jenkins до групи docker
Docker демону зазвичай потрібен доступ до групи docker, щоб керувати контейнерами без прав root. Для цього потрібно додати користувача Jenkins до групи docker.

Кроки:

Перевірте, чи існує група docker:

bash
Копіювати
Редагувати
sudo groupadd docker
Додайте користувача Jenkins до цієї групи:

bash
Копіювати
Редагувати
sudo usermod -aG docker jenkins
Перезапустіть Jenkins:

bash
Копіювати
Редагувати
sudo systemctl restart jenkins
Перезапустіть Jenkins, якщо потрібно:

bash
Копіювати
Редагувати
sudo systemctl restart jenkins
2. Перезапуск Docker демону
Іноді проблема може бути з самим Docker демоном. Переконайтеся, що Docker працює без проблем.

bash
Копіювати
Редагувати
sudo systemctl restart docker
3. Перевірка дозволів на сокет Docker
Переконайтеся, що сокет Docker (/var/run/docker.sock) має правильні дозволи. Ви можете вручну змінити дозволи на цей сокет, якщо потрібно:

bash
Копіювати
Редагувати
sudo chmod 666 /var/run/docker.sock
Це дасть доступ до сокету Docker усім користувачам. Але варто зазначити, що це не є рекомендованою практикою з точки зору безпеки. Краще використовувати групу docker, як описано вище.


Щоб налаштувати систему моніторингу для відстеження стану сервера і контейнера додатка за допомогою Grafana та Prometheus, ми повинні виконати кілька етапів:

1. Налаштування Prometheus для моніторингу Docker
Prometheus буде збирати метрики з Docker-контейнерів і серверу. Для цього потрібно налаштувати Prometheus для збору метрик через експортерів, зокрема cAdvisor (для контейнерів Docker).

Кроки:
Встановлення Prometheus:

Для початку потрібно встановити Prometheus:

bash
Копіювати
Редагувати
sudo apt-get update
sudo apt-get install prometheus
Налаштування prometheus.yml:

Відредагуйте конфігураційний файл Prometheus /etc/prometheus/prometheus.yml для додавання cAdvisor як джерела метрик.

Додайте наступне в конфігурацію:

yaml
Копіювати
Редагувати
scrape_configs:
  - job_name: 'docker'
    static_configs:
      - targets: ['localhost:8080']  # cAdvisor буде працювати на порту 8080
Запуск cAdvisor для збору метрик Docker:

Використовуємо cAdvisor, щоб збирати метрики з Docker:

bash
Копіювати
Редагувати
docker run -d --name=cadvisor --volume=/:/rootfs:ro --volume=/var/run:/var/run:ro --volume=/sys:/sys:ro --volume=/var/lib/docker/:/var/lib/docker:ro --publish=8080:8080 google/cadvisor:latest
Це дозволить cAdvisor почати збір метрик з Docker і висвітлювати їх за допомогою веб-інтерфейсу на порту 8080.

Запуск Prometheus:

Після налаштування конфігурації Prometheus, перезапустіть службу Prometheus:

bash
Копіювати
Редагувати
sudo systemctl restart prometheus
Перевірка стану Prometheus:

Переконайтеся, що Prometheus запущений, перевіривши його статус:

bash
Копіювати
Редагувати
sudo systemctl status prometheus
Доступ до Prometheus:

Перейдіть на веб-інтерфейс Prometheus:

arduino
Копіювати
Редагувати
http://<your_server_ip>:9090
2. Налаштування Grafana для візуалізації метрик
Grafana використовуватиметься для візуалізації метрик, що збираються Prometheus.

Кроки:
Встановлення Grafana:

Для встановлення Grafana на сервер:

bash
Копіювати
Редагувати
sudo apt-get install -y software-properties-common
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
sudo apt-get update
sudo apt-get install grafana
Запуск Grafana:

Після встановлення Grafana, перезапустіть службу:

bash
Копіювати
Редагувати
sudo systemctl enable grafana-server
sudo systemctl start grafana-server
Доступ до Grafana:

Відкрийте браузер і перейдіть на:

arduino
Копіювати
Редагувати
http://<your_server_ip>:3000
За замовчуванням логін і пароль для Grafana:

Логін: admin
Пароль: admin
Налаштування джерела даних Prometheus:

Після входу в Grafana:

Перейдіть до Configuration (конфігурація) -> Data Sources.
Додайте нове джерело даних і виберіть Prometheus.
У полі URL введіть: http://localhost:9090 (або адресу вашого Prometheus-сервера).
Збережіть джерело даних.
Створення панелі для відображення метрик:

Тепер ви можете створити панелі для відображення метрик Docker. Використовуйте запити до Prometheus для отримання необхідних даних (наприклад, використання процесора, пам'яті).

Приклад запиту для використання CPU контейнера:

arduino
Копіювати
Редагувати
rate(container_cpu_usage_seconds_total{container_name!="", image!=""}[1m])
Для використання пам'яті:

arduino
Копіювати
Редагувати
container_memory_usage_bytes{container_name!="", image!=""}
Налаштування алертів у Grafana:

Виберіть панель, на якій потрібно налаштувати алерт:

Перейдіть у вкладку Alert (Алерт).
Додайте новий алерт:
Укажіть метрику, на основі якої ви хочете створити алерт (наприклад, використання CPU або пам'яті).
Визначте умови спрацьовування алерту (наприклад, якщо використання CPU більше 90%).
Налаштуйте способи сповіщення (email, Slack тощо).
3. Налаштування основних алертів
Алерт на високе використання CPU:
Перейдіть до Alert в Grafana.
Створіть алерт для метрики CPU, використовуючи запит:
prometheus
Копіювати
Редагувати
rate(container_cpu_usage_seconds_total{container_name!="", image!=""}[1m])
Укажіть умову: спрацьовувати, коли значення більше ніж 90%.
Налаштуйте канал для сповіщень (наприклад, через email).
Алерт на високе використання пам'яті:
Створіть алерт для метрики пам'яті:
prometheus
Копіювати
Редагувати
container_memory_usage_bytes{container_name!="", image!=""}
Визначте порогове значення для пам'яті (наприклад, 80% від загальної доступної пам'яті).
Налаштуйте сповіщення для цього алерту.
4. Завершення налаштувань
Тепер у вас буде працюючий моніторинг на Grafana, який показує використання ресурсу контейнерів, а також налаштовані алерти для спостереження за високим навантаженням на CPU та пам'ять.

Скріншот:
Grafana панель для моніторингу Docker: вона повинна відображати метрики, такі як використання CPU, пам'яті та інші параметри, зібрані через Prometheus.
Алерт у Grafana: сповіщення про перевищення порогових значень, наприклад, коли використання пам'яті перевищує 80%.
Це базове налаштування для моніторингу серверів і контейнерів Docker за допомогою Grafana та Prometheus.

1.1. Налаштування prometheus.yml
У файлі prometheus.yml необхідно додати конфігурацію для моніторингу сервера (через Node Exporter) і контейнера (через cAdvisor):
