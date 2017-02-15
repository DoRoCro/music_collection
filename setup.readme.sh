#
#
# setup commands to create database for music collection, run once only

createdb music_collection

psql -d music_collection -f db/music_database.sql
