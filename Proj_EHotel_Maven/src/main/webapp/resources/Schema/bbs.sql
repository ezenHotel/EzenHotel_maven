create database ezenhotel;
use ezenhotel;
create table tblBoard (
    num       	    int                 auto_increment,		
    uid 			char(30)	 		null,
    uName			char(30)			not null,
    subject    		char(50)			not null,
    content			text				null	,    
    regTM			datetime			not null,
    ip				char(15)			null	,    
    readCnt			int					null,
    oriFileName		char(50)			null	,
    systemFileName	char(50)			null	,
    fileSize		int					null	,
    txtType char(10),
    constraint		primary key(num),
    foreign key(uid) references memberlist(uid)
);

desc tblBoard;
select * from tblBoard order by num desc;
