use ARTFOLIO

drop table tb_block
drop table tb_bmsg
drop table tb_donate
drop table tb_expoint
drop table tb_follow
drop table tb_like
drop table tb_log
drop table tb_mail
drop table tb_record
drop table tb_track
drop table tb_wmsg
drop table tb_tagvote
drop table tb_tag
drop table tb_score
drop table b_tag
drop table tb_bounty
drop table tb_browsed
drop table tb_favorite
drop table tb_work
drop table tb_album
drop table tb_member

--會員
create table tb_member(
mid int primary key identity, --會員id
pwd varchar(32) not null, --密碼
name varchar(20) not null, --暱稱
isname bit default 1, 
email varchar(256) not null unique , --會員帳號
ismail bit default 1,
gender bit not null, --男1,女0
isgender bit default 1,
info varchar(1024), --自我介紹
isinfo bit default 1,
mphoto varbinary(max),--大頭貼
point int default 0, --點數
mstart datetime default getDate(), --開始日 
mend datetime default '9999-12-31', --結束日
mupdate datetime --更新日
);

--站內信
create table tb_mail(
mailid int primary key identity,--信件編號
mid int foreign key references tb_member(mid) not null, --會員id
targetid int foreign key references tb_member(mid) not null, --對象id
mailtitle varchar(100) ,
mailcontent varchar(5000),
mstatus tinyint, 
isread bit default 0,
isdelete bit default 0,
mattach varchar(256),
reid int foreign key references  tb_mail(mailid), --回信信件編號
maildate datetime default getDate()
);

--黑名單 --5/22更新
create table tb_block (
blockid int primary key identity,
mid int foreign key references tb_member(mid),
targetid int foreign key references tb_member(mid),
blockdate datetime default getdate()
);

--相簿
create table tb_album(
aid int primary key identity,
aname varchar(100),
wid int, --封面作品id
mid int foreign key references tb_member(mid) not null,
adate datetime
);

--作品
create table tb_work(
wid int primary key identity, --作品編號
mid int foreign key references tb_member(mid) not null, --會員id
picurl varchar(256) not null,
aid int foreign key references tb_album(aid), --相簿編號
winfo varchar(1024), --作品描述
wtitle varchar(100), --作品標題
wlike int default 0,
wissue int default 0,
iswmsg bit default 1, --1開0關
isscore bit default 0,
wstart datetime default getDate(),
wend datetime default '9999-12-31',
score_1 varchar(20), --作者自訂評分項目
score_2 varchar(20),
score_3 varchar(20),
score_4 varchar(20),
score_5 varchar(20),
scoreversion int default 0 not null
);

insert into tb_member (pwd,name,email,gender) values ('','a','1',0),('','b','2',1),('','c','3',0)
insert into tb_work (mid,picurl,wtitle) values(1,'/','aa'),(1,'/','ba'),(1,'/','ca'),(1,'/','da'),(1,'/','ea')
insert into tb_work (mid,picurl,wtitle) values(1,'/','ab'),(1,'/','bb'),(1,'/','cb'),(1,'/','db'),(1,'/','eb')
insert into tb_work (mid,picurl,wtitle) values(1,'/','ac'),(1,'/','bc'),(1,'/','cc'),(1,'/','dc'),(1,'/','ec')
insert into tb_work (mid,picurl,wtitle) values(1,'/','ad'),(1,'/','bd'),(1,'/','cd'),(1,'/','dd'),(1,'/','ed')
insert into tb_work (mid,picurl,wtitle) values(1,'/','ae'),(1,'/','be'),(1,'/','ce'),(1,'/','de'),(1,'/','ee')

create table tb_tag(
wid int foreign key references tb_work(wid) not null,
tag varchar(100) not null,
lock bit default 0 not null,
vote int default 0 not null
primary key (wid,tag)
);

create table tb_tagvote(
mid int foreign key references tb_member(mid) not null,
wid int not null,
tag varchar(100) not null,
votedate datetime default getDate(),
FOREIGN KEY(wid, tag) REFERENCES tb_tag(wid, tag)
);

create table tb_score(
wid int foreign key references tb_work(wid) not null, --作品編號
scoreversion int not null,
score_1 varchar(20), --作者自訂評分項目
score_2 varchar(20),
score_3 varchar(20),
score_4 varchar(20),
score_5 varchar(20),
retireddate datetime default getDate(),
);

--作品觀看紀錄 5/24更新
create table tb_browsed(
browsedid int primary key identity,
mid int foreign key references tb_member(mid),
wid int foreign key references tb_work(wid),
browseddate datetime default getdate()
);

