package com.korea.k2.guestbook;

import java.sql.Date;

import lombok.Data;

@Data
public class GuestBookVO {
	private  int    idx;
	private  String title;
	private  String writer;
	private  Date   date_for;
	private  String dateStr;
	
	private  int    rownum;
	private  int    rnum;
}
