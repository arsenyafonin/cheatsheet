# Работа с Pipenv

Создание нового проекта:
``` cmd
cd my-project
pipenv install
```


Установка необходимых модулей:
``` cmd
pipenv install requests
pipenv install pyinstaller
```


Запуск команды в среде проекта:
``` cmd
pipenv run python script.py
pipenv run pyinstaller --onefile --console -i icon.ico script.py
```
