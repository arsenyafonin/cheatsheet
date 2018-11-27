# Импорт данных

## Airtable

Получение данных из Airtable:
``` R
library(dplyr)
library(httr)
library(jsonlite)

AT_TOKEN = "*************"
AT_BASE = "https://api.airtable.com/v0/app5gby0DG3pF9KbB/"
AT_TABLE = "all"

call_airtable = function(base, table, token, query) {
  url = paste0(base, table)
  r = GET(url, add_headers(Authorization=paste0("Bearer ", token)), query=query)
  if (status_code(r) == 429) {
    print("Airtable API limit reached, 30 seconds break")
    Sys.sleep(30)
    r = rerequest(r)
  }
  return(fromJSON(content(r, as="text", encoding="UTF-8")))
}

fetch_airtable = function(..., query=list()) {
  json = call_airtable(..., query=query)
  df = json$records
  df = flatten(df)
  colnames(df) = gsub("fields.", "", colnames(df))

  if ("offset" %in% names(json)) {
    df_nextpage = fetch_airtable(..., query=list(offset=json$offset))
    return(bind_rows(df, df_nextpage))
  } else {
    return(df)
  }
}

at = fetch_airtable(AT_BASE, AT_TABLE, AT_TOKEN)
```

## Amazon S3

Загрузка feather-файлов:
``` R
library(feather)

download_feather = function(url) {
  temp = tempfile()
  on.exit(unlink(temp)) # removes temp file after function returns value
  download.file(url, temp, mode="wb")
  return(read_feather(temp))
}

courses_url = "http://d35raauzs56ob1.cloudfront.net/data/exports/courses.feather"
courses = download_feather(courses_url)
```
