
/* Drop Tables */

DROP TABLE a_com CASCADE CONSTRAINTS;
DROP TABLE n_imgsrc CASCADE CONSTRAINTS;
DROP TABLE notice CASCADE CONSTRAINTS;
DROP TABLE admin CASCADE CONSTRAINTS;
DROP TABLE chat CASCADE CONSTRAINTS;
DROP TABLE follow CASCADE CONSTRAINTS;
DROP TABLE f_com CASCADE CONSTRAINTS;
DROP TABLE f_imgsrc CASCADE CONSTRAINTS;
DROP TABLE f_like CASCADE CONSTRAINTS;
DROP TABLE f_bbs CASCADE CONSTRAINTS;
DROP TABLE history CASCADE CONSTRAINTS;
DROP TABLE trade CASCADE CONSTRAINTS;
DROP TABLE ingrediant CASCADE CONSTRAINTS;
DROP TABLE m_agree CASCADE CONSTRAINTS;
DROP TABLE q_imgsrc CASCADE CONSTRAINTS;
DROP TABLE q_bbs CASCADE CONSTRAINTS;
DROP TABLE t_imgsrc CASCADE CONSTRAINTS;
DROP TABLE t_like CASCADE CONSTRAINTS;
DROP TABLE t_bbs CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_a_com_a_no;
DROP SEQUENCE SEQ_chat_chat_no;
DROP SEQUENCE SEQ_chat_c_no;
DROP SEQUENCE SEQ_c_bbs_c_no;
DROP SEQUENCE SEQ_c_com_cc_no;
DROP SEQUENCE SEQ_c_like_cl_no;
DROP SEQUENCE SEQ_fb_imgsrc_fi_no;
DROP SEQUENCE SEQ_f_bbs_fb_no;
DROP SEQUENCE SEQ_f_bbs_f_no;
DROP SEQUENCE SEQ_f_com_fc_no;
DROP SEQUENCE SEQ_f_com_tc_no;
DROP SEQUENCE SEQ_f_imgsrc_fi_no;
DROP SEQUENCE SEQ_f_like_fl_no;
DROP SEQUENCE SEQ_history_h_no;
DROP SEQUENCE SEQ_ingrediant_i_no;
DROP SEQUENCE SEQ_management_history_m_no;
DROP SEQUENCE SEQ_notice_n_no;
DROP SEQUENCE SEQ_n_imgsrc_ni_no;
DROP SEQUENCE SEQ_q_bbs_q_no;
DROP SEQUENCE SEQ_q_imgsrc_qi_no;
DROP SEQUENCE SEQ_trade_t_no;
DROP SEQUENCE SEQ_t_bbs_tb_no;
DROP SEQUENCE SEQ_t_bbs_t_no;
DROP SEQUENCE SEQ_t_com_tc_no;
DROP SEQUENCE SEQ_t_imgsrc_ti_no;
DROP SEQUENCE SEQ_t_like_tl_no;




/* Create Sequences */

CREATE SEQUENCE SEQ_a_com_a_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_chat_chat_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_chat_c_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_c_bbs_c_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_c_com_cc_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_c_like_cl_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_fb_imgsrc_fi_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_f_bbs_fb_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_f_bbs_f_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_f_com_fc_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_f_com_tc_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_f_imgsrc_fi_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_f_like_fl_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_history_h_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ingrediant_i_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_management_history_m_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_notice_n_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_n_imgsrc_ni_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_q_bbs_q_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_q_imgsrc_qi_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_trade_t_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_t_bbs_tb_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_t_bbs_t_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_t_com_tc_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_t_imgsrc_ti_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_t_like_tl_no INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE admin
(
	adminid varchar2(30) NOT NULL,
	adminpw varchar2(15) NOT NULL,
	PRIMARY KEY (adminid)
);


CREATE TABLE a_com
(
	a_no number NOT NULL,
	adminid varchar2(30) NOT NULL,
	q_no number NOT NULL,
	a_content nvarchar2(500) NOT NULL,
	a_postdate date DEFAULT SYSDATE,
	PRIMARY KEY (a_no)
);


CREATE TABLE chat
(
	c_no number NOT NULL UNIQUE,
	c_src varchar2(24) NOT NULL,
	c_dest varchar2(24) NOT NULL,
	c_content nvarchar2(500) NOT NULL,
	c_date date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (c_no)
);


CREATE TABLE follow
(
	f_src varchar2(24) NOT NULL,
	f_dest varchar2(24) NOT NULL,
	UNIQUE (f_src, f_dest)
);


