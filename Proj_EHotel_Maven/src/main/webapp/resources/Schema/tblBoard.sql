
create database ezenhotel;
use ezenhotel;

drop table tblBoard;

create table tblBoard (
    no       	 	    int                 	unique auto_increment,		
    uid 				char(30) 			null,
    upw				char(30)           null,
    name			char(30)			 null,
    subject    		char(50)			not null,
    content		text					null	,    
    regTM			date					not null,  
    updateTM	date					null,
    readCnt		int					null,
    txtType 		char(10)           not null,
    
    constraint		primary key(no),
    foreign key(uid) references memberlist(uid)
);

select * from tblBoard order by no;

desc tblBoard;

insert into tblBoard (uid,upw,name,subject,content,regTM,txtType) values ('아이디','1234','샘플','제목','내용',now(),'문의');

delete  from tblBoard where no=18;
