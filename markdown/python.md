# Работа с файлами с os и sys

Для большинства команд необходима загрузка модуля `os`:
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
