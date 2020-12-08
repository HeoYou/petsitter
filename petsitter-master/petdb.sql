create database petdb;
use petdb;
drop table IF EXISTS user;
drop table IF EXISTS petsitter;
drop table IF EXISTS reservation;
drop table IF EXISTS image;
drop table IF EXISTS review;


create table user(
    uId varchar(20) Not Null,
    uName varchar(20) not null,
    uPhone varchar(20) not null, 
    uAddress varchar(50) not null,
    uPw varchar(20) not null,
    uProfile varchar(30),
    primary key(uId)
    );

create table petsitter(
    psId int not null auto_increment,
    psIntro text,
    psAddress varchar(20),
    psSPrice int, psMPrice int, psLPrice int,
    psOption1 boolean, -- 산책
    psOption2 boolean, -- 노즈워크
    psOption3 boolean, -- 픽업
    psOption4 boolean, -- 목욕
    psOption5 boolean, -- 장난감
    psOption6 boolean, -- 사료
    psOption7 boolean, -- 간식
    psOption8 boolean, -- 목줄 
    psOption9 boolean, -- 배변패드 
    psOption10 boolean, -- 식기
    psOption11 boolean, -- 샴푸
    psOption12 boolean, -- 약/영양제
    psOption13 boolean,
    psFlag varchar(5), 
    uId varchar(20),
    sittinCount int default 0,
    primary key(psId),
    unique index(uId),
    foreign key(uId) references User(uId)
   # foreign key(psImage) references Image(imgId)
    );
    insert into petsitter (psIntro, psAddress, psSprice, uId) values("ㅎㅇㅎㅇ", "충남", 5000, "1234");
	select * from petsitter;
    
create table reservation(
	rId int not null auto_increment,
	rSdate date not null,
    rEdate date not null,
    rStation varchar(20), 
    rPrice int,
    rOption varchar(20),
    psId int,
    uId varchar(20),
    rStatus int DEFAULT 0,
    primary key(rId),
    foreign key(psId) references petsitter(psId),
    foreign key(uId) references User(uId)
    );
    insert into reservation (rSdate, rEdate, psId, uId) values("2019-09-29", "2019-09-30",1,4321);
    select uName from user where uId = 
    (select uId from petsitter where psId = 
    (select psid from reservation where rId = 1));
    
    select * from reservation;
    
create table image(
	imgId varchar(30) not null,
    imgAdd varchar(30) not null,
    uId varchar(20) not null,
    primary key(imgId),
    foreign key(uId) references User(uId)
    );
    
create table review(
	rvId int auto_increment,
    rvIntro text,
    rvDate date,
    rvScore int default 5,
    psId int not null,
    uId varchar(20) not null,
    primary key(rvId),
    foreign key(psId) references petsitter(psId),
    foreign key(uId) references User(uId)
    );
    
create table article(
	articleId int auto_increment,
    articleTitle varchar(20) not null,
    articleDate date,
    uId varchar(20),
    articleInfo varchar(100),
    articleCount int,
    primary key(articleId),
    foreign key(uId) references user(uId)
    );
    
    create table admin(
	uId VARCHAR(20) not null,
    uPw VARCHAR(20) not null,
    uName VARCHAR(20) not null,
    PRIMARY key(uId)
);

create table comments(
cmtId int not null auto_increment,
articleId int not null,
uId varchar(20) not null,
comment varchar(140) not null,
cmtDate date,
primary key(cmtId),
foreign key(uId) references user(uId),
foreign key(articleId) references article(articleId)
);





insert into admin (uId, uPw, uName) values('admin', '1234', 'admin');


select * from user;
