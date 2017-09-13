Настройка дружелюбных тем:

* File/Settings/Themes > Choose a Theme > UI Theme: One Light
* File/Settings/Themes > Choose a Theme > Syntax Theme: One Light

Настройка проверки правописания для русского языка:

* Packages/Spell Check > Settings > Locales: `en-US, ru-RU`

Отключение Welcome вкладок при старте:

* Packages/Welcome > Disable

Устранение конфликта горячих клавиш и [раскладки Бирмана](http://ilyabirman.ru/projects/typography-layout/) на Windows:

* File/Keymap... > Добавить в конец файла `keymap.cson`:

``` json
"atom-workspace atom-pane": {
  "ctrl-alt--": "unset!"
}

".platform-win32 atom-text-editor": {
  "ctrl-alt-,": "unset!",
  "ctrl-alt-.": "unset!"}
```

Добавление горячих клавиш для навигации между вкладками:

* File/Keymap... > Добавить в конец файла `keymap.cson`:

``` json
"body": {
  "alt-d": "pane:show-previous-item",
  "alt-f": "pane:show-next-item"}
```
