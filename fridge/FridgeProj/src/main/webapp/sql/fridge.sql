
/* Drop Tables

DROP TABLE chat CASCADE CONSTRAINTS;
DROP TABLE follow CASCADE CONSTRAINTS;
DROP TABLE f_com CASCADE CONSTRAINTS;
DROP TABLE f_imgsrc CASCADE CONSTRAINTS;
DROP TABLE f_like CASCADE CONSTRAINTS;
DROP TABLE f_bbs CASCADE CONSTRAINTS;
DROP TABLE trade CASCADE CONSTRAINTS;
DROP TABLE ingrediant CASCADE CONSTRAINTS;
DROP TABLE m_agree CASCADE CONSTRAINTS;
DROP TABLE t_com CASCADE CONSTRAINTS;
DROP TABLE t_imgsrc CASCADE CONSTRAINTS;
DROP TABLE t_like CASCADE CONSTRAINTS;
DROP TABLE t_bbs CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;

 */

/* Drop Sequences

DROP SEQUENCE SEQ_chat;
DROP SEQUENCE SEQ_f_bbs;
DROP SEQUENCE SEQ_f_com;
DROP SEQUENCE SEQ_f_imgsrc;
DROP SEQUENCE SEQ_f_like;
DROP SEQUENCE SEQ_ingrediant;
DROP SEQUENCE SEQ_trade;
DROP SEQUENCE SEQ_t_bbs;
DROP SEQUENCE SEQ_t_com;
DROP SEQUENCE SEQ_t_imgsrc;
DROP SEQUENCE SEQ_t_like;

 */


/* Create Sequences */

CREATE SEQUENCE SEQ_chat nocache nocycle INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_f_bbs nocache nocycle INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_f_com nocache nocycle INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_f_imgsrc nocache nocycle INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_f_like nocache nocycle INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ingrediant nocache nocycle INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_trade nocache nocycle INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_t_bbs nocache nocycle INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_t_com nocache nocycle INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_t_imgsrc nocache nocycle INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_t_like nocache nocycle INCREMENT BY 1 START WITH 1;



/* Create Tables */


CREATE TABLE member
(
	id varchar2(40) NOT NULL,
	pwd varchar2(15) NOT NULL,
	nick nvarchar2(10) NOT NULL UNIQUE,
	addr nvarchar2(30) NOT NULL,
	imgsrc nvarchar2(100),
	regdate date DEFAULT sysdate,
	PRIMARY KEY (id)
);


CREATE TABLE chat
(
	c_no number NOT NULL,
	c_src varchar2(40) NOT NULL,
	c_dest varchar2(40) NOT NULL,
	c_content nvarchar2(500) NOT NULL,
	c_date date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (c_no)
);


CREATE TABLE follow
(
	f_src varchar2(40) NOT NULL,
	f_dest varchar2(40) NOT NULL,
	UNIQUE (f_src, f_dest)
);


CREATE TABLE ingrediant
(
	i_no number NOT NULL,
	id varchar2(40) NOT NULL,
	i_name nvarchar2(20) NOT NULL,
	i_cnt number NOT NULL,
	i_enddate date NOT NULL,
	PRIMARY KEY (i_no)
);


CREATE TABLE m_agree
(
	id varchar2(40) NOT NULL,
	a_base char(1) NOT NULL,
	a_marketing char(1) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE f_bbs
(
	fb_no number NOT NULL,
	id varchar2(40) NOT NULL,
	fb_title nvarchar2(100) DEFAULT '제목없음' NOT NULL,
	fb_content nvarchar2(2000) NOT NULL,
	fb_postdate date DEFAULT sysdate,
	PRIMARY KEY (fb_no)
);


CREATE TABLE f_imgsrc
(
	fi_no number NOT NULL,
	fb_no number NOT NULL,
	fi_src nvarchar2(100),
	PRIMARY KEY (fi_no)
);


CREATE TABLE f_com
(
	fc_no number NOT NULL,
	id varchar2(40) NOT NULL,
	fb_no number NOT NULL,
	fc_content nvarchar2(500) NOT NULL,
	fc_postdate date DEFAULT sysdate,
	PRIMARY KEY (fc_no)
);


CREATE TABLE f_like
(
	fl_no number NOT NULL,
	id varchar2(40) NOT NULL,
	fb_no number NOT NULL,
	PRIMARY KEY (fl_no)
);


CREATE TABLE t_bbs
(
	tb_no number NOT NULL,
	id varchar2(40) NOT NULL,
	tb_title nvarchar2(100) NOT NULL,
	tb_content nvarchar2(2000) NOT NULL,
	tb_postdate date DEFAULT sysdate,
	PRIMARY KEY (tb_no)
);


CREATE TABLE t_imgsrc
(
	ti_no number NOT NULL,
	tb_no number NOT NULL,
	ti_src nvarchar2(100),
	PRIMARY KEY (ti_no)
);



CREATE TABLE t_com
(
	tc_no number NOT NULL,
	id varchar2(40) NOT NULL,
	tb_no number NOT NULL,
	tc_content nvarchar2(500) NOT NULL,
	tc_postdate date DEFAULT sysdate,
	PRIMARY KEY (tc_no)
);


CREATE TABLE t_like
(
	tl_no number NOT NULL,
	id varchar2(40) NOT NULL,
	tb_no number NOT NULL,
	PRIMARY KEY (tl_no)
);


CREATE TABLE trade
(
	t_no number NOT NULL,
	i_no number NOT NULL,
	tb_no number NOT NULL,
	t_deadline date NOT NULL,
	t_cnt number NOT NULL,
	t_result char(1) DEFAULT 'F' NOT NULL,
	PRIMARY KEY (t_no)
);


/* Create Foreign Keys */


ALTER TABLE chat
	ADD FOREIGN KEY (c_src)
	REFERENCES member (id)
;


ALTER TABLE chat
	ADD FOREIGN KEY (c_dest)
	REFERENCES member (id)
;


ALTER TABLE follow
	ADD FOREIGN KEY (f_src)
	REFERENCES member (id)
;


ALTER TABLE follow
	ADD FOREIGN KEY (f_dest)
	REFERENCES member (id)
;

ALTER TABLE ingrediant
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE m_agree
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE f_bbs
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE f_com
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE f_like
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE f_com
	ADD FOREIGN KEY (fb_no)
	REFERENCES f_bbs (fb_no)
;


ALTER TABLE f_imgsrc
	ADD FOREIGN KEY (fb_no)
	REFERENCES f_bbs (fb_no)
;


ALTER TABLE f_like
	ADD FOREIGN KEY (fb_no)
	REFERENCES f_bbs (fb_no)
;


ALTER TABLE t_bbs
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE t_com
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE t_like
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE t_com
	ADD FOREIGN KEY (tb_no)
	REFERENCES t_bbs (tb_no)
;


ALTER TABLE t_imgsrc
	ADD FOREIGN KEY (tb_no)
	REFERENCES t_bbs (tb_no)
;


ALTER TABLE t_like
	ADD FOREIGN KEY (tb_no)
	REFERENCES t_bbs (tb_no)
;


ALTER TABLE trade
	ADD FOREIGN KEY (i_no)
	REFERENCES ingrediant (i_no)
;


ALTER TABLE trade
	ADD FOREIGN KEY (tb_no)
	REFERENCES t_bbs (tb_no)
;

