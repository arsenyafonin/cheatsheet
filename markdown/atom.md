### Базовые настройки

Настройка дружелюбных тем:

* File/Settings/Themes > Choose a Theme > UI Theme: One Light
* File/Settings/Themes > Choose a Theme > Syntax Theme: One Light

Настройка проверки правописания для русского языка:

* Packages/Spell Check > Settings > Locales: `en-US, ru-RU`

Отключение Welcome вкладок при старте:

* Packages/Welcome > Disable

Изменение базовых настроек (Windows):

* File/Settings/System > Show in file context menus > Enable
* File/Settings/System > Show in folder context menus > Enable

### Shortcuts

Добавление горячих клавиш для навигации между вкладками:

* File/Keymap... > Добавить в конец файла `keymap.cson`.

Windows:
``` json
"body": {
  "alt-d": "pane:show-previous-item",
  "alt-f": "pane:show-next-item"}
```

Mac OS:
``` json
".platform-darwin": {
  "cmd-t": "unset!"
}

"body": {
  "cmd-d": "pane:show-previous-item",
  "cmd-f": "pane:show-next-item"
}
```

Устранение конфликта горячих клавиш и [раскладки Бирмана](http://ilyabirman.ru/projects/typography-layout/) на Windows:

``` json
"atom-workspace atom-pane": {
  "ctrl-alt--": "unset!"
}

".platform-win32 atom-text-editor": {
  "ctrl-alt-,": "unset!",
  "ctrl-alt-.": "unset!"}
```

### Плагины

Личный список плагинов:

* ...

Добавление [поддержки синтаксиса AutoHotkey](https://github.com/cescue/language-autohotkey) (Windows):

* `cmd.exe`: `apm install language-autohotkey2`
