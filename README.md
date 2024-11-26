This SQL query will insert the following information into you Navidrome database from your iTunes library:
- Play count
- last played date
- star rating


After fidling with https://github.com/Stampede/itunes-navidrome-migration
I couldn't get it to work, so I decided to try and merge the iTunes library data in the navidrome DB with SQL.

The Navidrome database file is a standard SQLite file.

Prerequisites
- convert your Library.xml to a SQLite db. There are some tools online to do this. Google is your friend
- Make sure you have your tags in order. I've had to put alot of effort into getting this fixed before this INSERT query worked
- I could have used the filenames for the SQL join, but that was too much of a mess for me

There are some issues I haven't figured out yet, like
- the "Top Rated" menu in Navidrome doesn't show any of the imported data from iTunes
- the "Most Played" menu in Navidrome doesn't show any of the imported data from iTunes


Hope it helps someone out there :)
