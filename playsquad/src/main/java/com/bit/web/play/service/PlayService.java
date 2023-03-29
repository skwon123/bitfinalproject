package com.bit.web.play.service;

import java.util.HashMap;
import java.util.List;

import com.bit.web.play.vo.GuestReviewBean;
import com.bit.web.play.vo.NoticeBoardBean;
import com.bit.web.play.vo.acceptwaittingBean;
import com.bit.web.play.vo.gamegenreBean;
import com.bit.web.play.vo.hostreviewBean;
import com.bit.web.play.vo.membersBean;
import com.bit.web.play.vo.squadboardBean;
import com.bit.web.play.vo.squadhistoryBean;



public interface PlayService {

    /* 
     * �α��� ������ > �α��� > ���̵�ã�� 
     */
    String find_user_id(String email);
    /*
     * �α��� ������ > �α��� > ��й�ȣ ã��
     */
    String find_user_pw(HashMap<String,Object> map);
    /*
     * �α��� ������ > �α��� > ��й�ȣ ��
     */
    String loginPass(String inputId);
    /*
     * ����
     */
    public String selectAuthority(String inputId);
    /* 
     * ȸ������ ������ > ȸ������ > ������ �ֱ�
     */
    void insertSeqNumber(membersBean bean);
    /* 
     * ȸ������ ������ > ȸ������ > ���̵� �ߺ�üũ
     */ 
    String ajaxGetId(String id);
    /* 
     * ȸ������ ������ > ȸ������ > �г��� �ߺ�üũ 
     */   
    String ajaxGetNickname(String nickname);
    /* 
     * ���� ������ > ������ ���� > �˻�
     */        
    membersBean getViewProfile(String members_id) throws Exception;
    /*
     * ���� ������ > ������ ���� > ����
     */
    void postViewProfile(membersBean bean);
    /*
     * ���� ������ > �Խ�Ʈ �ı� > �⺻Ű ����
     */
    Integer getGuestReviewSequence();
	/*
     * ���� ������ > �Խ�Ʈ �ı� > ������ �ֱ�
     */	
    String insertGuestReview(GuestReviewBean bean);
	/*
     * ���� ������ > �Խ�Ʈ �ı� > ȣ��Ʈ���� �˻�(�ۼ��� ����) 
     */	
    List<GuestReviewBean> selectGuestReview1(String id);
	/*
     * ���� ������ > ����� ���� insert ���Ƿ�
     */	
    String insertMyInfo(membersBean bean);
	/*
     * ���� ������ > ����� ���� select 
     */	
    List<membersBean> selectMyInfo(String id);
	/*
     * �˻� ������
     */
    List<squadboardBean> selectBoardList(HashMap<String, Object>map);
	/*
     * ���� ������ > �������� ������ > ����Ʈ �˻�
     */ 
    public List<squadboardBean> squadstate0Select();
	/*
     * ���� ������ > �α� ������ > ����Ʈ ȣ��Ʈ �ȷο��� �˻�
     */
    List<squadboardBean> squadPopularSelect();
	/*
     * ���� ������ > �α���� ����Ʈ �˻�
     */	
    public List<gamegenreBean> popularGameListSelect();
	/*
     * ������ �Խ��� > ���� ������ > ���̵�� �г��� return 
     */	
    public String getUserName(String writerId);
	/*
     * ������ �Խ��� > ���� ������ > ���� �̹��� ȣ�� 
     */	
    public String gameImgSrcSelect(int no);
	/*
     * ������ �Խ��� > ���� ������ > ������ ���� �Խ��� PK ����
     */	
    public int getSquadBoardSequence();
	/*
	 * ������ �Խ��� > ���� ������ > ������ ���� �� insert
	 */	
    public void insertSquadBoard(squadboardBean bean);
	/*
     * ������ �Խ��� ������ > ������ �󼼳��� �˻�
     */	
    Object selectSquadBoardInfo(int squadboardno);
	/*
     * ������ �Խ��� ������ > ȣ��Ʈ ���� > ������ ���� ����Ʈ �˻�
     */	
    List<squadboardBean>selectSquadBoardHost (HashMap<String, Object> map);
	/*
     * ������ �Խ��� ������ > ȣ��Ʈ ���� > ���� ����Ʈ �˻�
     */	
    List<hostreviewBean>selectHostReviewHost(String hostId);
	/*
     * ������ �Խ��� ������ > ȣ��Ʈ ���� > �Խ��� �� 
     */	
    int selectSquadCnt(String hostId);
	/*
     * ������ �Խ��� ������ > ������ư > ������� �ֱ�
     */	
    void insertSquadHistory(squadhistoryBean bean);
	/*
     * ������ �Խ��� ������ > ������ư > ������� �ֱ�
     */	
    void insertAcceptWaitting(acceptwaittingBean bean);
	/*
     * ������ �Խ��� ������ > ������ư > ������� �⺻Ű ����
     */	
    Integer getSequence_SquadHistory();
	/*
     * ������ �Խ��� ������ > ������ư > ������� �⺻Ű ����
     */	
    Integer getSequence_AcceptWaitting();
	/*
     * ������ �Խ��� ������ > ������ư > ������ �� ����
     */	
    void updateSB_acceptcnt_increase(int squadboardno);
	/*
     * ������ �Խ��� ������ > ������ư > ������ �� ����
     */	
    void updateSB_acceptcnt_decrease(int squadboardno) ;
	/*
     * ������ �Խ��� ������ > ������ ��û ������ ���� Ȯ��(������� ���̺�)
     */	
    String selectIdSquadHistory(HashMap<String, Object>map);
	/*
     * ������ �Խ��� ������ > ������ ��û ������ ���� Ȯ��(��û���� ���̺�)
     */	
    String selectIdAcceptWaitting(HashMap<String, Object>map);
	/*
     * ������ �Խ��� ������ > Ajax�˻�(����ð�)
     */	
    String selectReserveDate(int squadboardno);
	/*
     * ������ �Խ��� ������ > ���� ����
     */	
    void updateSquadState(int squadboardno);
	/*
     * �������� ������ > �⺻Ű ����
     */	
    Integer getSequence2();
	/*
     * �������� ������ > ������ �ֱ�
     */	
    String insertNoticeBoard(NoticeBoardBean bean);
	/*
     * �������� ������ > �˻�
     */	
    List<NoticeBoardBean> selectNoticeBoard();
    

	/*
     * ??��Ÿ?
     */	
    int getUserNo(String writerId);

    
    
    
   
    
    
}