CREATE TABLE f_bbs
(
	fb_no number NOT NULL,
	id varchar2(24) NOT NULL,
	fb_content nvarchar2(2000) NOT NULL,
	fb_postdate date DEFAULT sysdate,
	PRIMARY KEY (fb_no)
);


CREATE TABLE f_com
(
	fc_no number NOT NULL,
	id varchar2(24) NOT NULL,
	fb_no number NOT NULL,
	fc_content nvarchar2(500) NOT NULL,
	fc_postdate date DEFAULT sysdate,
	PRIMARY KEY (fc_no)
);


CREATE TABLE f_imgsrc
(
	fi_no number NOT NULL,
	fb_no number NOT NULL,
	fi_src nvarchar2(100),
	PRIMARY KEY (fi_no)
);


CREATE TABLE f_like
(
	fl_no number NOT NULL,
	id varchar2(24) NOT NULL,
	fb_no number NOT NULL,
	PRIMARY KEY (fl_no)
);


CREATE TABLE history
(
	h_no number NOT NULL,
	h_name nvarchar2(20) NOT NULL,
	h_cnt number NOT NULL,
	h_controltype nvarchar2(10) NOT NULL,
	id varchar2(40) NOT NULL,
	h_kind nvarchar2(10) NOT NULL,
	PRIMARY KEY (h_no)
);


CREATE TABLE ingrediant
(
	i_no number NOT NULL,
	id varchar2(24) NOT NULL,
	i_name nvarchar2(20) NOT NULL,
	i_cnt number NOT NULL,
	i_enddate date NOT NULL,
	i_postdate date NOT NULL,
	PRIMARY KEY (i_no)
);


CREATE TABLE member
(
	id varchar2(40) NOT NULL,
	pwd varchar2(15) NOT NULL,
	nick nvarchar2(10) NOT NULL UNIQUE,
	addr nvarchar2(10) NOT NULL,
	imgsrc nvarchar2(100),
	self nvarchar2(200),
	regdate date DEFAULT sysdate,
	PRIMARY KEY (id)
);


CREATE TABLE m_agree
(
	id varchar2(24) NOT NULL,
	agree nvarchar2(25) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE notice
(
	n_no number NOT NULL,
	adminid varchar2(30) NOT NULL,
	n_title nvarchar2(100) NOT NULL,
	n_content nvarchar2(2000),
	n_hit number DEFAULT 0,
	n_postdate date DEFAULT SYSDATE,
	PRIMARY KEY (n_no)
);


CREATE TABLE n_imgsrc
(
	ni_no number NOT NULL,
	n_no number NOT NULL,
	ni_src nvarchar2(100),
	PRIMARY KEY (ni_no)
);


CREATE TABLE q_bbs
(
	q_no number NOT NULL,
	id varchar2(24) NOT NULL,
	q_title nvarchar2(100) NOT NULL,
	q_content nvarchar2(2000) NOT NULL,
	q_postdate date DEFAULT SYSDATE,
	q_secret char(1),
	PRIMARY KEY (q_no)
);


CREATE TABLE q_imgsrc
(
	qi_no number NOT NULL,
	q_no number NOT NULL,
	qi_src nvarchar2(100),
	PRIMARY KEY (qi_no)
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


CREATE TABLE t_bbs
(
	tb_no number NOT NULL,
	id varchar2(24) NOT NULL,
	tb_title nvarchar2(100) NOT NULL,
	tb_content nvarchar2(2000) NOT NULL,
	tb_visitcount number DEFAULT 0 NOT NULL,
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


CREATE TABLE t_like
(
	tl_no number NOT NULL,
	id varchar2(24) NOT NULL,
	tb_no number NOT NULL,
	PRIMARY KEY (tl_no)
);



/* Create Foreign Keys */

ALTER TABLE a_com
	ADD FOREIGN KEY (adminid)
	REFERENCES admin (adminid)
;


ALTER TABLE notice
	ADD FOREIGN KEY (adminid)
	REFERENCES admin (adminid)
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


ALTER TABLE trade
	ADD FOREIGN KEY (i_no)
	REFERENCES ingrediant (i_no)
;


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


ALTER TABLE history
	ADD FOREIGN KEY (id)
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


ALTER TABLE q_bbs
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE t_bbs
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE t_like
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE n_imgsrc
	ADD FOREIGN KEY (n_no)
	REFERENCES notice (n_no)
;


ALTER TABLE a_com
	ADD FOREIGN KEY (q_no)
	REFERENCES q_bbs (q_no)
;


ALTER TABLE q_imgsrc
	ADD FOREIGN KEY (q_no)
	REFERENCES q_bbs (q_no)
;


ALTER TABLE trade
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



