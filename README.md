# ETL
ETL pipeline using pyspark and sqlite the data from Kaggle about youtube videos

source of data : https://www.kaggle.com/datasets/datasnaek/youtube-new

set the db on docker for sql server 
docker run -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=yourpassword' -e 'MSSQL_PID=Developer' -p 1433:1433 --name sqlserver -d mcr.microsoft.com/mssql/server:2022-latest

set env such
conda create --name data-engineering python=3.12 
if you use conda

and you should install spark if you want use this porject on your device 


pip install -r requirement.txt

convert .env.example file to .env 
set the valible such username sa and password yourpassword

افكار جديدة 
ترجمة عنوان الفيديو مع وصف الفيديو لتحليل اكثر دقة 

يمكت عمل هذه باستخدام نماذج 
LLM 

I do relation between the two tables (videos, category) using sql query and set the Unique value with constrait
