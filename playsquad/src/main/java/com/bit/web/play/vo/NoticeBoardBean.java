package com.bit.web.play.vo;

import java.util.Date;
import lombok.Data;

@Data
public class NoticeBoardBean {
	private int noticeboard_no;
	private String writer_id;
	private String title;
	private String content;
	private Date regdate;
	//private String job;
	
}
