# Creating a database using sqlite3 

### Introduction

This project builds a SQL table of [inmate release information in NYC (in 2018)](https://data.cityofnewyork.us/Public-Safety/Inmate-Discharges/94ri-3ium) using sqlite3 version 3.32.3. The script can be run in the command line so the user has a built database 
and the `.db` exported to another `.csv` file (a tad extra).

#### `dataBase.sh` Breakdown

The script first downloads a `.csv` file from the internet using curl and saves it to a `.csv` file on the local computer with the name `inmateFile.csv`. It then begins databasing.
The script activates sqlite3 (assuming it's already installed on the computer) with a database called `dataBase.db` if this `db` already
exists on the local computer then it will open the already existing `db`, otherwise it will create a new one called `dataBase.db` and include `<< EOF` which is
understood that we'll be reading in input in sqlite3 until the `EOF` marker. 
- `.mode csv` sets input mode
- `.import inmateFile.csv tab6` Import data from inmateFile.csv into tab6 (it creates a table called tab6)
- `.schema` shows the CREATE statements in the command line
- `.headers on` allows column labels to be printed as the first row of output in the csv
- `.mode csv` sets output mode to 
- `.once outputFile.csv` causes all query output to go into `outputFile.csv` instead of being printed on the console
- `SELECT * FROM tab6;` selects all data from tab6 
- `EOF` end of file marker - script terminates 

#### Instructions: 

1) Open terminal and clone this repository with `git clone https://github.com/RachMink/CISC3140Lab4Task1.git`

2) navigate into the cloned repository using `cd`

2) once you get there, if you type `ls` you should see the `dataBase.sh` shell script in the folder

4) in the command line make the script executable with `chmod 755 dataBase.sh`
	
5) run the script with `./dataBase.sh`

6) the output on your command line should be the schema of the table
```
CREATE TABLE tab6( 
  "inmateid" TEXT, 
  "admitted_dt" TEXT, 
  "discharged_dt" TEXT, 
  "race" TEXT, 
  "gender" TEXT,
  "age" TEXT, 
  "inmate_status_code" TEXT, 
  "top_charge" TEXT 
);
```
#### Explaining the schema
The schema of a database is basically a blueprint to the database. Since my database only inlcudes one table the relation schema of this table is the name of the 
table, and the name/type of each column in it. 

My table `tab6` includes 8 columns each of which inlcude `TEXT` information: 
`inmateid` inlcudes the ID of the inmate while they were being held - This is the primary key column that uniquely identifies each inmate record.
`admitted_dt` the date and time the inmate was admitted
`discharged_dt` the date and time the inmate was released
`race` race of the inmate
`gender` gender of the inmate
`age` age of the inmate
`inmate_status_code` Provides the inmate status i.e. if an inmate is a detainee
`top_charge` Top charge for the inmate

#### Helpful Resources
- although techical documentation can be daunting and lengthy at times the [sqlite](https://www.sqlite.org/cli.html) website is an easy to read, user friendly resource
- great SQLite [tutorial](https://www.sqlitetutorial.net)
