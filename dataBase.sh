curl -o inmateFile.csv https://data.cityofnewyork.us/resource/94ri-3ium.csv

sqlite3 newDB.db << EOF

.mode csv
.import inmateFile.csv tab6
.schema
.headers on 
.mode csv
.once outputFile.csv
SELECT * FROM tab6;
EOF
