INSERT INTO MusicVideo(track_id, video_director)
SELECT TrackId, 'It worked'
FROM tracks 
WHERE Name == 'Voodoo';