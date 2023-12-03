create table images
(
    image_url         text not null primary key,
    short_description text not null,
    description       text,
    showing           bool not null default false
);

-- Only one image can be shown at the same time
create unique index on images (showing) where showing = true;

create table videos
(
    youtube_id  text not null primary key,
    description text,
    playing     bool not null default false
);

-- Only one video can be played at the same time
create unique index on videos (playing) where playing = true;

create view current_mood as
select image_url, youtube_id
from images,
     videos
where showing = true
  and playing = true;

create rule update_playing as on update to current_mood
    where new.youtube_id <> old.youtube_id
    do also update videos
            set playing = false
            where videos.youtube_id = old.youtube_id;

create rule update_showing as on update to current_mood
    where new.image_url <> old.image_url
    do also update images
            set showing = false
            where images.image_url = old.image_url;