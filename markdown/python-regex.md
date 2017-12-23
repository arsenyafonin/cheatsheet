# Регулярыне выражения и работа с текстом

### RegEx

Базовые команды

``` python
import re

string = 'this is a test string!'

m = re.match('\w+\s\w+', string) # 'this is' from the beginning of string
s = re.search('\w+\s\w+!', string) # 'test string!' everywhere in the string
string = re.sub(' \w{2} ', ' was ', string) # 'this was a test string!'

if m: # Checks if string matches Regex
  print(m[0]) # Prints first match
```

Сложные выражения
``` python
code = 'SKC_20.19.03_L1_Basics.mp4'

m1 = re.match('^[A-Z]{3}_\d+\.\d+.\d+', code) # 'SKC_20.19.03'
m2 = re.match('L\d+(?:-\d+)*_[\w\. ]+\.mp4$') # 'L1_Basics.mp4'

# 'L\d+' → 'L1', 'L21'
# '(?:-\d+)*' → '', '-1', '-21', '-21-32'
# 'L\d+(?:-\d+)*' → 'L1', 'L1-2'
# '\w+' → 'Word'
# '[\w\. ]+' → 'Any word. Or space. Or dot'
# '\.mp4$' → '.mp4' at the end of line
```

Группировка
``` python
string = 'abab ded cfc'

m = re.match('(ab)+ \w+ (\w+)', string) # 'abab ded cfc'
m.group(1) # 'ab' (in first parenthesis)
m.group(2) # 'cfc' (in second parenthesis)

m = re.match('(?:ab)+ \w+ (\w+)', string)
m.group(1) # 'cfc' (first parenthesis are omitted because of ?
```

Кодировка
``` python
string = 'Вот она строчка!'
m = re.match('[\w ]+!', string, re.U) # По умолчанию Unicode
print(bool(m)) # Вернет True

m = re.match('[\w ]+!', string, re.A) # Но можно искать ASCII
print(bool(m)) # Вернет False
```

### Titlecase

``` python
from titlecase import titlecase

titlecase('Loath and fear in USSR') # Вернет 'Loath and Fear in USSR'
```
