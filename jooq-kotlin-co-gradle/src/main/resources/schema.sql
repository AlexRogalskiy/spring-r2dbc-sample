CREATE TABLE IF NOT EXISTS posts (
    id UUID NOT NULL /* [jooq ignore start] */ DEFAULT uuid_generate_v4() /* [jooq ignore stop] */,
    title VARCHAR(255),
    content VARCHAR(255),
    status VARCHAR(255) default 'DRAFT',
    tags VARCHAR(255)[],
    comments_count INTEGER default 0,
    created_at TIMESTAMP,
    version INTEGER
);

CREATE TABLE IF NOT EXISTS comments (
    id UUID NOT NULL /* [jooq ignore start] */ DEFAULT uuid_generate_v4() /* [jooq ignore stop] */,
    content VARCHAR(255),
    post_id UUID,
    status VARCHAR(255) default 'PENDING',
    notes VARCHAR(255),
    created_at TIMESTAMP
);

ALTER TABLE posts ADD CONSTRAINT posts_pk PRIMARY KEY (id);
ALTER TABLE comments ADD CONSTRAINT comments_pk PRIMARY KEY (id);
ALTER TABLE comments ADD CONSTRAINT comments_posts_fk FOREIGN KEY (post_id) REFERENCES posts(id) /* [jooq ignore start] */ON DELETE CASCADE ON UPDATE CASCADE/* [jooq ignore stop] */;
