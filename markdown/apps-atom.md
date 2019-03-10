## Базовые настройки

Настройка дружелюбных тем:

* File/Settings/Themes > Choose a Theme > UI Theme: One Light
* File/Settings/Themes > Choose a Theme > Syntax Theme: One Light

Настройка проверки правописания для русского языка:

* Packages/Spell Check > Settings > Locales: `en-US, ru-RU`

!!! warning "Внимание"
    В Atom на Mac OS включение Spell Check вызывает крэш Атома. На момент написания документации проблема не решена, подробнее вот [тут](https://github.com/atom/atom/issues/15912).

Отключение Welcome вкладок при старте:

* Packages/Welcome > Disable

Добавление Atom в контекстное меню (только Windows):

* File/Settings/System > System Settings > Show in file context menus: true
* File/Settings/System > System Settings > Show in folder context menus: true

Настройка текстового редактора:

* File/Settings/Editor > Editor Settings > Invisibles > Preferred Line Length: 100
* File/Settings/Editor > Editor Settings > Invisibles > Soft Wrap: true
* File/Settings/Editor > Editor Settings > Invisibles > Soft Wrap At Preferred Line Length: true

## Packages

Добавить следующие плагины:

* Hydrogen
* atom-beautify
* file-icons
* language-autohotkey2 (только на Windows)
* split-diff

Добавление [поддержки синтаксиса AutoHotkey](https://github.com/cescue/language-autohotkey) (Windows):

* `cmd.exe`: `apm install language-autohotkey2`

## Shortcuts

!!! warning "Внимание"
    Синхронизация настройек Atom в дальнейшем должна происходить с помощью копии, созданной системным демоном, а не из описания в этом документе.

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
