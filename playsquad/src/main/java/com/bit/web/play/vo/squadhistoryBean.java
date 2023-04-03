package com.bit.web.play.vo;

import java.util.Date;

import lombok.Data;

@Data
public class squadhistoryBean {
	private int squadhistory_no;
	private int squadboard_no;
	private String members_id;
	private Object regdate;
	
	private String members_nickname;
	private String members_profile_img;
}
