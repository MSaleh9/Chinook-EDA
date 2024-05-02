-- Query : 1 ( what is the most selling genre ) 

SELECT G.GenreId, G.Name, sum(IL.Quantity) Total_sold
FROM Genre AS G
JOIN Track AS T
ON G.GenreId = T.GenreId
JOIN InvoiceLine AS IL
ON IL.TrackId = T.TrackId
GROUP BY G.GenreId
ORDER BY 3 DESC 
LIMIT 10;

-- Query : 2 Which artist has earned the most according to the InvoiceLines? ?

SELECT Artist.Name , Sum(InvoiceLine.UnitPrice*InvoiceLine.Quantity) tot_sold
FROM InvoiceLine
JOIN Track ON Track.TrackId = InvoiceLine.TrackId
Join Album ON Album.AlbumId = Track.AlbumId
JOIN Artist ON Artist.ArtistId = Album.ArtistId
GROUP BY 1
ORDER BY 2 DESC
Limit 5 ;


-- Query 3 : what are the top 5 artists based on the number of albums ?


SELECT Artist.ArtistId,Artist.Name,count(Album.ArtistId) tot_albums
FROM Artist
Join Album
ON Album.ArtistId = Artist.ArtistId
GROUP BY 1
ORDER BY 3 DESC
LIMIT 5;


-- Query 4 : (what is the average duration for every playlist type ) 

SELECT PL.PlaylistId, PL.Name,(avg(T.Milliseconds)/60000) AS average_duration
FROM Playlist PL
JOIN PlaylistTrack PLT
ON PL.PlaylistId = PLT.PlaylistId
JOIN Track T
ON T.TrackId = PLT.TrackId
GROUP BY 1
ORDER BY 3;
