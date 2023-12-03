create policy "Anyone can upload images"
    on storage.objects for insert with check (bucket_id = 'mood_images' and auth.role() = 'anon');

create or replace view current_mood as
select image_url, youtube_id, row_number() over () as index
from images,
     videos
where showing = true
  and playing = true;