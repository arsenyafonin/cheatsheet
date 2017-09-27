#### Установка AWS Command Line Interface на Windows

1. cmd.exe: `pip install awscli --upgrade --user`
2. run: `sysdm.cpl` > Переменные среды... > Системные переменные:
    1. `Path`: Изменить...
    2. Создать: `C:\Users\%USERNAME%\AppData\Roaming\Python\Python36\Scripts` (`%USERNAME%` заменить)
3. cmd.exe: `aws configure`
    1. AWS Access Key ID: `AKIAJSGFIXAOPJTCVHAQ`
    2. AWS Secret Access Key: `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`
    3. Default region name: `eu-central-1`
    4. Default output format > Skip

#### Установка AWS Command Line Interface на Mac OS

Все команды из инструкции ниже необходимо запускать в Terminal.

1. Установите AWS CLI с помощью pip: `pip3 install awscli --upgrade --user`
2. Используя команду `pip3 show awscli`, найдите параметр `Location`, который будет содержать путь к модулю, например: `./Library/Python/3.6/lib/python/site-packages`
3. Скопируйте путь к модулю, заменив `lib/...` на `bin`, а `./` на `$HOME`, чтобы получить путь вида: `$HOME/Library/Python/3.6/bin`
4. Добавьте путь к переменную среды PATH:  
`export PATH=$HOME/Library/Python/3.6/bin:$PATH`
5. Обновите командную строку: `source ~/.bash_profile`
6. Проверьте правильность установки с помощью `aws --version`
7. Настройте AWS CLI с помощью `aws configure`:
    1. AWS Access Key ID: `AKIAJSGFIXAOPJTCVHAQ`
    2. AWS Secret Access Key: `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`
    3. Default region name: `eu-central-1`
    4. Default output format > Skip
