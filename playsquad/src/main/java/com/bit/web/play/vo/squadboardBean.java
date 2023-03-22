package com.bit.web.play.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("squadboard")
public class squadboardBean {
	private int  squadboard_no;
	private int gamegenre_no;
	private String members_id;
	private String hostname;
	private String title;
	private String contents;
	private int user_acceptcnt;
	private int user_maxcnt;
	private int recruitoption;
	private int playtime;  
	private Date regdate;
	private Object reservedate;
	private int squadstate;
	private int price;
	private int payedstate;    
	private String filename;
	private String tags;
	
	private String gamegenre_name;
	private String gamegenre_game_img;
	private String squadstate_statename;
	
}
