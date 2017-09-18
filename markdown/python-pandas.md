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

### Фильтрация данных

Использование масок:
``` python
df = df[df['date_col'] == 'value'] # Выбор по без маски

mask_1 = df['col_1'] == 'value_1'
mask_2 = df['col_2'] < 'value_2'
df_new = df[mask_1 & mask_2].copy() # Выбор с масками
```

Работа с временными данными:
``` python
mask_date = df['date_col'] > '2016-02-01' # Выбор по дате

month = 7
mask_date = df['date_col'].dt.strftime('%m').astype(int) == month
# Выбор по месяцу (%m), году (%Y) и пр.

df['month'] = pd.to_datetime(df['date_col'].dt.strftime('%Y-%m-') + '01',\
                             format='%Y-%m-%d')
# Вычленение месяца из даты
```

Обработка NA:
``` python
df.dropna(axis=0, how='any', subset=['col_1', 'col_2'], inplace=True)
# Удаление рядов с NA в колонках
```

### Дополнение внешними аттрибутами
``` python
def attrFinder(key, attrDic, attrNum):
    if key in attrDic:
        return attrDic[key][attrNum]
    else:
        return attrDic[0][attrNum]

attr_dict = {1: ['attr_A_1', 'attr_B_2', 3], # Послденим идет аттрибут позиции
            2: ['attr_A_2', 'attr_B_1', 1],
            3: ['attr_A_3', 'attr_B_1', 2],
            0: ['attr_A_default', 'attr_B_default', 4]}

df['attr_A_col'] = df['key_col'].apply(attrFinder, args=(attr_dict, 0,))

df['position_col'] = df['key_col'].apply(attrFinder, args=(attr_dict, 3,))
df.sort_values('position_col', inplace=True) # Сортировка по аттрибуту позиции
```