--喜好標籤 5/27更新
create table tb_favorite(
favoriteid int primary key identity,
mid int foreign key references tb_member(mid),
tag varchar(100) not null,
fcount int default 1, --觀看過此標籤後+1
favoritedate datetime default getdate()
);

--作品留言
create table tb_wmsg(
wmsgid int primary key identity,
mid int foreign key references tb_member(mid) not null, --留言者id
wid int foreign key references tb_work(wid) not null,
wmsgcontent varchar(512),
wmsgdate datetime default getDate()
);




--評分紀錄 --5/27更新
create table tb_record(
recordid int primary key identity,
mid int foreign key references tb_member(mid) not null,
wid int foreign key references tb_work(wid) not null,
record_1 decimal(2), --評分1~10
record_2 decimal(2),
record_3 decimal(2),
record_4 decimal(2),
record_5 decimal(2),
recordversion int,
recorddate datetime default getDate()

);

--作家追蹤 --5/27更新
create table tb_follow(
fid int primary key identity,
mid int foreign key references tb_member(mid) not null,
followid int foreign key references tb_member(mid) not null, --追蹤作家的id
followdate datetime default getDate()
);

--喜愛作品 --5/27更新
create table tb_like(
likeid int primary key identity,
mid int foreign key references tb_member(mid) not null,
wid int foreign key references tb_work(wid) not null,
likedate datetime default getDate()
);

--點數交易紀錄(與官方)
create table tb_expoint(
pno int primary key identity,
mid int foreign key references tb_member(mid) not null,
ptype bit,--交易型態 1購入點數,0點數兌換現金
point int, --點數
expointdate datetime default getDate(),
);

--點數收受紀錄(與其他會員)
create table tb_donate(
dno int primary key identity,
mid int foreign key references tb_member(mid) not null,
targetid int foreign key references tb_member(mid) not null,
point int,
donatedate datetime default getDate()
);

--邀稿資料 5/28更新
create table tb_bounty(
b_id  int primary key identity, --邀稿編號
mid int foreign key references tb_member(mid) not null,
b_state  int default 0,	 --活動狀態
b_title	 varchar(100),
b_content varchar(5000),--活動內容
b_partimethod varchar(5000),--參加辦法
b_organizer	 varchar(100), --主辦單位
b_bonus_total Integer, --總獎金
b_bonus_max Integer, --	最高獎金
b_startdate	datetime, --活動開始日	
b_enddate datetime, --活動截止日
b_announced datetime,-- 公布得獎日期	
b_attach_pic varchar(256),-- 活動附件(圖檔)	
b_attach_pdf varchar(256),-- 活動Email附件(PDF檔)
--b_company varchar(20), -- 公司
--b_phone	varchar(20), --	電話	
--b_email	varchar(256), --	
--b_contectperson	varchar(20), --聯絡人
b_click	Integer default 0,-- 瀏覽數
b_uploaddate datetime default getDate(), --上傳日期
b_update datetime default getDate(),	--更新日期
b_end datetime default '9999-12-31', -- 適用結束日
);

--邀稿標籤 5/15新增
create table b_tag(
b_tagid int primary key identity,
b_id int foreign key references tb_bounty(b_id) not null,
b_tag varchar(100) not null,--標籤
);

--邀稿留言
create table tb_bmsg( 
b_msgid int primary key identity, 
mid int foreign key references tb_member(mid) not null,
b_id int foreign key references tb_bounty(b_id) not null,
b_msgcontent varchar(1024),
b_msgdate datetime default getDate()
);

--邀稿追蹤 5/29更新
create table tb_track(
mid int foreign key references tb_member(mid) NOT NULL,
b_id int foreign key references tb_bounty(b_id) NOT NULL,
PRIMARY KEY(mid, b_id)
);


--管理員日誌
create table tb_log(
logid int primary key identity,
mid int foreign key references tb_member(mid) not null, --管理員id
targetid int, --對象id
logcontent varchar(1024),
logtype bit, --1客服,0檢舉
lstatus bit, --1已處理,0未處理
logdate datetime default getDate()
);

insert into tb_donate (mid,targetid,point) values(1,2,70)
,(2,1,30),(1,3,50),(2,3,100),(3,2,10),(3,1,60)

insert into tb_expoint (mid,ptype,point) values(1,1,50),(1,0,150),(1,1,50),(2,1,100),(3,0,50),(3,1,100)