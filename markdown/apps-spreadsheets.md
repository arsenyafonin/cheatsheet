# Google App Scripts

Изначальное форматирование таблицы:

``` javascript
function InitialFormatting() {
  var spreadsheet = SpreadsheetApp.getActive();
  var sheet = spreadsheet.getActiveSheet();

  // Deleting unused rows and columns
  var lastRow = sheet.getLastRow();
  var lastColumn = sheet.getLastColumn();
  sheet.deleteRows(lastRow + 1, sheet.getMaxRows() - lastRow);
  sheet.deleteColumns(lastColumn + 1, sheet.getMaxColumns() - lastColumn);

  // Custom formatting
  sheet.clearFormats();
  sheet.setFrozenRows(1);

  var range = sheet.getDataRange();
  range.setHorizontalAlignment('left').setVerticalAlignment('top');
  range.setFontFamily('Roboto Mono');
  range.setWrapStrategy(SpreadsheetApp.WrapStrategy.WRAP);

  // Logger.log();
};
```
