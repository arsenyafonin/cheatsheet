# Работа с файлами

## os и glob

Базовый функционал:
``` python
import os

folder = 'C:/Users/user/Google Диск/SC_Admin/'
filename = 'README.md'
filepath = 'C:/Users/user/Google Диск/SC_Admin/README.md'

filepath = os.path.join(folder, filename)
```

Изменение текущей директории на директорию скрипта:
``` python
folder = os.path.dirname(os.path.realpath(__file__))
os.chdir(folder)

print(os.getcwd())
```

Проверка наличия файла в системе:
``` python
if os.path.isfile(filepath):
  ...
```

Поиск файлов определенного расширения в текущей директории:
``` python
import glob
for filename in glob.glob("*.zip"):
  print(filename)
```

Удаление файла:
``` python
os.unlink(filepath)
```

Удаление директории:
``` python
# Вариант 1: уверенный
from subprocess import call

if os.path.isdir(path):
  call(("rmdir /S /Q \"" + path + "\""), shell=True)

# Вариант 2: не работает с read-only файлами и папками
import shutil

if os.path.isdir(path):
  shutil.rmtree(path)
```

***

## io

Базовый функционал:

``` python
import io

bytes_buffer = io.BytesIO() # Создание бинарного файла в RAM
bytes_buffer.write(...) # Запись данные в файл
print(bytes_buffer.tell()) # Печать размера файла, вернет реальный размер

bytes_buffer.seek(0) # Перемещение к началу файла
print(bytes_buffer.tell()) # Вернет 0

bytes_buffer.read() # Чтение данных из файла с последнего места до конца
print(bytes_buffer.tell()) # Вернет реальный размер

bytes_buffer.close() # Закрытие файла для записи или чтения
```
