/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/5/10 17:23:11                           */
/*==============================================================*/


drop table if exists business;

drop table if exists carousel;

drop table if exists introduction;

drop table if exists manager;

drop table if exists master;

drop table if exists news;

drop table if exists newstype;

drop table if exists role;

drop table if exists teamprocess;

/*==============================================================*/
/* Table: business                                              */
/*==============================================================*/
create table business
(
   businessid           int not null auto_increment,
   managername          char(32),
   des                  char(255) not null,
   icon                 char(64) not null,
   datetime             datetime not null,
   businessname         char(32) not null,
   primary key (businessid)
);

alter table business comment '业务范围表';

/*==============================================================*/
/* Table: carousel                                              */
/*==============================================================*/
create table carousel
(
   carouselid           int not null auto_increment,
   name                 char(32),
   title                char(32) not null,
   content              char(255) not null,
   datetime             datetime not null,
   image                mediumblob not null,
   primary key (carouselid)
);

alter table carousel comment '用于记录网站的首页轮播消息，照片最大不超过16M';

/*==============================================================*/
/* Table: introduction                                          */
/*==============================================================*/
create table introduction
(
   introductionid       int not null auto_increment,
   name                 char(32),
   content              text not null,
   datetime             datetime not null,
   primary key (introductionid)
);

alter table introduction comment '公司简介表';

/*==============================================================*/
/* Table: manager                                               */
/*==============================================================*/
create table manager
(
   name                 char(32) not null,
   roleid               char(24) not null,
   regdatetime          datetime not null,
   portrait             mediumblob not null,
   sex                  bool not null,
   password             char(64) not null,
   primary key (name)
);

alter table manager comment '管理员表';

/*==============================================================*/
/* Table: master                                                */
/*==============================================================*/
create table master
(
   mastername           char(32) not null,
   roleid               char(24),
   password             char(64) not null,
   primary key (mastername)
);

alter table master comment '超级管理员，全局唯一';

/*==============================================================*/
/* Table: news                                                  */
/*==============================================================*/
create table news
(
   newsid               int not null auto_increment,
   name                 char(32),
   typeid               int,
   newsdate             date not null,
   publishdatetime      datetime not null,
   title                char(64) not null,
   content              text not null,
   isheadline           bool not null,
   image                mediumblob not null,
   keywords             char(255) not null,
   primary key (newsid)
);

alter table news comment '新闻表';

/*==============================================================*/
/* Table: newstype                                              */
/*==============================================================*/
create table newstype
(
   typeid               int not null auto_increment,
   name                 char(32) not null,
   des                  char(255) not null,
   primary key (typeid)
);

alter table newstype comment '新闻类型表';

INSERT INTO newstype values
(0,'行业新闻','主要是跟公司主营业务相关的行业新闻'),
(0,'公司新闻','主要是公司内部新闻');

/*==============================================================*/
/* Table: role                                                  */
/*==============================================================*/
create table role
(
   roleid               char(24) not null,
   rolename             char(24) not null,
   des                  char(255) not null,
   primary key (roleid)
);

alter table role comment '网站维护人员的角色表，包括普通管理员若干和一个全局唯一的超级管理员';

INSERT INTO role values
('master','超级管理员','具有最高权限且唯一，具有对管理员的管理权限'),
('admin','管理员','具有后台维护的权限以及普通用户的管理权限，也具有普通用户的功能权限');

/*==============================================================*/
/* Table: teamprocess                                           */
/*==============================================================*/
create table teamprocess
(
   processid            int not null auto_increment,
   name                 char(32),
   location             char(32) not null,
   pos                  blob,
   brief                char(255) not null,
   date                 date not null,
   image                mediumblob,
   primary key (processid)
);

alter table teamprocess comment '团队进程表';

alter table business add constraint FK_business_manager foreign key (managername)
      references manager (name) on delete restrict on update restrict;

alter table carousel add constraint FK_carousel_manager foreign key (name)
      references manager (name) on delete restrict on update restrict;

alter table introduction add constraint FK_introduction_manager foreign key (name)
      references manager (name) on delete restrict on update restrict;

alter table manager add constraint FK_manager_role foreign key (roleid)
      references role (roleid) on delete restrict on update restrict;

alter table master add constraint FK_master_role foreign key (roleid)
      references role (roleid) on delete restrict on update restrict;

alter table news add constraint FK_news_manager foreign key (name)
      references manager (name) on delete restrict on update restrict;

alter table news add constraint FK_news_newstype foreign key (typeid)
      references newstype (typeid) on delete restrict on update restrict;

alter table teamprocess add constraint FK_teamprocess_manager foreign key (name)
      references manager (name) on delete restrict on update restrict;

