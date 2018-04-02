# Анализ данных с модулем pandas

## Загрузка данных

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
Импорт из .xlsx:
``` python
from useful_functions import path

xls_path = path(r'C:\Users\user\Google Диск\test.xlsx')
colnames = ['A', 'B', 'C', 'D']
df = pd.read_excel(xls_path, header=7, skiprows=[8], names=colnames)
```

Экспорт в .xlsx:
``` python
from useful_functions import path, exportxlsx

folder_path = path(r'C:\Users\user\Google Диск')
# Путь вида 'C:/Users/user/Google Диск'
exportxlsx(df, folder_path, 'filename.xls')
```

## Описание данных
``` python
df.head()
df.head(n=5) # Вернет первые 5 рядов
df.tail()

df.dtypes # Вернет описание типов данных по колонкам
df.columns # Вернет список всех колонок фрейма
df.index # Вернет индексы фрейма
len(df.index) # Кол-во рядов
```

Базовые концепции
``` python
+------------+---------+--------+
|            |  A      |  B     |
+------------+---------+---------
|      0     | 0.626386| 1.52325|----axis=1----→
+------------+---------+--------+
                |         |
                | axis=0  |
                ↓         ↓

df.mean(axis=1)
> 0    1.074821

df.mean(axis=0)
> A    0.626386
> B    1.523255
```

## Базовые преобразования

Работа с индексами:
``` python
df.set_index('id', drop=True, inplace=True, verify_integrity=True)
# Создание индекса и удаление колонки
df.index.name = None # Удаление названия колонки индекса

df.sort_index(inplace=True) # Сортировка по индексу
df.reset_index(drop=True, inplace=True)
# Параметр drop=False превратит индекс в колонку

df.drop(index_list, inplace=True) # Удаление рядов с определенным индексом
```

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

df.drop(['B', 'С'], axis=1, inplace=True) # Удаление колонки 'С'

df.insert(9, 'D', column_series) # Добавление колонки в определенное место
```

Преобразование рядов:
``` python
df.sort_values(['A', 'B'], ascending=[False, False], inplace=True)
df.sort_values(['A', 'B'], ascending=[False, False], inplace=True)

df.loc[indexes] # Выделение рядов по индексу/индексам
df.iloc[n] # Выделение по порядковому номеру
```

Обработка NA:
``` python
df[['A', 'B']].fillna(value=0, inplace=True) # Замена пропусков значением '0'

df['A'].fillna(df['B'], inplace=True) # Замена пропусков 'А' данным из 'B'
```

Работа с данными:
``` python
df['A'].where(df['B'] != 1000, 0, inplace=True)

from numpy import where
df['A'] = where(df['B'] == 0, "A", "B")
df['B'] = where(df['A'] > 0, series_A, series_B)

from numpy import around
df['A'] = around(df['A'],-2) # Округление до 100
```

Цикл по рядам:
``` python
for index, row in df.iterrows():
  print(index)
  print(row['A'])
```

## Фильтрация данных

Использование масок:
``` python
df = df[df['date_col'] == 'value'] # Выбор по без маски

mask_1 = df['col_1'] == 'value_1'
mask_2 = df['col_2'] < 'value_2'
df_new = df[mask_1 & mask_2].copy() # Выбор с масками
df_new = df[mask_1 | mask_2].copy() # Выбор с масками

mask_null = pd.isnull(df['A'])
not_null = df[~mask_null].copy()

mask_dup = df.duplicated(subset=['A'], keep=False)
df[mask_dup]
```

Работа с временными данными:
``` python
df['date'] = pd.to_datetime(df['string'], format='%m/%d/%Y %H:%M:%S')
df['string'] = df['date'].dt.strftime('%b %Y')

df['delta'] = (today - df['date']).dt.days

mask_date = df['date'] > '2016-02-01' # Выбор по дате

month = 7
mask_date = df['date'].dt.strftime('%m').astype(int) == month
# Выбор по месяцу (%m), году (%Y) и пр.

df['month'] = pd.to_datetime(df['date'].dt.strftime('%Y-%m-') + '01',\
                             format='%Y-%m-%d')
# Вычленение месяца из даты
```

Обработка NA:
``` python
df.dropna(axis=0, how='any', subset=['col_1', 'col_2'], inplace=True)
# Удаление рядов с NA в колонках
```

## Агрегирование данных

Одной строкой:
``` python
df_stats = df.groupby(['A']).agg({'B': np.sum})
df_stats.index.name = None # Удаление названия колонки индекса
```
Несколькими строками:
``` python
df_stats = df.groupby(['A', 'B']).agg({'C': ['count','sum'],
                                        'D': [np.mean, np.max]
                                      }).reset_index()
```

Объединение данных:
``` python
df_full = pd.concat([df_1, df_2], axis=1, join_axes=[df_1.index])
# Дополнение данных из первой таблицы данными второй по индексу
```

## Дополнение внешними атрибутами

Применение функции поэлементно:
``` python
def function(string):
    if string != string: # Проверка на NaN
        return np.nan
    else:
        return string + '2'

df['new'] = df['old'].apply(function) # Применение обычной функции поэлементно

df['is_url'].apply(lambda x: str(x).startswith('http'))
# Применение lambda-функции

df['B'] = df['A'].map(lambda s: s*2, na_action='ignore') # Проверить!
```

Применение функции к рядам:
``` python
def function(row):
    return row['A'] + row['B']

df['C'] = df.apply(function, axis=1)
```

Дополнение атрибутами:
``` python
def attrFinder(key, attrDic, attrNum):
    if key in attrDic:
        return attrDic[key][attrNum]
    else:
        return attrDic[0][attrNum]

attr_dict = {1: ['attr_A_1', 'attr_B_2', 3], # Последним идет атрибут позиции
            2: ['attr_A_2', 'attr_B_1', 1],
            3: ['attr_A_3', 'attr_B_1', 2],
            0: ['attr_A_default', 'attr_B_default', 4]}

df['attr_A_col'] = df['key_col'].apply(attrFinder, args=(attr_dict, 0,))

df['position_col'] = df['key_col'].apply(attrFinder, args=(attr_dict, 3,))
df.sort_values('position_col', inplace=True) # Сортировка по атрибуту позиции
```

## Сложные операции с индексами

Сравнение таблиц по индексу
``` python
intersect = df_1.index.intersection(df_2.index)
# Вычленение общих для двух таблиц индексов
second_only = df_2.index.difference(df_1.index)
# Индексы, присутствующие только во второй таблице
df_2.loc[second_only]
# Ряды, присутствующие только во второй таблице (slice)

new_1 = df_1.loc[intersect].copy()
# Выделение рядов по индексам и создание копии
new_2 = df_2.loc[intersect].copy()

mask_changed = (new_1 != new_2).any(1)
# Маска по рядам на различия хотя бы в одной колонке
# Обе таблицы должны быть одного размера, иметь одинаковые индексы
# и быть отсортированы по ним

new_2[mask_changed]
# Измененные по сравнению с первой таблицей ряды
```
