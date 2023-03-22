package com.bit.web.play.vo;

import java.util.Date;

import lombok.Data;

@Data
public class GuestReviewBean {
	private int hostreview_no;
	private String host_id;
	private String writer_id;
	private String title;
	private String name;
	private String contents;
	private int score;
	private String regdate;
	private int good_cnt;
	private int ref;
	private int pnum;
	private int lev;
	private int step;
}
