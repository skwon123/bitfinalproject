package com.bit.web.play.vo;

import java.util.Date;

import lombok.Data;

@Data
public class searchType {
	
	// ���� ������ 
	private int pageNum;
	
	// �� ������ �� ������ �Խù� ����
	private int amount;
	
	// �˻� Ű���� 
	private String keyword;
	
	// �˻� Ÿ�� 
	private String type;
	
	// �˻� Ÿ�� �迭 ��ȯ
	private String[] typeArr;
	
	//�⺻ ������ -> �⺾ ���� : pageNum = 1, amount = 10 
	public searchType() {
		this(1,10);
	}
	
	/* ������ => ���ϴ� pageNum, ���ϴ� amount */
	public searchType(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
    }
	
}
