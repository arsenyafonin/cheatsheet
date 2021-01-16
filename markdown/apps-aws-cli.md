### Установка AWS Command Line Interface на Windows

1. Установить AWS CLI с помощью командной строки:  
 `Win + R`: `cmd` → cmd.exe: `pip install awscli --upgrade --user`
2. Добавить путь к AWS CLI в переменную среды PATH:  
`Win + R`: `sysdm.cpl` → Дополнительно → Переменные&nbsp;среды...:&nbsp;Системные&nbsp;переменные: `Path` → Изменить...:
    1. Создать: `C:\Users\________\AppData\Roaming\Python\Python36\Scripts`
    2. Заменить `________` вашим именем пользователя, оно идет после `C:\Users\`, если открыть новую командную строку (`Win + R`: `cmd`)
3. Перезапустить командную строку:  
`Win + R`: `cmd`
4. Настроить AWS CLI:  
cmd.exe: `aws configure`
    1. AWS Access Key ID: `login` сервиса *Amazon AWS CLI* в [*SC_ Links*](https://airtable.com/tblKcJTlBYbotdmxp/viwAvlWxjNVh18QNE)
    2. AWS Secret Access Key: `password` сервиса *Amazon AWS CLI* в [*SC_ Links*](https://airtable.com/tblKcJTlBYbotdmxp/viwAvlWxjNVh18QNE)
    3. Default region name: `eu-central-1`
    4. Default output format > Skip

***

### Установка AWS Command Line Interface на Mac OS

Все команды из инструкции ниже необходимо запускать в Terminal.

1. Установить AWS CLI с помощью pip: `pip3 install awscli --upgrade --user`
2. Используя команду `pip3 show awscli`, найти параметр `Location`, который будет содержать путь к модулю, например: `./Library/Python/3.6/lib/python/site-packages`
3. Скопировать путь к модулю, заменив `lib/...` на `bin`, а `./` на `$HOME`, чтобы получить путь вида: `$HOME/Library/Python/3.6/bin`
4. Добавить путь к AWS CLI в переменную среды PATH:  
`echo 'export PATH=$HOME/Library/Python/3.6/bin:$PATH' >> ~/.bash_profile`
5. Обновить командную строку: `source ~/.bash_profile`
6. Проверить правильность установки с помощью `aws --version`
7. Настроить AWS CLI с помощью `aws configure`:
    1. AWS Access Key ID: `login` сервиса *Amazon AWS CLI* в [*SC_ Links*](https://airtable.com/tblKcJTlBYbotdmxp/viwAvlWxjNVh18QNE)
    2. AWS Secret Access Key: `password` сервиса *Amazon AWS CLI* в [*SC_ Links*](https://airtable.com/tblKcJTlBYbotdmxp/viwAvlWxjNVh18QNE)
    3. Default region name: `eu-central-1`
    4. Default output format > Skip

### Использование

Выдача всех путей по префиксу:

``` bash
aws s3api list-objects --bucket "BUCKET" --prefix "PREFIX" --query 'Contents[].Key'
```

Создание подписанного URL на 24 часа для скачивания:

``` bash
aws s3 presign 's3://arseny/movies/...' --expires-in 86400
```
