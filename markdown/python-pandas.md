# Анализ данных с модулем pandas

### Загрузка данных

Импорт данных из pickle файлов:

``` python
import pandas as pd

pickle_path = 'C:/Users/user/Google Диск/pickle_file.pkl'
df = pd.read_pickle(pickle_path)
```

``` python
import pandas as pd
import requests
from io import BytesIO

pickle_url = 'https://example.com/pickle_file.pkl'
r = requests.get(pickle_url).content

df = pd.read_pickle(BytesIO(r))
```

### Описание данных
``` python
df.head()
df.head(n=5) # Вернет первые 5 рядов
df.tail()

df.dtypes # Вернет описание типов данных по колонкам
df.columns # Вернет список всех колонок фрейма
```

### Преобразование данных

Преобразование колонок:
``` python
df = DataFrame(data, columns=['A', 'B', 'C'])

colnames = {
    'A': 'A_new',
    'B': 'B_new',
    'D': 'D_new'
}

df.rename(index=str, columns=colnames, inplace=True)
df.columns # Вернет ['A_new', 'B_new', 'C']

df = df.reindex_axis(sorted(df.columns), axis=1) # Сортировка колонок

df.drop('С', axis=1, inplace=True) # Удаление колонки 'С'
```

Обработка данных:
``` python
df['A'].fillna(df['B'], inplace=True) # Замена пропусков 'А' данным из 'B'
```
