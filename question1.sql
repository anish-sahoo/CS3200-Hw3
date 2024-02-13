CREATE TABLE "MusicVideo" (
	"video_id"	INTEGER,
	"track_id"	INTEGER NOT NULL UNIQUE,
	"video_director"	TEXT NOT NULL,
	PRIMARY KEY("video_id" AUTOINCREMENT),
	FOREIGN KEY("track_id") REFERENCES "tracks"("TrackId")
);