alter table images
    add column active bool not null default true;

alter table videos
    add column active bool not null default true;
