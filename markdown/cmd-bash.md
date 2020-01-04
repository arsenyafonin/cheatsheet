# Shell-скрипты

## Command Prompt

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

## Bash

Изменение текущей директории на директорию скрипта:
``` bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR=$(printf %q "$DIR")
eval cd $DIR
```

## Любая оболочка

Конвертация .ipynb в .py-скрипт:

``` bash
jupyter nbconvert --to script notebook_title.ipynb
```

Работа с git:

``` bash
git remote -v # Show remote URL
git remote set-url origin https://github.com/USERNAME/REPOSITORY.git # Change 'origin' remote URL
git push origin master # Push to master branch of 'origin' remote URL
```

``` bash
git ls-tree -r master --name-only # Show all tracked files
git check-ignore * # Show ignored files
```

``` bash
# Change Github Release to latest commit
git tag -f -a <tagname> -m "Any text" # <tagname> is Release version, e.g. v3.0
git push -f --tags
```

## Работа с ffmpeg

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

Снятие DRM-защиты с Audible аудиокниги:
``` bash
# AUTHCODE for fettti@yandex.ru: 7db62636
ffmpeg -activation_bytes AUTHCODE -i input.aax -c copy output.m4b
```

Вычислить AUTHCODE получилось с помощью [плагина](https://github.com/inAudible-NG/tables) на RainbowCrack, используя `rcrack.exe` с Wine на Mac OS, предварительно переместив rainbow tables (.rtc) из корня в папку `run`.

Удаление лишних стримов или конвертация аудиокниги:
``` bash
ffmpeg -i audiobook.m4b -map 0:0 -c copy output.m4b # экспорт стрима '0' с главами
ffmpeg -i audiobook.m4b -map 0:0 -c:a aac -b:a 128k output.m4b # конвертация стрима '0' в 128 kbps
```

## Работа с mp4v2

Установка:
``` bash
brew install mp4v2
```

Работа с главами (последовательность важна):
``` bash
mp4chaps -l audiobook.m4b # Вывод глав
mp4chaps -x audiobook.m4b # Экспорт глав в файл audiobook.chapters.txt
mp4chaps -r audiobook.m4b # Удаление всех глав
mp4chaps -i audiobook.m4b # Импорт глав из файла audiobook.chapters.txt в той же директории
```

## Работа с AtomicParsley

Вывод информации о файле:
``` bash
AtomicParsley audiobook.m4b -t
```

Работа с обложкой:
``` bash
AtomicParsley audiobook.m4b --artwork REMOVE_ALL # удаление всех обложек
AtomicParsley audiobook.m4b --artwork cover.png --overWrite # добавление обложки (.png, 600×600)
AtomicParsley audiobook.m4b --extractPix # экспорт обложки в директорию книги
```

Работа с тэгами:
``` bash
AtomicParsley audiobook.m4b --metaEnema # Удаление всех тэгов

AtomicParsley audiobook.m4b --artist "{author}" \ # Имя Фамилия автора
  --albumArtist "{narrator}" \ # Имя Фамилия нарратора
  --title "{title}" --album "{title}" \ # Название книги
  --year {YYYY} \ # Год выпуска аудиокниги (или печатной)
  --genre "Audiobook" \
  --stik value=2 \ # 'Kind of Media' тэг для iTunes
  --description "made by highandmighty" \
  --overWrite # Перезапись исходного файла
```

## Работа с metaflac и shntool

Экспорт обложек файлов .flac:
``` bash
metaflac --export-picture-to="cover.jpg" "file.flac" # Один файл

# Цикл по всем файлам .flac в директории
for i in *.flac; do
    [ -f "$i" ] || break
    metaflac --export-picture-to="${i/.flac/.jpg}" "$i"
done
```

Деление .flac-файла по .cue-sheet:
``` bash
shnsplit -f input.cue -o flac input.flac
```

## Работа с mediainfo

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

## Работа с pandoc

Конвертация Markdown в InDesign .icml:
``` bash
pandoc -s -f markdown -t icml -o "output file.icml" "input file.md"
```

***

По умолчанию Pandoc использует Setext-style headers, которые в теории допускают заголовки в две строчки. При выборе ATX-style headers (`--atx-headers`) заголовки в две строчки невозможны в принципе.

При наличие в документе media-файлов возможно сохранение файлов в папку `media` в директории документа опцией `--extract-media=""`.

Конвертация .docx в Markdown:
``` bash
pandoc -s -f docx -t markdown -o "output file.md" --atx-headers --wrap=none --extract-media="" "input file.docx"
```

Создание .epub из Markdown документа требует двух файлов: текста документа в Markdown и YAML-файла с метаданными (`metadata.txt`). Использование подзаголовка в метаданных поддерживает только EPUB 3:
``` bash
pandoc --atx-headers -t epub3 -o mybook.epub metadata.txt content.md
```

``` yaml
---
title:
- type: main
  text: Второй цифровой переворот
- type: subtitle
  text: Проектирование за пределами разума
creator:
- role: author
  text: Марио Карпо
rights: softculture.cc
language: ru-RU
...
```

## Работа с magick

Конвертация .pdf в .png:
``` bash
magick convert -alpha off -density 600 -resize x1080 -depth 8 -quality 85 input.pdf output.png
```

Тест одной страницы:
``` bash
magick convert input.pdf[1] output.png
```

## Создание образа диска (Mac OS)

Вывод всех доступных дисков:
``` bash
diskutil list
```

Создание образа диска:
``` bash
sudo diskutil unmount /dev/diskХ
dd if=/dev/diskХ of=output.iso # Может занять до 30 минут
diskutil eject /dev/diskX # Извлечение диска
```
