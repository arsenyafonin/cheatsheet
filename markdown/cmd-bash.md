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

Проверка путей для поиска модулей Python:
``` cmd
python -c "import sys; print('\n'.join(sys.path))"
```

### Bash

Изменение текущей директории на директорию скрипта:
``` bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR=$(printf %q "$DIR")
eval cd $DIR
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

### Работа с ffmpeg

Обрезка видеозаписей без конвертации с помощью ffmpeg возможна, однако не всегда работает корректно. Первый вариант обрезает видео по keyframe, а аудио по заданным параметрам, таким образом если keyframe не попадает на начало обрезанного отрезка, фрагмент до keyframe заполняется пустотой. Возможный вариант ухода от проблемы — поиск оптимального с точки зрения keyframe начала обрезки:
``` bash
ffmpeg -i input.mp4 -ss hh:mm:ss -c copy -to hh:mm:ss output.mp4
```

Второй вариант обрезает видео более аккуратно, однако на видео возможно появление артефактов и искажений:
``` bash
ffmpeg -ss hh:mm:ss -i input.mp4 -to hh:mm:ss -c copy output.mp4
```

Третий вариант предполагает обрезку видео с конвертацией с теми же настройками, в этом случае существенной экономии времени не будет:
``` bash
ffmpeg -i input.mp4 -ss 00:mm:ss -to hh:mm:ss output.mp4
```

Выделение аудиодорожки:
``` bash
ffmpeg -i input.mp4 -vn -acodec copy audio.aac
```

Добавление аудиодорожки:
``` bash
ffmpeg -i input.mp4 -i audio.m4a -map 0:0 -map 1:0 output.mp4
```

### Работа с mediainfo

Проверка параметров видеофайла производится по перечню параметров из txt-файла в&nbsp;той же директории или непосредственным заданием в параметре `--Inform=`.
``` bash
@cd %~dp0
@mediainfo --Inform=file://mediainfo-paramerts.txt "video file.mov"
@PAUSE
```

``` bash
mediainfo --Inform="General;Filename: %CompleteName%" "video file.mov"
```

Содержание txt-файла должно содержать параметры и начинаться с категории (`General;` или `Video;`). Сами параметры обрамляются знаками `%`. Вот примерное содержание файла:
``` txt
General;Filename: %CompleteName%\nFormat: %Format%\n
Video;Pixel Format: %ChromaSubsampling%\nColor Space: %ColorSpace%"
```

Полный перечень параметров можно получить командой:
``` bash
mediainfo --info-parameters
```
