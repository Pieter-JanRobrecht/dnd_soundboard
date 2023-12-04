create or replace function update_video_mood() returns trigger as
$$
begin
    update videos set playing = false where youtube_id = old.youtube_id;
    update videos set playing = true where youtube_id = new.youtube_id;

    return new;
end;
$$ language plpgsql;

create or replace function update_image_mood() returns trigger as
$$
begin
    update images set showing = false where image_url = old.image_url;
    update images set showing = true where image_url = new.image_url;

    return new;
end;
$$ language plpgsql;