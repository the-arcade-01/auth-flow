create database if not exists auth_flow;

use auth_flow;

create table if not exists users (
    user_id serial PRIMARY KEY,
    email varchar(255) NOT NULL UNIQUE,
    password varchar(255) NOT NULL,
    created_at timestamp default CURRENT_TIMESTAMP
);

create table if not exists refresh_tokens_table (
    user_id serial,
    refresh_token varchar(255) NOT NULL,
    expire_time bigint NOT NULL,
    created_at timestamp default CURRENT_TIMESTAMP,
    UNIQUE (user_id, refresh_token),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);