<<<<<<< HEAD:Soccer_Reservation/users.sql
create table users 
(id varchar2(100) primary key, 
name varchar2(100), 
pwd varchar2(100), 
email varchar2(200), 
phone varchar2(200), 
addr varchar2(200), 
detailaddr varchar2(200),
findquestion varchar2(200), 
findAnswer varchar2(200), 
regdate date);
=======


운동장 정보를 저장할 테이블 
create table field 
(num number primary key, 
field_name varchar2(100) not null, 
field_addr varchar2(200) not null, 
field_morning varchar2(200) not null,
field_afternoon varchar2(200) not null,
field_night varchar2(200) not null,
);

field 테이블의 시퀀스 
create sequence field_seq;
운동장의 예약가능 시간은 오전타임 10-12 오후타임 13-15  저녁타임 16-18 시 이용시간을고정으로한다. 


예약 정보를 저장할 테이블  
create table field_order (
num number primary key,
field_name varchar2(30),
field_date varchar2(30),
field_m_time varchar2(30),
field_m_tname varchar2(50),
field_m_teamNp varchar2(50),
field_m_phone varchar2(30),
field_m_id varchar2(50),
field_m_etc clob,
field_a_time varchar2(30),
field_a_tname varchar2(50),
field_a_teamNp varchar2(50),
field_a_phone varchar2(30),
field_a_id varchar2(50),
field_a_etc clob,
field_n_time varchar2(30),
field_n_tname varchar2(50),
field_n_teamNp varchar2(50),
field_n_phone varchar2(30),
field_n_id varchar2(50),
field_n_etc clob
)

field_order 테이블의 시퀀스 
create sequence field_order_seq






>>>>>>> 65a6dae11871b1ee0e87fb481e674a24eb02882e:Soccer_Reservation/table.sql
