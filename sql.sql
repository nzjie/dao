drop table if exit tb_user;
create table tb_user(
	id int(11) not null auto_increment,
	name varchar(32) not null,
	password varchar(32) not null ,
	nickName varchar(32) default null,
	synopsis varchar (128) default null comment '简介',
	sex ENUM('1','2','0') default '0' comment '1男2女0保密',
	phone char(11) default null,
	email varchar(32) default null,
	createTime timestamp not null comment '创建时间',
	lastActive timestamp not null comment '最后活跃时间',
	roleIds varchar(128) default null comment '权限id集，以逗号分隔',
	header varchar(128) default null comment '头像路径',
	mark int(11) default 0,
	primary key (id),
	unique key name(name) using btree,
	unique key phone(phone) using btree,
	unique key email(email) using btree
) engine=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

drop table if exit tb_label;
create table tb_label(
	id int(11) not null auto_increment,
	name varchar(32) not null,
	primary key (id),
	unique key name(name) using btree,
) engine=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

drop table if exit tb_blog;

create table tb_blog(
	id int(11) not null auto_increment,
	userId int(11) not null,
	createTime timestamp not null comment '创建时间',
	lastModifyDate timestamp not null comment '最后修改时间',
	title varchar(128) not null comment '标题',
	content varchar(5000) not null comment '内容',
	commentNum int(11) default 0 comment '评论数',
	praiseNum int(11) default 0 comment '点赞数',
	collectNum int(11) default 0  comment '收藏数',
	readNum int (11) default 0  comment '阅读数',
	labelStrs varchar(256) comment '标签json形式，数据冗余',
	state int(11) default 0 comment '状态',
	primary key (id)
) engine=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8 COMMENT='博文';



drop table if exit tb_comment;
create table tb_comment(
	id int(11) not null auto_increment,
	blogId int(11) not null comment '评论的博文',
	parentId int(11) default null comment '评论所属的父评论，为空表示这是直接评论文章的评论',
	createTime timestamp not null comment '创建时间',
	content varchar(500) not null comment '内容',
	commentNum int(11) default 0 comment '评论数',
	praiseNum int(11) default 0 comment '点赞数',
	state int(11) default 0 comment '状态',
	primary key (id)
) engine=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8 COMMENT='评论';










