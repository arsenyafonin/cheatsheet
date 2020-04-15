
Настройки, которые нельзя выполнить через System Preferences, необходимо исполнять через Terminal.

***

Отключение bouncing при оповещениях для приложений в Dock:
``` Bash
defaults write com.apple.dock no-bouncing -bool TRUE
killall Dock
```
***

Изменение настроек anti-aliasing для Mac OS Catalina ([подробности тут](https://www.reddit.com/r/apple/comments/9inu3e/if_the_font_rendering_on_mojave_looks_odd_to_you/)):

1. убедитесь, что в `System Preferences/General` включена опция `Use font smoothing when available`;
2. запустите: `defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO`;
3. перезагрузите систему;
4. отключите опцию `Use font smoothing when available`.

Как проверить, что все работает как надо? Откройте Finder — отображение шрифтов должно быть аккуратным и гладким. А теперь откройте Photoshop и попытайтесь открыть любой файл — во вновь появившемся окне Finder отображение шрифтов должно быть таким же. В случае, если трюк не сработал, в втором окне Finder шрифты будут несглаженными.

***

Чтение конфигурации LaunchPad из файла настроек:

1. откройте папку с бэкапом базы конфигурации LaunchPad или найдите путь оригинальной папки в системе командой:  
`echo $(find /private/var/folders -user $(id -u) -name com.apple.dock.launchpad 2> /dev/null)/db`
2. откройте терминал в этой папке и запустите скрипт для чтения базы:  
`sqlite3 -separator ' | ' db "SELECT parent_id, ordering, apps.title, apps.item_id FROM items JOIN apps ON items.rowid = apps.item_id ORDER BY parent_id, ordering;"`

Все приложения LaunchPad будут сгруппированы по экранам или группам (первая колонка), порядок приложений внутри экрана/группы будет обозначен числом во второй. Четвертая колонка — `item_id` приложения. К сожалению, восстанавливать порядок по бэкапу базы данных не очень безопасно, поэтому в случае обнуления LaundPad порядок приложений придется восстанавливать вручную.

Чтобы удалить приложение из базы используйте скрипт чтения базы, найдите `item_id` приложения (`N`), которое хотите удалить, а дальше запустите следующую команду:  
`sqlite3 db "DELETE FROM apps WHERE item_id = 'N';" && killall Dock`

Для переименования проложений с длинными названиями, используйте `item_id` приложения (`N`) из скрипта чтения и следующую команду:  
`sqlite3 db "UPDATE apps SET title = 'Photoshop CC 2019' WHERE item_id = 'N';" && killall Dock`

***

Изменение параметров LaunchPad:

1. измените количество рядов:  
`defaults write com.apple.dock springboard-rows -int 6 && killall Dock`
2. измените количество колонок:  
`defaults write com.apple.dock springboard-columns -int 8 && killall Dock`
3. устранить blur у фона:
`defaults write com.apple.dock springboard-blur-radius -int 0 && killall Dock` *(не работает)*
