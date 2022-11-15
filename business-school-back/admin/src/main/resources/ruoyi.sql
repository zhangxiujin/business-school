/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2022/9/19 16:16:40                           */
/*==============================================================*/

SET FOREIGN_KEY_CHECKS=0;

drop table if exists login_log;

drop table if exists reward;

drop table if exists reward_answer;

drop table if exists users;

/*==============================================================*/
/* Table: login_log                                             */
/*==============================================================*/
create table login_log
(
    log_id               bigint not null,
    username             varchar(255),
    phone                varchar(11),
    login_time           datetime,
    create_time          datetime,
    primary key (log_id)
);

/*==============================================================*/
/* Table: reward                                                */
/*==============================================================*/
create table reward
(
    reward_id            bigint not null,
    id                   bigint,
    title                varchar(100),
    content              text,
    amount               int,
    time_out             tinyint[1] comment '0正常 1超时',
    create_time          datetime,
    primary key (reward_id)
);

alter table reward comment '主表';

/*==============================================================*/
/* Table: reward_answer                                         */
/*==============================================================*/
create table reward_answer
(
    answer_id            bigint not null,
    reward_id            bigint,
    id                   bigint,
    content              text,
    best_answer          tinyint[1] comment '0否 1是',
    answer_time          datetime,
    primary key (answer_id)
);

/*==============================================================*/
/* Table: users                                                 */
/*==============================================================*/
create table users
(
    id                   bigint not null,
    username             varchar(15),
    password             varchar(255),
    phone                varchar(11),
    age                  tinyint(3),
    nickname             varchar(20),
    sex                  tinyint(1) comment '0男 1女 2未知',
    enabled              tinyint(1) comment '0停用 1启用',
    description          varchar(300),
    create_time          datetime,
    update_time          datetime,
    primary key (id)
);

alter table reward add constraint FK_Reference_1 foreign key (id)
    references users (id) on delete restrict on update restrict;

alter table reward_answer add constraint FK_Reference_2 foreign key (reward_id)
    references reward (reward_id) on delete restrict on update restrict;

alter table reward_answer add constraint FK_Reference_3 foreign key (id)
    references users (id) on delete restrict on update restrict;
