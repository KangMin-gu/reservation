create table field 
(num number primary key, 
field_name varchar2(100) not null, 
field_addr varchar2(200) not null, 
field_morning varchar2(200) not null,
field_afternoon varchar2(200) not null,
field_night varchar2(200) not null
);

create sequence field_seq;