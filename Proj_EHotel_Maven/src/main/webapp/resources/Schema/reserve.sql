#호텔 예약 시스템################################################

create database ezenhotel;
use ezenhotel;


create table lodgeInfo(
	hNum int unique auto_increment,
    hName char(100) not null,
    hCode char(50) primary key,
    hType char(50) not null, 
    hAddr char(100) 
);

select hNum, hName, hCode, hType, hAddr from lodgeInfo order by hCode asc;

select * from lodgeInfo where hType='H';

insert into lodgeInfo(hName, hCode, hType, hAddr)
values('설악 쏘라노', 'L01', 'L', '강원 속초시 미시령로2983번길 111'),
('거제 벨버디어', 'L02', 'L', '경남 거제시 장목면 거제북로 2501-40'),
('경주', 'L03', 'L', '경북 경주시 보문로 182-27 한화콘도미니엄'),
('대천 파로스', 'L04', 'L', '충남 보령시 해수욕장3길 11-10 한화리조트 대천 파로스 1층'),
('산정호수 안시', 'L05', 'L', '경기 포천시 영북면 산정호수로 402 한화리조트 산정호수 안시'),
('설악 별관', 'L06', 'L', '강원 속초시 미시령로2983번길 16 한화리조트 설악 별관'),
('용인 베잔송', 'L07', 'L', '경기 용인시 처인구 남사읍 봉무로153번길 79 한화리조트 용인 베잔송'),
('제주', 'L08', 'L', '제주 제주시 명림로 575-107'),
('평창', 'L09', 'L', '강원 평창군 봉평면 태기로 228-33 한화리조트 평창'),
('해운대', 'L10', 'L', '부산 해운대구 마린시티3로 52 한화리조트 해운대'),
('백암온천', 'L11', 'L', '경북 울진군 온정면 온천로 129-13'),
('MATIE Osiria', 'H01', 'H', '부산 기장군 기장읍 동부산관광7로 17 호텔동 마티에 오시리아'),
('여수 벨메르', 'H02', 'H', '전남 여수시 웅천남4로 17 한화호텔앤드리조트 여수 벨메르'),
('브리드호텔 양양', 'H03', 'H', '강원 양양군 현남면 인구항길 17 브리드호텔 양양'),
('더 플라자', 'H04', 'H', '서울 중구 소공로 119'),
('사이판', 'H05', 'H', '');



create table roomInfo(
	rNum int unique auto_increment,
    hCode char(50) not null,
    rName char(100) not null,
    rCode char(50) primary key,
    rPeople int not null,
    rCnt int not null,
    rPrice int not null, 
    foreign key(hCode) references lodgeInfo(hCode)
);
desc roomInfo; 

insert into roomInfo(hCode, rName, rCode, rPeople, rCnt, rPrice)
values('L02', '디럭스', 'L02-DN01', 4, 101, 189000),
('L02', '디럭스(뽀로로MAKE)', 'L02-DP01', 4, 4, 224000),
('L02', '디럭스(뽀로로PEEKABOO)', 'L02-DP02', 4, 9, 224000),
('L02', '디럭스(뽀로로MOTIONPLAY)', 'L02-DP03', 4, 4, 224000),
('L07', '디럭스 베드', 'L07-DB01', 5, 55, 140000),
('L07', '디럭스 온돌', 'L07-DO01', 5, 140, 140000);
insert into roomInfo(hCode, rName, rCode, rPeople, rCnt, rPrice)
values
('H01', '컴포트 슈페리어', 'H01-CS01', 2, 16, 200000),
('H01', '컴포트 디럭스 더블', 'H01-CD01', 2, 8, 240000),
('H01', '컴포트 디럭스 트윈', 'H01-CD02', 2, 8, 240000),
('H01', '마티에 스위트(오션뷰)', 'H01-MS01-O', 4, 84, 340000),
('H01', '마티에 스위트', 'H01-MS02', 4, 53, 300000);

select * from roomInfo where hCode='H01';

create table reserveInfo(
	num int unique auto_increment,
    hCode char(50) not null, 
    rCode char(50) not null,
    uId char(50) not null,
    resev_start datetime not null, 
    resev_end datetime not null, 
    resev_people int not null, 
    resev_method int not null, 
    resev_date datetime default now(), 
    dayOfNights int not null,
    foreign key(hCode) references lodgeInfo(hCode),
    foreign key(rCode) references roomInfo(rCode),
    foreign key(uId) references memberList(uid)
);

select * from reserveInfo order by resev_date asc, resev_start desc;
 set sql_safe_updates=0;
 
UPDATE reserveInfo set resev_end = DATE_ADD(resev_end, interval -5 DAY);
 
update reserveInfo 
set resev_start = '2022-10-01 00:00:00' and resev_end = '2022-10-02 00:00:00' 
where num=8;


select num, i.hCode as hCode, hName, i.rCode as rCode, rName, uId, resev_people, resev_method, resev_start, DATE_ADD(i.resev_start, INTERVAL i.dayOfNights DAY) as resev_end, resev_date
from reserveInfo i 
join roomInfo r on r.rCode = i.rCode
join lodgeInfo h on i.hCode = h.hCode
where uId='qwert' 
group by uId, resev_date, rCode 
order by resev_start desc;

delete from reserveInfo;

#DATE_ADD(?, INTERVAL ? DAY)