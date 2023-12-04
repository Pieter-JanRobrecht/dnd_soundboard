alter publication supabase_realtime add table videos, images;

drop policy "Anyone can read images"
    on storage.objects;
create policy "Anyone can read images"
    on storage.objects for select using (bucket_id = 'mood_images' and auth.role() = 'anon');

create or replace function update_video_mood() returns trigger as
$$
begin
    if old.youtube_id <> new.youtube_id then
        update videos
        set playing = (old.youtube_id = new.youtube_id)
        where videos.youtube_id in (old.youtube_id, new.youtube_id);
    end if;
end;
$$ language plpgsql;

create or replace function update_image_mood() returns trigger as
$$
begin
    if old.image_url <> new.image_url then
        update images
        set showing = (old.image_url = new.image_url)
        where images.image_url in (old.image_url, new.image_url);
    end if;
end;
$$ language plpgsql;

create or replace trigger video_trigger
    instead of update
    on current_mood
    for each row
execute function update_video_mood();

create or replace trigger image_trigger
    instead of update
    on current_mood
    for each row
execute function update_image_mood();

drop rule update_playing on current_mood;
drop rule update_showing on current_mood;