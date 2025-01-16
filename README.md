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

