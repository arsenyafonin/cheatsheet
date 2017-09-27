#### Установка AWS Command Line Interface на Windows

1. Установить AWS CLI с cmd.exe: `pip install awscli --upgrade --user`
2. Выполнить: `sysdm.cpl` > Переменные среды... > Системные переменные:
    1. `Path`: Изменить...
    2. Создать: `C:\Users\%USERNAME%\AppData\Roaming\Python\Python36\Scripts` (`%USERNAME%` заменить)
3. Перезапустить cmd.exe
4. Настроить AWS CLI с cmd.exe: `aws configure`
    1. AWS Access Key ID: `AKIAJSGFIXAOPJTCVHAQ`
    2. AWS Secret Access Key: `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`
    3. Default region name: `eu-central-1`
    4. Default output format > Skip

#### Установка AWS Command Line Interface на Mac OS

Все команды из инструкции ниже необходимо запускать в Terminal.

1. Установить AWS CLI с помощью pip: `pip3 install awscli --upgrade --user`
2. Используя команду `pip3 show awscli`, найти параметр `Location`, который будет содержать путь к модулю, например: `./Library/Python/3.6/lib/python/site-packages`
3. Скопировать путь к модулю, заменив `lib/...` на `bin`, а `./` на `$HOME`, чтобы получить путь вида: `$HOME/Library/Python/3.6/bin`
4. Добавить путь к переменную среды PATH:  
`export PATH=$HOME/Library/Python/3.6/bin:$PATH`
5. Обновить командную строку: `source ~/.bash_profile`
6. Проверить правильность установки с помощью `aws --version`
7. Настроить AWS CLI с помощью `aws configure`:
    1. AWS Access Key ID: `AKIAJSGFIXAOPJTCVHAQ`
    2. AWS Secret Access Key: `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`
    3. Default region name: `eu-central-1`
    4. Default output format > Skip
