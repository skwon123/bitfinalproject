package com.bit.web.play.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("page")
public class pageBean {
	private int totalPage;
	private int start;
	private int end;
	private int currentPage;
	private int currentBlock;
	private int startPage;
	private int endPage;
	
	public pageBean() {
		super();
	}

	public pageBean(int totalPage, int start, int end, int currentPage, int currentBlock, int startPage, int endPage) {
		super();
		this.totalPage = totalPage;
		this.start = start;
		this.end = end;
		this.currentPage = currentPage;
		this.currentBlock = currentBlock;
		this.startPage = startPage;
		this.endPage = endPage;
	}
}
