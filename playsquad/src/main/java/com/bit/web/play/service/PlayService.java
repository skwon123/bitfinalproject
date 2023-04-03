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
     * 로그인 페이지 > 로그인 > 아이디찾기 
     */
    String find_user_id(String email);
    /*
     * 로그인 페이지 > 로그인 > 비밀번호 찾기
     */
    String find_user_pw(HashMap<String,Object> map);
    /*
     * 로그인 페이지 > 로그인 > 비밀번호 비교
     */
    String loginPass(String inputId);
    /*
     * 권한
     */
    public String selectAuthority(String inputId);
    /* 
     * 회원가입 페이지 > 회원가입 > 데이터 넣기
     */
    void insertSeqNumber(membersBean bean);
    /* 
     * 회원가입 페이지 > 회원가입 > 아이디 중복체크
     */ 
    String ajaxGetId(String id);
    /* 
     * 회원가입 페이지 > 회원가입 > 닉네임 중복체크 
     */   
    String ajaxGetNickname(String nickname);
    /* 
     * 마이 페이지 > 프로필 수정 > 검색
     */        
    membersBean getViewProfile(String members_id) throws Exception;
    /*
     * 마이 페이지 > 프로필 수정 > 수정
     */
    void postViewProfile(membersBean bean);
    /*
     * 마이 페이지 > 게스트 후기 > 기본키 생성
     */
    Integer getGuestReviewSequence();
	/*
     * 마이 페이지 > 게스트 후기 > 데이터 넣기
     */	
    void insertGuestReview(GuestReviewBean bean);
	/*
     * 마이 페이지 > 게스트 후기 > 호스트리뷰 검색(작성자 기준) 
     */	
    List<GuestReviewBean> selectGuestReview1(String id);
	/*
     * 마이 페이지 > 사용자 정보 insert 임의로
     */	
    String insertMyInfo(membersBean bean);
	/*
     * 마이 페이지 > 사용자 정보 select 
     */	
    List<membersBean> selectMyInfo(String id);
	/*
     * 검색 페이지
     */
    List<squadboardBean> selectBoardList(HashMap<String, Object>map);
	/*
     * 메인 페이지 > 모집중인 스쿼드 > 리스트 검색
     */ 
    public List<squadboardBean> squadstate0Select();
	/*
     * 메인 페이지 > 인기 스쿼드 > 리스트 호스트 팔로워순 검색
     */
    List<squadboardBean> squadPopularSelect();
	/*
     * 메인 페이지 > 인기게임 리스트 검색
     */	
    public List<gamegenreBean> popularGameListSelect();
	/*
     * 스쿼드 게시판 > 생성 페이지 > 아이디로 닉네임 return 
     */	
    public String getUserName(String writerId);
	/*
     * 스쿼드 게시판 > 생성 페이지 > 게임 이미지 호출 
     */	
    public String gameImgSrcSelect(int no);
	/*
     * 스쿼드 게시판 > 생성 페이지 > 스쿼드 모집 게시판 PK 생성
     */	
    public int getSquadBoardSequence();
	/*
	 * 스쿼드 게시판 > 생성 페이지 > 스쿼드 모집 글 insert
	 */	
    public void insertSquadBoard(squadboardBean bean);
    /*
     * 스쿼드 게시판 페이지 > 스쿼드 상세내용 검색
     */	
    Object selectSquadBoardInfo(int squadboardno);
	/*
     * 스쿼드 게시판 페이지 > 호스트 기준 > 스쿼드 정보 리스트 검색
     */	
    List<squadboardBean>selectSquadBoardHost (HashMap<String, Object> map);
	/*
     * 스쿼드 게시판 페이지 > 호스트 기준 > 리뷰 리스트 검색
     */	
    List<hostreviewBean>selectHostReviewHost(String hostId);
	/*
     * 스쿼드 게시판 페이지 > 호스트 기준 > 게시판 수 
     */	
    int selectSquadCnt(String hostId);
	/*
     * 스쿼드 게시판 페이지 > 참가버튼 > 참가기록 넣기
     */	
    void insertSquadHistory(squadhistoryBean bean);
	/*
     * 스쿼드 게시판 페이지 > 참가버튼 > 수락대기 넣기
     */	
    void insertAcceptWaitting(acceptwaittingBean bean);
	/*
     * 스쿼드 게시판 페이지 > 참가버튼 > 참가기록 기본키 생성
     */	
    Integer getSequence_SquadHistory();
	/*
     * 스쿼드 게시판 페이지 > 참가버튼 > 수락대기 기본키 생성
     */	
    Integer getSequence_AcceptWaitting();
	/*
     * 스쿼드 게시판 페이지 > 참가버튼 > 참가자 수 증가
     */	
    void updateSB_acceptcnt_increase(int squadboardno);
	/*
     * 스쿼드 게시판 페이지 > 참가버튼 > 참가자 수 감소
     */	
    void updateSB_acceptcnt_decrease(int squadboardno) ;
    /*
     * 스쿼드 게시판 페이지 > 참가버튼 > 참가자수 비교
     */
	String selelctCompareUserCnt(int squadboardno);
	/*
     * 스쿼드 게시판 페이지 > 참가나 신청 중인지 여부 확인(참가기록 테이블)
     */	
    String selectIdSquadHistory(HashMap<String, Object>map);
	/*
     * 스쿼드 게시판 페이지 > 참가나 신청 중인지 여부 확인(신청여부 테이블)
     */	
    String selectIdAcceptWaitting(HashMap<String, Object>map);
	/*
     * 스쿼드 게시판 페이지 > Ajax검색(예약시간)
     */	
    String selectReserveDate(int squadboardno);
	/*
     * 스쿼드 게시판 페이지 > 상태 수정
     */	
    void updateSquadState(HashMap<String, Object>map);
    
    /*
	 *  내 스쿼드 페이지 > 게스트 기준 진행 전 스쿼드 검색
	 */
	List<squadboardBean>selectParticipationSquad(String hostId);
	/*
	 *  내 스쿼드 페이지 > 게스트 기준 참가 기록 
	 */
	List<squadboardBean>selectGuestHistory(String hostId);
	/*
	 *  내 스쿼드 페이지 > 호스트 기준 종료 전 스쿼드 검색
	 */
	List<squadboardBean>selectHostingSquad(String hostId);
	/*
	 *  내 스쿼드 페이지 > 호스트 기준 호스팅 기록
	 */
	List<squadboardBean>selectHostingHistory(String hostId);
	/*
	 * 삭제페이지(게스트) > 삭제버튼 > 수락대기 삭제  
	 */
	void deleteAcceptWaittingGuest(HashMap<String, Object>map);
	/*
	 * 삭제페이지(게스트) > 삭제버튼 > 참가기록 삭제
	 */
	void deleteSquadHistoryGuest(HashMap<String, Object>map);
	/*
	 * 삭제페이지(호스트) > 삭제버튼 > 수락대기 삭제(조건게시판)  
	 */
	void deleteAcceptWaittingSB(int squadboardno);
	/*
	 * 삭제페이지(호스트) > 삭제버튼 > 참가기록 삭제(조건게시판)
	 */
	void deleteSquadHistorySB(int squadboardno);
	/*
	 *  호스팅관리페이지 > 참가신청 완료 인원 확인
	 */
	List<squadboardBean>selectSquadHistoryNo(int squadboardno);
	/*
	 *  호스팅관리페이지 > 수락대기 인원 확인
	 */
	List<squadboardBean>selectAcceptWaittingNo(int squadboardno);

	/*
     * 공지사항 페이지 > 기본키 생성
     */	
    Integer getSequence2();
	/*
     * 공지사항 페이지 > 데이터 넣기
     */	
    String insertNoticeBoard(NoticeBoardBean bean);
	/*
     * 공지사항 페이지 > 검색
     */	
    List<NoticeBoardBean> selectNoticeBoard();
    

	/*
     * ??기타?
     */	
    int getUserNo(String writerId);

    
    
    
   
    
    
}