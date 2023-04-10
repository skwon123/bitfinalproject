package com.bit.web.play.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	void insertGuestReview(GuestReviewBean bean);
	/*
	 * ���� ������ > �Խ�Ʈ �ı� > ȣ��Ʈ���� �˻�(�ۼ��� ����) 
	 */	
	List<GuestReviewBean> selectGuestReview1(String id);
	/*
	 * ���� ������ > ����� ���� insert ���Ƿ�
	 */

	//GuestReviewBean getReviewInfo(String host_id);

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
	 * ������ �Խ��� ������ > ������ư > �����ڼ� ��
	 */
	String selelctCompareUserCnt(int squadboardno);
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
	void updateSquadState(HashMap<String, Object>map);

	/*
	 *  �� ������ ������ > �Խ�Ʈ ���� ���� �� ������ �˻�
	 */
	List<squadboardBean>selectParticipationSquad(String hostId);
	/*
	 *  �� ������ ������ > �Խ�Ʈ ���� ���� ��� 
	 */
	List<squadboardBean>selectGuestHistory(String hostId);
	/*
	 *  �� ������ ������ > ȣ��Ʈ ���� ���� �� ������ �˻�
	 */
	List<squadboardBean>selectHostingSquad(String hostId);
	/*
	 *  �� ������ ������ > ȣ��Ʈ ���� ȣ���� ���
	 */
	List<squadboardBean>selectHostingHistory(String hostId);
	/*
	 * ����������(�Խ�Ʈ) > ������ư > ������� ����  
	 */
	void deleteAcceptWaittingGuest(HashMap<String, Object>map);
	/*
	 * ����������(�Խ�Ʈ) > ������ư > ������� ����
	 */
	void deleteSquadHistoryGuest(HashMap<String, Object>map);
	/*
	 * ����������(ȣ��Ʈ) > ������ư > ������� ����(���ǰԽ���)  
	 */
	void deleteAcceptWaittingSB(int squadboardno);
	/*
	 * ����������(ȣ��Ʈ) > ������ư > ������� ����(���ǰԽ���)
	 */
	void deleteSquadHistorySB(int squadboardno);
	/*
	 *  ȣ���ð��������� > ������û �Ϸ� �ο� Ȯ��
	 */
	List<squadboardBean>selectSquadHistoryNo(int squadboardno);
	/*
	 *  ȣ���ð��������� > ������� �ο� Ȯ��
	 */
	List<squadboardBean>selectAcceptWaittingNo(int squadboardno);

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
	 * ���������� > �α���� > ���Ӻ� ������ ����Ʈ
	 */
	List<squadboardBean> squadListForEachGameSelect(int gamegenre_no);
	/*
	 * ���������� > �α���� > ���Ӻ� ȣ��Ʈ ����Ʈ
	 */
	List<membersBean> hostListForEachGameSelect(int gamegenre_no);
	/*
	 * ���������� > �α���� > ���Ӻ� ���� ����
	 */
	List<gamegenreBean> popularGameInfoSelect(int gamegenre_no);
	/*
	 * ���Ӻ� ������� ������Ʈ
	 */
	void squadCntUpdate();
	/* 
	 * ���̵�� �г��� ���ؿ��� 
	 */
	String getNicknameById(String inputId);
	
	/*
	 * ��û ������ ������(����������)
	 */
	List<squadboardBean> registerSquadInfoSelect(String userId);
	
	List<gamegenreBean> mainGamePlay(String userId);

	/*
	 * ??��Ÿ?
	 */	
	int getUserNo(String writerId);
	
	//int follow(String host_id);
	int followTableSequence();
	List<Map<String, Object>> followCheck(String my_id);
	void followTableInsert(HashMap<String, Object>map);
	void followCntDown(String host_id);
	void followDelete(HashMap<String, Object>map);
	void followCntUpdate(String host_id);
	
	int selectFollowCnt(String id);
	

}