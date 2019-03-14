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
	s_note varchar2(2048 char)
);
create sequence erp_sales_seq;
select * from erp_sales;
delete from erp_sales;
drop table erp_sales cascade constraint;
-- --------------------------------------
create table erp_sub_sales(
	sb_no number(5)primary key,
	sb_s_no number(5)not null,
	sb_pro_no varchar2(120 char),
	sb_qty number(10),
	sb_pro_price number(10,2),
	sb_price number(10,2),
	sb_tax number(10),
	sb_sum number(10,2)
);
alter table erp_sub_sales add constraint erp_sub_sales_const foreign key(sb_s_no) references erp_sales(s_no) on delete cascade;
create sequence erp_sub_sales_seq;
drop table erp_sub_sales cascade constraint;
insert into erp_sals values(#{s_no},#{s_date},#{s_cus},#{s_m_id},#{s_con},#{s_cur},#{s_type},#{s_pro_no},#{s_qty},#{s_pro_price},#{s_price},#{s_tax},#{s_sum})
select max(s_no) from erp_sales 
select * from erp_sub_sales;
delete from erp_sub_sales;


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


select * from(select rownum as salesno,s_no,s_date,s_cus,s_m_id,s_cur,s_type,sb_pro_no,sb_qty,sb_pro_price,sb_price,sb_tax,sb_sum 
from (select * from erp_sales,erp_sub_sales where s_no = sb_s_no order by s_no))where salesno >=1 and salesno <= 2 order by salesno desc
select sum(sb_sum)as 합계금액 from ERP_SUB_SALES where sb_s_no = 111

select max(sb_no),count(sb_pro_no)-1 as sb_pro_no,sum(sb_sum) as sb_sum from erp_sub_sales where sb_s_no = 111

select pro_name from ERP_SUB_SALES,ERP_PRODUCT where pro_no = sb_pro_no 
select * from (select max(sb_no) from erp_sub_sales where sb_s_no = 111) 
select sum(sb_sum) from (select * from erp_sub_sales where sb_s_no = 111)
select sb_s_no,sb_pro_no, sum(sb_sum) from erp_sub_sales group by sb_pro_no
SELECT [DISTINCT] 칼럼명 [ALIAS명] FROM 테이블명 [WHERE 조건식] [GROUP BY 칼럼(Column)이나 표현식] [HAVING 그룹조건식] ;

	tbl_no number(5)primary key,
	pro_no varchar2(12 char)not null,
	pro_name varchar2(30 char)not null,
	pro_unit varchar2(20 char)not null,
	pro_weight number(5)not null,
	pro_buy number(5)not null,
	pro_sell number(5)not null,
	pro_note varchar2(2048 char)not null

	sb_no number(5)primary key,
	sb_s_no number(5)not null,
	sb_pro_no varchar2(120 char),
	sb_qty number(10),
	sb_pro_price number(10,2),
	sb_price number(10,2),
	sb_tax number(10),
	sb_sum number(10,2)
	
select sb_pro_no from (select * from (select * from erp_sub_sales where sb_s_no = 111) where sb_no = min(sb_no))

where sb_no=min(sb_no)	

select sb_pro_no,mino as sb_no,pCount as sb_pro_count ,pSum as sb_sum from erp_sub_sales ,
(select sb_s_no,min(sb_no) as mino,count(sb_pro_no)-1 as pCount,sum(sb_sum) as pSum from erp_sub_sales where sb_s_no = 111 group by sb_s_no ) where mino = sb_no


				4개중에 최소값            제품코드 4개 -1   ,  4개의 합계	
위 테이블 1개 생기면
	아래 4개 들ㅇ어감
	
select sb_pro_no,SubSales2.sb_no,SubSales2.pCount,SubSales2.sb_Sum from erp_sub_sales as subSales1 ,(select sb_s_no,min(sb_no) as sb_no,count(sb_pro_no)-1 as pCount,sum(sb_sum) as sb_Sum from erp_sub_sales where sb_s_no = 111 group by sb_s_no )as SubSales2 where mino = sb_no	
