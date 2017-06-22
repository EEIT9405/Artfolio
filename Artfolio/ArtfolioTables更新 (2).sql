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

--�|��
create table tb_member(
mid int primary key identity, --�|��id
pwd varchar(32) not null, --�K�X
name varchar(20) not null, --�ʺ�
isname bit default 1, 
email varchar(256) not null unique , --�|���b��
ismail bit default 1,
gender bit not null, --�k1,�k0
isgender bit default 1,
info varchar(1024), --�ۧڤ���
isinfo bit default 1,
mphoto varchar(256),--�j�Y�K
point int default 0, --�I��
mstart datetime default getDate(), --�}�l�� 
mend datetime default '9999-12-31', --������
mupdate datetime --��s��
);

--�����H
create table tb_mail(
mailid int primary key identity,--�H��s��
mid int foreign key references tb_member(mid) not null, --�|��id
targetid int foreign key references tb_member(mid) not null, --��Hid
mailtitle varchar(100) ,
mailcontent varchar(5000),
mstatus tinyint, 
isread bit default 0,
isdelete bit default 0,
mattach varchar(256),
reid int foreign key references  tb_mail(mailid), --�^�H�H��s��
maildate datetime default getDate()
);

--�¦W�� --5/22��s
create table tb_block (
blockid int primary key identity,
mid int foreign key references tb_member(mid),
targetid int foreign key references tb_member(mid),
blockdate datetime default getdate()
);

--��ï
create table tb_album(
aid int primary key identity,
aname varchar(100),
wid int, --�ʭ��@�~id
mid int foreign key references tb_member(mid) not null,
adate datetime default getdate()
);


--�@�~
create table tb_work(
wid int primary key identity, --�@�~�s��
mid int foreign key references tb_member(mid) not null, --�|��id
picurl varchar(256) not null,
aid int foreign key references tb_album(aid), --��ï�s��
winfo varchar(1024), --�@�~�y�z
wtitle varchar(100), --�@�~���D
wlike int default 0,
wissue int default 0,
iswmsg bit default 1, --1�}0��
isscore bit default 0,
wstart datetime default getDate(),
wend datetime default '9999-12-31',
score_1 varchar(20), --�@�̦ۭq��������
score_2 varchar(20),
score_3 varchar(20),
score_4 varchar(20),
score_5 varchar(20),
scoreversion int default 0 not null,
worder int default 9999999
);


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
wid int foreign key references tb_work(wid) not null, --�@�~�s��
scoreversion int not null,
score_1 varchar(20), --�@�̦ۭq��������
score_2 varchar(20),
score_3 varchar(20),
score_4 varchar(20),
score_5 varchar(20),
retireddate datetime default getDate(),
);

--�@�~�[�ݬ��� 5/24��s
create table tb_browsed(
browsedid int primary key identity,
mid int foreign key references tb_member(mid),
wid int foreign key references tb_work(wid),
browseddate datetime default getdate()
);

--�ߦn���� 5/27��s
create table tb_favorite(
favoriteid int primary key identity,
mid int foreign key references tb_member(mid),
tag varchar(100) not null,
fcount int default 1, --�[�ݹL�����ҫ�+1
favoritedate datetime default getdate()
);

--�@�~�d��
create table tb_wmsg(
wmsgid int primary key identity,
mid int foreign key references tb_member(mid) not null, --�d����id
wid int foreign key references tb_work(wid) not null,
wmsgcontent varchar(512),
wmsgdate datetime default getDate()
);




--�������� --5/27��s
create table tb_record(
mid int foreign key references tb_member(mid) not null,
wid int foreign key references tb_work(wid) not null,
record_1 decimal(2), --����1~10
record_2 decimal(2),
record_3 decimal(2),
record_4 decimal(2),
record_5 decimal(2),
recordversion int,
recorddate datetime default getDate(),
primary key(mid,wid,recordversion)
);

--�@�a�l�� --5/27��s
create table tb_follow(
mid int foreign key references tb_member(mid) not null,
followid int foreign key references tb_member(mid) not null, --�l�ܧ@�a��id
followdate datetime default getDate()
primary key(mid,followid)
);

--�߷R�@�~ --5/27��s
create table tb_like(
mid int foreign key references tb_member(mid) not null,
wid int foreign key references tb_work(wid) not null,
likedate datetime default getDate()
primary key(mid,wid)
);

--�I�ƥ������(�P�x��)
create table tb_expoint(
pno int primary key identity,
mid int foreign key references tb_member(mid) not null,
ptype bit,--������A 1�ʤJ�I��,0�I�ƧI���{��
point int, --�I��
expointdate datetime default getDate(),
);

--�I�Ʀ�������(�P��L�|��)
create table tb_donate(
dno int primary key identity,
mid int foreign key references tb_member(mid) not null,
targetid int foreign key references tb_member(mid) not null,
point int,
donatedate datetime default getDate()
);

--�ܽZ��� 5/28��s
create table tb_bounty(
b_id  int primary key identity, --�ܽZ�s��
mid int foreign key references tb_member(mid) not null,
b_state  int default 0,	 --���ʪ��A
b_title	 varchar(100),
b_content varchar(5000),--���ʤ��e
b_partimethod varchar(5000),--�ѥ[��k
b_organizer	 varchar(100), --�D����
b_bonus_total Integer, --�`����
b_bonus_max Integer, --	�̰�����
b_startdate	datetime, --���ʶ}�l��	
b_enddate datetime, --���ʺI���
b_announced datetime,-- �����o�����	
b_attach_pic varchar(256),-- ���ʪ���(����)	
b_attach_pdf varchar(256),-- ����Email����(PDF��)
--b_company varchar(20), -- ���q
--b_phone	varchar(20), --	�q��	
--b_email	varchar(256), --	
--b_contectperson	varchar(20), --�p���H
b_click	Integer default 0,-- �s����
b_uploaddate datetime default getDate(), --�W�Ǥ��
b_update datetime default getDate(),	--��s���
b_end datetime default '9999-12-31', -- �A�ε�����
);

--�ܽZ���� 5/15�s�W
create table b_tag(
b_tagid int primary key identity,
b_id int foreign key references tb_bounty(b_id) not null,
b_tag varchar(100) not null,--����
);

--�ܽZ�d��
create table tb_bmsg( 
b_msgid int primary key identity, 
mid int foreign key references tb_member(mid) not null,
b_id int foreign key references tb_bounty(b_id) not null,
b_msgcontent varchar(1024),
b_msgdate datetime default getDate()
);

--�ܽZ�l�� 5/29��s
create table tb_track(
mid int foreign key references tb_member(mid) NOT NULL,
b_id int foreign key references tb_bounty(b_id) NOT NULL,
PRIMARY KEY(mid, b_id)
);


--�޲z����x
create table tb_log(
logid int primary key identity,
mid int foreign key references tb_member(mid) not null, --�޲z��id
targetid int, --��Hid
logcontent varchar(1024),
logtype bit, --1�ȪA,0���|
lstatus bit, --1�w�B�z,0���B�z
logdate datetime default getDate()
);
