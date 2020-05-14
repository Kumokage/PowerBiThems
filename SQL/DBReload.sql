drop table file_version
drop table file_current
drop table tag_version
drop table tag_current

create table tag_current
(
	id uniqueidentifier
		constraint tag_current_pk
			primary key nonclustered,
	user_id int,
	user_name nvarchar(max),
	isNormative bit,
    isProcess bit,
	name nvarchar(max) not null,
	date_creation datetime not null,
	date_update datetime not null
)

create table tag_version
(
	id uniqueidentifier
		constraint tag_version_pk
			primary key nonclustered,
	id_current uniqueidentifier
	    constraint id_tag_current
			references tag_current,
	user_id int,
	user_name nvarchar(max),
	isNormative bit,
    isProcess bit,
	name nvarchar(max) not null,
	date_creation datetime not null,
	date_update datetime not null,
	date_delete datetime
)

create table file_current
(
	id uniqueidentifier
		constraint file_current_pk
			primary key nonclustered,
	id_tag uniqueidentifier
		constraint id_tag
		     references tag_current,
	user_id int,
	user_name nvarchar(max),
	name nvarchar(max) not null,
	data nvarchar(max) not null,
	date_creation datetime not null,
	date_update datetime not null
)

create table file_version
(
	id uniqueidentifier
		constraint file_version_pk
			primary key nonclustered,
    id_current uniqueidentifier
		constraint id_current
			references file_current,
	id_tag_version uniqueidentifier
		constraint id_tag_version
			references tag_version,
	user_id int,
	user_name nvarchar(max),
	name nvarchar(max) not null,
	data nvarchar(max) not null,
	date_creation datetime not null,
	date_update datetime not null,
	date_delete datetime
)
