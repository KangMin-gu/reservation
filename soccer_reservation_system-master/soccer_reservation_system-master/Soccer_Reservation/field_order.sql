create table field_order (
num number primary key,
field_name varchar2(30),
field_date varchar2(30),
<<<<<<< HEAD
field_m_time varchar2(50),
=======
>>>>>>> hanbyeol
field_m_tname varchar2(50),
field_m_teamNp number,
field_m_phone varchar2(30),
field_m_id varchar2(50),
field_m_etc clob,
<<<<<<< HEAD
field_a_time varchar2(50),
=======
>>>>>>> hanbyeol
field_a_tname varchar2(50),
field_a_teamNp number,
field_a_phone varchar2(30),
field_a_id varchar2(50),
field_a_etc clob,
<<<<<<< HEAD
field_n_time varchar2(50),
=======
>>>>>>> hanbyeol
field_n_tname varchar2(50),
field_n_teamNp number,
field_n_phone varchar2(30),
field_n_id varchar2(50),
field_n_etc clob
)
create sequence field_order_seq