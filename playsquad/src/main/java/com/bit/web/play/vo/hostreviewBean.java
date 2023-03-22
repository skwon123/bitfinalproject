package com.bit.web.play.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("hostreview")
public class hostreviewBean {
	private int hostreview_no;
	private String host_id;
	private String writer_id;
	private String name;
	private String contents;
	private int score;
	private String regdate;
	private int good_cnt;
	private int ref;
	private int pnum;
	private int lev;
	private int step;
	private String job;
	private String profile_img;
}
