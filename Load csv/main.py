import pandas as pd
from sqlalchemy import create_engine

conn_string = "postgresql://postgres:root@localhost:5432/Painting"
db= create_engine(conn_string)
conn= db.connect()

files=[
    'artist',
    'canvas_size',
    'museum',
    'image_link',
    'museum_hours',
    'product_size',
    'subject',
    'work',
]

for file in files:
    df= pd.read_csv(f'C:/Users/User-PC/Downloads/Painting/csv data{file}.csv')
    df.to_sql(file, con=conn, if_exists ='replace', index=False)
