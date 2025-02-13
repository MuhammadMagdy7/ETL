# ETL for YouTube Videos using PySpark

## 📌 Project Overview
This project implements an **ETL (Extract, Transform, Load) pipeline** for processing YouTube video data using **PySpark** and **SQL Server** . The pipeline extracts JSON data, transforms it for analysis, and loads it into warehouse using **SQL Server**.

**Source of Data:** [YouTube Dataset on Kaggle](https://www.kaggle.com/datasets/datasnaek/youtube-new)

## 🚀 Features
- **Extract**: Reads JSON and CSV files containing YouTube video metadata.
- **Transform**:
  - Cleans and normalizes the data.
  - Removes duplicates while keeping specific unique fields.
  - Handles schema consistency across multiple JSON files..
- **Load**: Stores the processed data into an **SQL Server database**.
- Establishes a relationship between the `videos` and `category` tables using SQL queries.
- Ensures data integrity by setting unique constraints.

## 🛠️ Technologies Used
- **PySpark** (for data processing)
- **SQL Server** (for storing transformed data)
- **Docker** (for running SQL Server locally)
- **Azure Data Studio** (for managing the database)

## 📂 Project Structure
```
ETL-Youtube-Videos/
│── data/                     # Raw JSON data
│── main.py                   # PySpark script for ETL
│── requirements.txt          # Python dependencies
│── README.md                 # Project documentation
```

## 🔧 Setup Instructions
### 1️⃣ Install Dependencies
Ensure you have Spark installed on your device. Then, install the required Python packages:
```sh
pip install -r requirements.txt
```
### 2️⃣ Run SQL Server Locally (Using Docker)
```sh
docker run -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=yourpassword' -e 'MSSQL_PID=Developer' -p 1433:1433 --name sqlserver -d mcr.microsoft.com/mssql/server:2022-latest
```
### 3️⃣ Configure Environment Variables
Rename `.env.example` to `.env` and configure the following variables:
```sh
USERNAME=sa
PASSWORD=yourpassword
```

## 📝 SQL Database Schema
### `youtube_data` Table
| Column Name        | Data Type      | Description |
|-------------------|--------------|-------------|
| video_id         | NVARCHAR(100) | Unique video identifier |
| title           | NVARCHAR(255) | Video title |
| category_id     | NVARCHAR(100) | Category reference |
| views           | INT          | View count |
| likes           | INT          | Like count |
| dislikes        | INT          | Dislike count |
| comment_count   | INT          | Number of comments |
| publish_time    | TIMESTAMP    | Video publish date |
| country         | NVARCHAR(10) | Country code |

### `category_data` Table
| Column Name  | Data Type      | Description |
|-------------|--------------|-------------|
| id          | NVARCHAR(100) | Category ID (Primary Key) |
| title       | NVARCHAR(255) | Category name |


## 📬 Contact
For any inquiries, Connect on **LinkedIn**.

---

**Author:** Mohamed Magdy
