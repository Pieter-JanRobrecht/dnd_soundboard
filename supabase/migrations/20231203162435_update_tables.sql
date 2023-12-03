alter table videos
    add column short_description text not null default 'foo';

create or replace rule update_playing as on update to current_mood
    where new.youtube_id <> old.youtube_id
    do also update videos
            set playing = (old.youtube_id = new.youtube_id)
            where videos.youtube_id in (old.youtube_id, new.youtube_id);

create or replace rule update_showing as on update to current_mood
    where new.image_url <> old.image_url
    do also update images
            set showing = (old.image_url = new.image_url)
            where images.image_url in (old.image_url, new.image_url);