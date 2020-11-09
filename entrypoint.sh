#!/bin/bash
source activate env

# source env/bin/activate

exec gunicorn wsgi:app --workers 3 --bind unix:/home/movieapp/app.sock -D &
exec service nginx start