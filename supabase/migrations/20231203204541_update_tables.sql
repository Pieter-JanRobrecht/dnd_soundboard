create policy "Anyone can upload images"
    on storage.objects for insert using (bucket_id = 'mood_images' and auth.role() = 'anon');

create or replace view current_mood as
select row_number() over () as index, image_url, youtube_id
from images,
     videos
where showing = true
  and playing = true;