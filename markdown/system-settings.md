
Настройки, которые нельзя выполнить через System Preferences, необходимо исполнять через Terminal.

***

Отключение bouncing при оповещениях для приложений в Dock:
``` Bash
defaults write com.apple.dock no-bouncing -bool TRUE
killall Dock
```
***

Изменение настроек anti-aliasing для Mac OS Mojave ([подробности тут](https://www.reddit.com/r/apple/comments/9inu3e/if_the_font_rendering_on_mojave_looks_odd_to_you/)):

1. убедитесь, что в `System Preferences/General` включена настройка `Use font smoothing when available`
2. запустите: `defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO`
3. перезагрузите систему.
