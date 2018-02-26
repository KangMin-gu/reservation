create table review 
(num NUMBER PRIMARY KEY,
writer VARCHAR2(50),
title VARCHAR2(50), 
content CLOB,
regdate date,
viewCount NUMBER
);

create sequence review_seq;