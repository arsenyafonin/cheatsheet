# Импорт модулей

Импорт пользовательских модулей:
``` python
import airtable_parser
import xml_parser
import courses_functions
import s3_functions
import sugar
import grid

help(sugar)
```

Проверка путей к модулям:
``` python
import sys
print('\n'.join(sys.path))
```

Импорт библиотеки с модулями  
(неактуально при наличие пути к модулям в PYTHONPATH):
``` python
import sys
sys.path.append('C:/Users/user/Google Диск/_codes/modules/')
```

Загрузка отдельных классов:
``` python
from xml_parser import xmltodataframe
from sugar import path
from courses_functions import *
```
