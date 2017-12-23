# Работа с другими базовыми модулями

## os и sys

Переменные среды:
``` python
import os

if 'ACCESS_KEY' in os.environ:
    print("Super")
    print(os.environ['ACCESS_KEY'])
else:
    print("Nope")

secret_key = os.environ.get('SECRET_KEY', '123')
# Если 'SECRET_KEY' отсутствует в среде, то возвращается '123'
```

Изменение переменной PYTHONPATH
``` python
import sys

sys.path.append('C:/Users/user/Google Диск/_codes/modules/')
# Добавление пути к модулю в PYTHONPATH действительно только на время сессии
```

Проверка ОС
``` python
from sys import platform

if platform == "win32":
    os.system('dir') # Windows script
elif platform == "darwin":
    os.system('ls') # OS X script
```


## datetime

Базовый функционал:

``` python
import datetime as dt

date = dt.datetime.strptime('2017-12-31', '%Y-%m-%d')

today_date = dt.date.today() # Today date
today_timestamp = dt.datetime.today() # Today date

delta = (today_date - date.date()).days
delta = (today_timestamp - date).days
# Оба варианта корректны

yesterday = today - dt.timedelta(days=1)

now = dt.datetime.now() # Now timestamp
now.date() # Returns date only
now.isoweekday() # Вернет номер дня недели (Monday is 1 and Sunday is 7)
```

Конвертация в строки и обратно:
``` python
now_string = now.strftime("%d-%m-%Y %H:%M:%S")
# DD-MM-YYYY HH:MM:SS string representation

date = dt.datetime.strptime(date_string, '%Y-%m-%dT%H:%M:%S')
```

Работа с временными зонами:
``` python
from pytz import timezone

tz = timezone('Europe/Moscow')
now = dt.datetime.now(tz)
now = now.replace(tzinfo=None)
```

## subprocess

Базовый функционал:
``` python
from subprocess import call

call("start notepad.exe", shell=True)
# call возвращает exit-код команды, т.е. 0 в случае успешного исполнения
```

``` python
import subprocess

command = "echo hello world"
s = subprocess.run(command, shell=True, \
                    stderr=subprocess.PIPE, stdout=subprocess.PIPE, \
                    check=False)

output = s.stdout.decode('cp1251').strip()
# by default string ends new line (\r\n)
error = s.returncode
# returns 0 if scripts finished without errors
```

## termcolor

Использование цвета в коммандной строке:

``` python
from termcolor import colored
from colorama import init
init()

print(colored('doing something...', 'white'), end=' ')
print(colored('done', 'green'))
```
