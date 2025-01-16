# ci-cd-test-task-NatVor

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
