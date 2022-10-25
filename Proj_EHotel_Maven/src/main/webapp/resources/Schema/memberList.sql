create database ezenhotel;
use ezenhotel;

create table memberList (
	no				int				auto_increment unique,
    uid				char(30)		primary key,
    upw				char(30)		not null,
    email			char(50)		not null,
    name			char(30)		not null,
    gender			char			not null,
    country			char(20)		not null,
    bDate			char(8)			not null,
    contact			char(20)		not null,
    zipCode			int(5)			null,
    address			char(50)		null,
    dAddress		char(50)		null,
    joinTM			datetime
);

select * from memberList;

alter table memberList modify zipCode char(5);

select * from memberList where uid = "test01";
update memberList
		set email='potato@naver.com'
        where uid='test01';