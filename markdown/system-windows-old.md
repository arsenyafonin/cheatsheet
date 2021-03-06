1. Настройка Taskbar:
    1. Изменение иконок значков: Shift+Right Click > Свойства + Winaero Tweaker > Tools: Icons Cache Reset
    2. Изменение прозрачности панели via Winaero Tweaker
    3. Отключение thumbnails
    4. Отключение лишних кнопок
2. Настройка Проводника:
    1. Старт с This PC
    2. Настройка This PC via Winaero Tweaker
    3. Deleting OneDrive link via regedit: ...
    4. Домашняя группа?
3. Изменение иконок по умолчанию с помощью regedit:
    1. [Папок](https://www.ampercent.com/how-to-change-default-folder-icon-in-windows-10-without-any-software/16780/)
    2. [Дисков](http://winaero.com/blog/change-drive-icon-in-windows-10-with-a-custom-ico-file/)
    3. [Различных типов файлов](http://www.nirsoft.net/utils/file_types_manager.html):
        1. .bat
        2. .jpeg, .jpg, .png, .tif, .tiff, .gif, .bmp
4. Изменение размеров скроллов и меню
5. Восстановление классического Alt-Tab меню через Winaero
6. Изменение иконок часто используемых программ:
    1. Установить местоположение .exe-файла программы
    2. Определить, какой утилитой запакован .exe-файл с помощью утилиты PEiD (поле EP Section)
    3. Распаковать .exe-файл с помощью соответствующей утилиты, например для UPX:  
    установить upx.exe и выполнить в cmd.exe: `upx -d -o Original_unpacked.exe Original.exe`
    4. Изменить иконку распакованного .exe-файла с помощью Resource Hacker
    5. Сделать bak-копию оригинального .exe-файла и сохранить новый .exe под оригинальным именем
7. Установка:
    1. LightShot
8. Удаление значков для ярлыка via Winaero Tweaker
9. Измение значка для «Быстрого доступа» via Winaero Tweaker
10. Отключение подписей значков рабочего стола via Window FX
11. Установка утилиты [RBTray](http://rbtray.sourceforge.net/) для сворачивания в трей кликом правой кнопки по кнопке «Свернуть». После установки необходимо добавить утилиту в автозагрузку при старте системы.

### Настройка иконок

#### Изменение системных значков

Персонализация > Темы > Сопутствующие параметры > Параметры значков рабочего стола:

1. Этот компьютер > `shut_down_with_computer.ico`
2. Корзина (полная) > `copland-4-recycle-bin.ico`
3. Корзина (пустая) > `copland-4-recycle-bin.ico`

#### Изменение значков программ

С помощью Resource Hacker:

1. NexusFile.exe > `briefcase.ico`
2. Simplenote.exe > `template_empty.ico`

#### Изменение значков ярлыков рабочего стола

Свойства > Ярлык > Сменить значок...:

1. sleep.lnk (hypernate.bat) > `monitor_moon.ico`
2. turnoff.lnk (turnoff.bat) > `battery.ico`
3. Anaconda Navigator.lnk > `expand_hierarchial_array.ico`
4. HandBrake.lnk > `multimedia.ico`
5. Skype.lnk > `modem.ico`
6. Winaero Tweaker.lnk > `clean_drive.ico`
