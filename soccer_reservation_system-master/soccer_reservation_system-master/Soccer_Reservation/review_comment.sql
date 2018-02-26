create table board_review_comment
(num NUMBER NOT NULL, 
writer VARCHAR2(100),
content VARCHAR2(500),
target_id VARCHAR2(100),
ref_group NUMBER,
comment_group NUMBER, 
regdate date
);

create sequence board_review_seq;
