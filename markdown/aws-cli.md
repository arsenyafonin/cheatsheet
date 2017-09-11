Установка AWS Command Line Interface на Windows:

1. cmd.exe: `pip install awscli --upgrade --user`
2. run: `sysdm.cpl` > Переменные среды... > Системные переменные:
    1. `Path`: Изменить...
    2. Создать: `C:\Users\%USERNAME%\AppData\Roaming\Python\Python36\Scripts` (`%USERNAME%` заменить)
3. cmd.exe: `aws configure`
    1. AWS Access Key ID: `aws_access_key_id` из `..\SC_Admin\_db\aws\credentials`
    2. AWS Secret Access Key: `aws_secret_access_key` из&nbsp;`..\SC_Admin\_db\aws\credentials`
    3. Default region name: `eu-central-1`
    4. Default output format > Skip
