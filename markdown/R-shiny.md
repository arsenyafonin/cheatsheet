# Библиотека Shiny

## Проверка пароля

`app.R`
``` R
library(shiny)
library(shinyjs)
library(openssl)
library(promises)
library(future)
plan(multiprocess)

source("airtable-functions.R")
source("passchecker-functions.R")

AT_TOKEN = "***************"

# UI
ui = fluidPage(
  includeCSS("styles.css"),
  useShinyjs(),
  extendShinyjs(text = js_code),
  tags$script(js_enter),
  fluidRow(
    column(12, div(style="height: 30px", img(src="loader.gif", width = "30px", height = "30px"))),
    id="loader"
    ),
  fluidRow(
    column(4, textInput(inputId="password", label="Введите личный пароль и нажмите Enter:", placeholder = "my password")),
    id="password-input"
  )
)

# Server
server = function(input, output) {
  # Asyncronous passwords retrieval
  future({airtable_passes(AT_TOKEN)}) %...>% {
    assign("PASSWORDS", ., envir = .GlobalEnv) # PASSWORDS in global env
    js$getPassword()
  }

  # Password validation
  observeEvent(input$temppass, {
    if (!is.null(input$temppass) && exists("PASSWORDS")) {
      if (input$temppass %in% PASSWORDS) {
        js$log(paste('login successful: ', input$temppass))
        hide("password-input")
        showNotification('Logged in successfully', type = "message", duration = 3)
        # ...
      } else if (input$temppass == 'NA') {
        # First login
        hide("loader")
        show("password-input")
      } else {
        # Wrong password
        showNotification('Invalid password', type = "error", duration = 3)
      }
    }
  })

  # Password enter
  observeEvent(input$enterkey, {
    input = tolower(input$password)
    encrypted_input = sha256(input, input)
    js$setPassword(encrypted_input)
  })
}

# Run the application
shinyApp(ui = ui, server = server)
```

`passchecker-functions.R`
``` R
# ShinyJS code
js_code = "
shinyjs.getPassword = function() {
  if (localStorage.getItem('password') === null) {
    console.log('no cookie');
    Shiny.onInputChange('temppass', 'NA');
  } else {
    console.log('found in cookies: ', localStorage.password);
    Shiny.onInputChange('temppass', localStorage.password);
  }
}
shinyjs.setPassword = function(password) {
  localStorage.password = password;
  console.log('written to cookies: ', localStorage.password);
  Shiny.onInputChange('temppass', localStorage.password);
}
shinyjs.log = function(string) {console.log(string.toString());}
"

# Custom JQuery code
js_enter = "
$(document).on('keyup', function(e) {
  if(e.keyCode == 13) {Shiny.onInputChange('enterkey', Math.random());}
});
"

# Airtable passwords retrieval function
airtable_passes = function(token) {
  at = fetch_airtable("https://api.airtable.com/v0/appysOdiKmcKSAWU1/", "team", token,
    query=list("filterByFormula"="AND(status = 'active', password != '')"))
  return(at$password)
}
```

`styles.css`
``` css
/* Password validation CSS */
#password-input {
  display: none;
}

#shiny-notification-panel {
  position: absolute;
  height: 200px;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  margin: auto;
}
```
