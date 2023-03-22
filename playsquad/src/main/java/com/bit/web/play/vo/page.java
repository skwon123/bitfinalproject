package com.bit.web.play.vo;

import java.util.Date;

import lombok.Data;

@Data
public class page {
	
	// ���� ������ ��ȣ
	private int num;
	
	// �Խù� �� ����
	private int count;
	
	// �� �������� ����� �Խù� ����
	private int postNum = 10;
	
	// �ϴ� ����¡ ��ȣ ([ �Խù� �� ���� �� �� �������� ����� ���� ]�� �ø�)
	private int pageNum;
	
	// ����� �Խù�
	private int displayPost;
	
	// �ѹ��� ǥ���� ����¡ ��ȣ�� ����
	private int pageNumCnt = 10;
	
	// ǥ�õǴ� ������ ��ȣ �� ������ ��ȣ
	private int endPageNum;
	
	// ǥ�õǴ� ������ ��ȣ �� ù��° ��ȣ
	private int startPageNum;
	
	// ����/���� ǥ�� ����
	private boolean prev;
	private boolean next;
	
	
	public void setCount(int count) {
		this.count = count;
		
		dataCalc();
	}
	
	private void dataCalc() {
		
		// ������ ��ȣ
		endPageNum = (int)(Math.ceil((double)num / (double)pageNumCnt) * pageNumCnt);
		
		// ���� ��ȣ
		startPageNum = endPageNum - (pageNumCnt - 1);
		
		// ������ ��ȣ ����
		int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNumCnt));
		
		if(endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}
		
		prev = startPageNum == 1 ? false : true;
		next = endPageNum * pageNumCnt >= count ? false : true;
		
		displayPost = (num - 1) * postNum;
		
	}	
}
