create table erp_customer(
	tbl_no number(5)primary key,
	cus_no varchar2(12 char)not null,
	cus_name varchar2(30 char)not null,
	cus_regno varchar2(20 char)not null,
	cus_owner varchar2(50 char)not null,
	cus_addr varchar2(100 char)not null,
	cus_division number(5)not null,
	cus_note varchar2(2048 char)not null
);
create sequence erp_customer_seq;
select * from ERP_CUSTOMER;
select * from erp_customer where cus_no like '%||cus03||%'
insert into erp_customer values(erp_customer_seq.nextval,'cus_no','cus_name','cus_regno','cus_owner','cus_addr',1,'scscsc');

-- --------------------------------------
create table erp_product(
	tbl_no number(5)primary key,
	pro_no varchar2(12 char)not null,
	pro_name varchar2(30 char)not null,
	pro_unit varchar2(20 char)not null,
	pro_weight number(5)not null,
	pro_buy number(5)not null,
	pro_sell number(5)not null,
	pro_note varchar2(2048 char)not null
);
create sequence erp_product_seq;
select * from erp_product;
-- --------------------------------------
create table erp_container(
	con_no varchar2(12 char)not null,
	con_name varchar2(30 char)not null,
	con_note varchar2(2048 char)not null
);
drop table erp_container cascade constraint;
-- --------------------------------------
create table erp_currency(
	cur_no varchar2(12 char)not null,
	cur_name varchar2(30 char)not null,
	cur_money number(10,2)not null,
	cur_note varchar2(2048 char)
);
drop table erp_currency cascade constraint;
-- --------------------------------------
create table erp_sales(
	s_no number(5)primary key,
	s_date date not null,
	s_cus varchar2(120 char),
	s_m_id varchar2(200 char),
	s_con varchar2(120 char),
	s_cur varchar2(120 char),
	s_type varchar2(100 char),
	s_pro_no varchar2(120 char),
	s_qty number(10),
	s_pro_price number(10,2),
	s_price number(10,2),
	s_tax number(10),
	s_sum number(10,2)
);
create sequence erp_sales_seq;
select * from erp_sales;
drop table erp_sales cascade constraint;
-- --------------------------------------
create table erp_division(
	d_no number(5)not null,
	d_inout number(5)not null,
	d_note varchar2(20 char)not null
);
-- --------------------------------------
create table erp_member(
	m_id varchar2(20 char)primary key,
	m_pw varchar2(20 char)not null,
	m_name varchar2(20 char)not null,
	m_email varchar2(40 char)not null,
	m_addr varchar2(100 char)not null,
	m_photo varchar2(150 char)not null
);
select * from erp_member;
-- --------------------------------------
create table erp_chat(
	chatID number(5),
	fromID varchar2(20 char),
	toID varchar2(20 char),
	chatContent varchar2(100 char),
	chatTime date 
);
create sequence erp_chat_seq;
-- --------------------------------------
create table erp_bbs(
	b_no number(5)primary key,
	b_owner varchar2(20 char),
	b_type varchar2(20 char),
	b_title varchar2(100 char),
	b_txt varchar2(2048 char),
	b_date date,
	b_img varchar2(1000 char)
);
create sequence erp_bbs_seq;
select * from erp_bbs;
drop table erp_bbs cascade constraint;


-- --------------------------------------
create table erp_bbs_reply(
	br_no number(5)primary key,
	br_b_no number(5)not null,
	br_owner varchar2(20 char),
	br_txt varchar2(2048 char),
	br_date date
);
create sequence erp_bbs_reply_seq;
select * from erp_bbs_reply;

alter table erp_bbs_reply add constraint erp_bbs_reply_const foreign key(br_b_no) references erp_bbs(b_no) on delete cascade;

