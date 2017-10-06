# Shell-скрипты

### Command Prompt

Пауза в случае ошибки исполнения команды:
``` cmd
@if NOT ["%errorlevel%"]==["0"] pause
```

Изменение текущей директории на директорию скрипта:
``` cmd
@cd %~dp0
```

### Любая оболочка

Конвертация .ipynb в .py-скрипт:

``` bash
jupyter nbconvert --to script notebook_title.ipynb
```

Работа с git:

``` bash
git ls-tree -r master --name-only # Show all tracked files
git check-ignore * # Show ignored files
```
