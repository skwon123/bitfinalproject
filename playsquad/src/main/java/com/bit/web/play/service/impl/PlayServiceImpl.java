package com.bit.web.play.service.impl;

import com.bit.web.play.dao.playDao;
import com.bit.web.play.service.PlayService;
import com.bit.web.play.vo.GuestReviewBean;
import com.bit.web.play.vo.NoticeBoardBean;
import com.bit.web.play.vo.acceptwaittingBean;
import com.bit.web.play.vo.gamegenreBean;
import com.bit.web.play.vo.hostreviewBean;
import com.bit.web.play.vo.membersBean;
import com.bit.web.play.vo.squadboardBean;
import com.bit.web.play.vo.squadhistoryBean;
import com.mongodb.util.Hash;

import lombok.RequiredArgsConstructor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.SqlReturnUpdateCount;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PlayServiceImpl implements PlayService {

	private final playDao dao;

	/* 
	 * �α��� ������ > �α��� > ���̵�ã�� 
	 */
	@Override
	public String find_user_id(String email) {
		return dao.find_user_id(email);
	}
	/*
	 * �α��� ������ > �α��� > ��й�ȣ ã��
	 */
	public String find_user_pw(HashMap<String,Object> map) {
		return dao.find_user_pw(map);
	}
	/*
	 * �α��� ������ > �α��� > ��й�ȣ ��
	 */
	@Override
	public String loginPass(String inputId) {
		return dao.loginPass(inputId);
	}
	/*
	 * �α��� ����
	 */
	@Override
	public String selectAuthority(String inputId) {
		return dao.selectAuthority(inputId);
	}
	/* 
	 * ȸ������ ������ > ȸ������ > ������ �ֱ�
	 */
	@Override
	public void insertSeqNumber(membersBean bean) {
		dao.insertSeqNumber(bean);
	}
	/* 
	 * ȸ������ ������ > ȸ������ > ���̵� �ߺ�üũ
	 */ 
	@Override
	public String ajaxGetId(String id) {
		return dao.ajaxGetId(id);
	}  
	/* 
	 * ȸ������ ������ > ȸ������ > �г��� �ߺ�üũ 
	 */     
	@Override
	public String ajaxGetNickname(String nickname) {
		return dao.ajaxGetNickname(nickname);
	}   
	/*
	 * ���� ������ > ������ ���� > �˻�
	 */       	
	@Override
	public membersBean getViewProfile(String members_id) throws Exception {
		return dao.getViewProfile(members_id);
	}
	/*
	 * ���� ������ > ������ ���� > ����
	 */       	
	@Override
	public void postViewProfile(membersBean bean) {
		dao.postViewProfile(bean);
	}
	/*
	 * ���� ������ > �Խ�Ʈ �ı� > �⺻Ű ����
	 */
	@Override
	public Integer getGuestReviewSequence() {
		return dao.getGuestReviewSequence();
	}
	/*
	 * ���� ������ > �Խ�Ʈ �ı� > ������ �ֱ�
	 */	
	@Override
	public void insertGuestReview(GuestReviewBean bean) {
		dao.insertGuestReview(bean);
	}
	/*
	 * ���� ������ > �Խ�Ʈ �ı� > ȣ��Ʈ���� �˻�(�ۼ��� ����) 
	 */	
	@Override
	public List<GuestReviewBean> selectGuestReview1(String id){
		return dao.selectGuestReview1(id);
	}
	/*
	 * ���� ������ > ����� ���� insert ���Ƿ�
	 */

	/*@Override
	public GuestReviewBean getReviewInfo(String host_id) {
	 return dao.getReviewInfo(host_id);
	}*/

	@Override
	public String insertMyInfo(membersBean bean) {
		return dao.insertMyInfo(bean);
	}
	/*
	 * ���� ������ > ����� ���� select 
	 */	
	@Override
	public List<membersBean> selectMyInfo(String id) {
		return dao.selectMyInfo(id);
	}
	/*
	 * �˻� ������
	 */
	@Override
	public List<squadboardBean> selectBoardList(HashMap<String, Object>map) {
		return dao.selectBoardList(map);
	}
	/*
	 * ���� ������ > �������� ������ > ����Ʈ �˻�
	 */
	@Override
	public List<squadboardBean> squadstate0Select() {
		return dao.squadstate0Select();
	}
	/*
	 * ���� ������ > �α� ������ > ����Ʈ ȣ��Ʈ �ȷο��� �˻�
	 */
	@Override
	public List<squadboardBean> squadPopularSelect(){
		return dao.squadPopularSelect();
		/*
		 * ���� ������ > �α���� ����Ʈ �˻�
		 */	
	}
	@Override
	public List<gamegenreBean> popularGameListSelect(){
		return dao.popularGameListSelect();
	}
	/*
	 * ������ �Խ��� > ���� ������ > ���̵�� �г��� return 
	 */	
	@Override
	public String getUserName(String writerId) {
		return dao.getUserName(writerId);
	}
	/*
	 * ������ �Խ��� > ���� ������ > ���� �̹��� ȣ�� 
	 */	
	@Override
	public String gameImgSrcSelect(int no) {
		return dao.gameImgSrcSelect(no);
	}
	/*
	 * ������ �Խ��� > ���� ������ > ������ ���� �Խ��� PK ����
	 */	
	@Override
	public int getSquadBoardSequence() {
		return dao.getSquadBoardSequence();
	}
	/*
	 * ������ �Խ��� > ���� ������ > ������ ���� �� insert
	 */	
	@Override
	public void insertSquadBoard(squadboardBean bean) {
		dao.insertSquadBoard(bean);
	}
	/*
	 * ������ �Խ��� ������ > ������ �󼼳��� �˻�
	 */	
	@Override
	public Object selectSquadBoardInfo(int squadboardno) {
		return dao.selectSquadBoardInfo(squadboardno);
	}
	/*
	 * ������ �Խ��� ������ > ȣ��Ʈ ���� > ������ ���� ����Ʈ �˻�
	 */	
	@Override
	public List<squadboardBean>selectSquadBoardHost (HashMap<String, Object> map){
		return dao.selectSquadBoardHost(map);
	}
	/*
	 * ������ �Խ��� ������ > ȣ��Ʈ ���� > ���� ����Ʈ �˻�
	 */	
	@Override
	public List<hostreviewBean>selectHostReviewHost(String hostId){
		return dao.selectHostReviewHost(hostId);
	}
	/*
	 * ������ �Խ��� ������ > ȣ��Ʈ ���� > �Խ��� �� 
	 */	
	@Override
	public int selectSquadCnt(String hostId) {
		return dao.selectSquadCnt(hostId);
	}
	/*
	 * ������ �Խ��� ������ > ������ư > ������� �ֱ�
	 */	
	@Override
	public void insertSquadHistory(squadhistoryBean bean) {
		dao.insertSquadHistory(bean);
	}
	/*
	 * ������ �Խ��� ������ > ������ư > ������� �ֱ�
	 */	
	@Override
	public void insertAcceptWaitting(acceptwaittingBean bean) {
		dao.insertAcceptWaitting(bean);
	}
	/*
	 * ������ �Խ��� ������ > ������ư > ������� �⺻Ű ����
	 */	
	@Override
	public Integer getSequence_SquadHistory() {
		return dao.getSequence_SquadHistory();
	}
	/*
	 * ������ �Խ��� ������ > ������ư > ������� �⺻Ű ����
	 */	
	@Override
	public Integer getSequence_AcceptWaitting() {
		return dao.getSequence_AcceptWaitting();
	}
	/*
	 * ������ �Խ��� ������ > ������ư > ������ �� ����
	 */	
	@Override
	public void updateSB_acceptcnt_increase(int squadboardno) {
		dao.updateSB_acceptcnt_increase(squadboardno);
	}
	/*
	 * ������ �Խ��� ������ > ������ư > ������ �� ����
	 */	
	@Override
	public void updateSB_acceptcnt_decrease(int squadboardno) {
		dao.updateSB_acceptcnt_decrease(squadboardno);
	}
	/*
	 * ������ �Խ��� ������ > ������ư > �����ڼ� ��
	 */
	@Override
	public String selelctCompareUserCnt(int squadboardno) {
		return dao.selelctCompareUserCnt(squadboardno);
	}
	/*
	 * ������ �Խ��� ������ > ������ ��û ������ ���� Ȯ��(������� ���̺�)
	 */	
	@Override
	public String selectIdSquadHistory(HashMap<String, Object>map) {
		return dao.selectIdSquadHistory(map);
	}
	/*
	 * ������ �Խ��� ������ > ������ ��û ������ ���� Ȯ��(��û���� ���̺�)
	 */	
	@Override
	public String selectIdAcceptWaitting(HashMap<String, Object>map) {
		return dao.selectIdAcceptWaitting(map);
	}
	/*
	 * ������ �Խ��� ������ > Ajax�˻�(����ð�)
	 */	
	@Override
	public String selectReserveDate(int squadboardno) {
		return dao.selectReserveDate(squadboardno);
	}	
	/*
	 * ������ �Խ��� ������ > ���� ����
	 */	
	@Override
	public void updateSquadState(HashMap<String, Object>map) {	
		dao.updateSquadState(map);
	}

	/*
	 *  �� ������ ������ > �Խ�Ʈ ���� ���� �� ������ �˻�
	 */
	@Override
	public List<squadboardBean>selectParticipationSquad(String hostId) {
		return dao.selectParticipationSquad(hostId);
	}
	/*
	 *  �� ������ ������ > �Խ�Ʈ ���� ���� ��� 
	 */
	@Override
	public List<squadboardBean>selectGuestHistory(String hostId) {
		return dao.selectGuestHistory(hostId);
	}
	/*
	 *  �� ������ ������ > ȣ��Ʈ ���� ���� �� ������ �˻�
	 */
	@Override
	public List<squadboardBean>selectHostingSquad(String hostId) {
		return dao.selectHostingSquad(hostId);
	}
	/*
	 *  �� ������ ������ > ȣ��Ʈ ���� ȣ���� ���
	 */
	@Override
	public List<squadboardBean>selectHostingHistory(String hostId) {
		return dao.selectHostingHistory(hostId);
	}
	/*
	 * ����������(�Խ�Ʈ) > ������ư > ������� ����  
	 */
	@Override
	public void deleteAcceptWaittingGuest(HashMap<String, Object>map) {
		dao.deleteAcceptWaittingGuest(map);
	}
	/*
	 * ����������(�Խ�Ʈ) > ������ư > ������� ����
	 */
	@Override
	public void deleteSquadHistoryGuest(HashMap<String, Object>map) {
		dao.deleteSquadHistoryGuest(map);
	}
	/*
	 * ����������(ȣ��Ʈ) > ������ư > ������� ����(���ǰԽ���)  
	 */
	@Override
	public void deleteAcceptWaittingSB(int squadboardno) {
		dao.deleteAcceptWaittingSB(squadboardno);
	}
	/*
	 * ����������(ȣ��Ʈ) > ������ư > ������� ����(���ǰԽ���)
	 */
	@Override
	public void deleteSquadHistorySB(int squadboardno) {
		dao.deleteSquadHistorySB(squadboardno);
	}
	/*
	 *  ȣ���ð��������� > ������û �Ϸ� �ο� Ȯ��
	 */
	@Override
	public List<squadboardBean>selectSquadHistoryNo(int squadboardno) {
		return dao.selectSquadHistoryNo(squadboardno);
	}
	/*
	 *  ȣ���ð��������� > ������� �ο� Ȯ��
	 */
	@Override
	public List<squadboardBean>selectAcceptWaittingNo(int squadboardno) {
		return dao.selectAcceptWaittingNo(squadboardno);
	}

	/*
	 * �������� ������ > �⺻Ű ����
	 */	
	@Override
	public Integer getSequence2() {
		return dao.getSequence2();
	}
	/*
	 * �������� ������ > ������ �ֱ�
	 */	
	@Override
	public String insertNoticeBoard(NoticeBoardBean bean) {
		return dao.insertNoticeBoard(bean);
	}
	/*
	 * �������� ������ > �˻�
	 */	
	@Override
	public List<NoticeBoardBean> selectNoticeBoard() {
		return dao.selectNoticeBoard();
	}

	/*
	 * ���������� > �α���� > ���Ӻ� ������ ����Ʈ
	 */
	@Override
	public List<squadboardBean> squadListForEachGameSelect(int gamegenre_no){
		return dao.squadListForEachGameSelect(gamegenre_no);
	}
	/*
	 * ���������� > �α���� > ���Ӻ� ȣ��Ʈ ����Ʈ
	 */
	@Override
	public List<membersBean> hostListForEachGameSelect(int gamegenre_no){
		return dao.hostListForEachGameSelect(gamegenre_no);
	}
	/*
	 * ���������� > �α���� > ���Ӻ� ���� ����
	 */
	@Override
	public List<gamegenreBean> popularGameInfoSelect(int gamegenre_no){
		return dao.gameInfoForEachGameSelect(gamegenre_no);
	}
	/* 
	 * ������ �� ������Ʈ
	 */
	@Override
	public void squadCntUpdate() {
		dao.squadCntUpdate();
	}
	/* 
	 * ���̵�� �г��� ���ؿ��� 
	 */
	@Override
	public String getNicknameById(String inputId) {
		return dao.getNicknameById(inputId);
	}
	/*
	 * ��û ������ ������(����������)
	 */
	@Override
	public List<squadboardBean> registerSquadInfoSelect(String userId){
		return dao.registerSquadInfoSelect(userId);
	}
	
	@Override
	public List<gamegenreBean> mainGamePlay(String userId){
		return dao.mainGamePlay(userId);
	}

	/*
	 * ��Ÿ??
	 */	
	@Override
	public int getUserNo(String writerId) {
		return dao.getUserNo(writerId);
	}
	@Override
	public int followTableSequence() {
		return dao.followTableSequence();
	}
	@Override
	public List<Map<String, Object>> followCheck(String my_id){
		return dao.followCheck(my_id);
	}
	@Override
	public void followTableInsert(HashMap<String, Object>map) {
		dao.followTableInsert(map);
	}
	@Override
	public void followCntDown(String host_id) {
		dao.followCntDown(host_id);
	}
	@Override
	public void followDelete(HashMap<String, Object>map) {
		dao.followDelete(map);
	}
	@Override
	public void followCntUpdate(String host_id) {
		dao.followCntUpdate(host_id);
	}
	@Override
	public int selectFollowCnt(String id) {
		return dao.selectFollowCnt(id);
	}
	


}