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

import lombok.RequiredArgsConstructor;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PlayServiceImpl implements PlayService {

    private final playDao dao;
   
    /* 
     * 로그인 페이지 > 로그인 > 아이디찾기 
     */
    @Override
    public String find_user_id(String email) {
        return dao.find_user_id(email);
    }
    /*
     * 로그인 페이지 > 로그인 > 비밀번호 찾기
     */
    public String find_user_pw(HashMap<String,Object> map) {
        return dao.find_user_pw(map);
    }
    /*
     * 로그인 페이지 > 로그인 > 비밀번호 비교
     */
    @Override
    public String loginPass(String inputId) {
    	return dao.loginPass(inputId);
    }
    /*
     * 로그인 권한
     */
    @Override
    public String selectAuthority(String inputId) {
    	return dao.selectAuthority(inputId);
    }
    /* 
     * 회원가입 페이지 > 회원가입 > 데이터 넣기
     */
    @Override
    public void insertSeqNumber(membersBean bean) {
        dao.insertSeqNumber(bean);
    }
    /* 
     * 회원가입 페이지 > 회원가입 > 아이디 중복체크
     */ 
    @Override
    public String ajaxGetId(String id) {
    	return dao.ajaxGetId(id);
    }  
    /* 
     * 회원가입 페이지 > 회원가입 > 닉네임 중복체크 
     */     
    @Override
    public String ajaxGetNickname(String nickname) {
    	return dao.ajaxGetNickname(nickname);
    }   
    /*
     * 마이 페이지 > 프로필 수정 > 검색
     */       	
	@Override
	public membersBean getViewProfile(String members_id) throws Exception {
	 return dao.getViewProfile(members_id);
	}
    /*
     * 마이 페이지 > 프로필 수정 > 수정
     */       	
	@Override
	public void postViewProfile(membersBean bean) {
		dao.postViewProfile(bean);
	}
    /*
     * 마이 페이지 > 게스트 후기 > 기본키 생성
     */
	@Override
	public Integer getGuestReviewSequence() {
		return dao.getGuestReviewSequence();
	}
	/*
     * 마이 페이지 > 게스트 후기 > 데이터 넣기
     */	
	@Override
	public String insertGuestReview(GuestReviewBean bean) {
		return dao.insertGuestReview(bean);
	}
	/*
     * 마이 페이지 > 게스트 후기 > 호스트리뷰 검색(작성자 기준) 
     */	
	@Override
	public List<GuestReviewBean> selectGuestReview1(String id){
		return dao.selectGuestReview1(id);
	}
	/*
     * 마이 페이지 > 사용자 정보 insert 임의로
     */	
	@Override
	public String insertMyInfo(membersBean bean) {
		return dao.insertMyInfo(bean);
	}
	/*
     * 마이 페이지 > 사용자 정보 select 
     */	
	@Override
	public List<membersBean> selectMyInfo(String id) {
		return dao.selectMyInfo(id);
	}
	/*
     * 검색 페이지
     */
	@Override
	public List<squadboardBean> selectBoardList(HashMap<String, Object>map) {
		return dao.selectBoardList(map);
	}
	/*
     * 메인 페이지 > 모집중인 스쿼드 > 리스트 검색
     */
	@Override
	public List<squadboardBean> squadstate0Select() {
		return dao.squadstate0Select();
	}
	/*
     * 메인 페이지 > 인기 스쿼드 > 리스트 호스트 팔로워순 검색
     */
	@Override
	public List<squadboardBean> squadPopularSelect(){
		return dao.squadPopularSelect();
	/*
     * 메인 페이지 > 인기게임 리스트 검색
     */	
	}
	@Override
	public List<gamegenreBean> popularGameListSelect(){
		return dao.popularGameListSelect();
	}
	/*
     * 스쿼드 게시판 > 생성 페이지 > 아이디로 닉네임 return 
     */	
	@Override
	public String getUserName(String writerId) {
		return dao.getUserName(writerId);
	}
	/*
     * 스쿼드 게시판 > 생성 페이지 > 게임 이미지 호출 
     */	
	@Override
	public String gameImgSrcSelect(int no) {
		return dao.gameImgSrcSelect(no);
	}
	/*
     * 스쿼드 게시판 > 생성 페이지 > 스쿼드 모집 게시판 PK 생성
     */	
	@Override
	public int getSquadBoardSequence() {
		return dao.getSquadBoardSequence();
	}
	/*
     * 스쿼드 게시판 > 생성 페이지 > 스쿼드 모집 글 insert
     */	
	@Override
	public void insertSquadBoard(squadboardBean bean) {
		dao.insertSquadBoard(bean);
	}
	/*
     * 스쿼드 게시판 페이지 > 스쿼드 상세내용 검색
     */	
	@Override
	public Object selectSquadBoardInfo(int squadboardno) {
		return dao.selectSquadBoardInfo(squadboardno);
	}
	/*
     * 스쿼드 게시판 페이지 > 호스트 기준 > 스쿼드 정보 리스트 검색
     */	
	@Override
	public List<squadboardBean>selectSquadBoardHost (HashMap<String, Object> map){
		return dao.selectSquadBoardHost(map);
	}
	/*
     * 스쿼드 게시판 페이지 > 호스트 기준 > 리뷰 리스트 검색
     */	
	@Override
	public List<hostreviewBean>selectHostReviewHost(String hostId){
		return dao.selectHostReviewHost(hostId);
	}
	/*
     * 스쿼드 게시판 페이지 > 호스트 기준 > 게시판 수 
     */	
	@Override
	public int selectSquadCnt(String hostId) {
		return dao.selectSquadCnt(hostId);
	}
	/*
     * 스쿼드 게시판 페이지 > 참가버튼 > 참가기록 넣기
     */	
	@Override
	public void insertSquadHistory(squadhistoryBean bean) {
		dao.insertSquadHistory(bean);
	}
	/*
     * 스쿼드 게시판 페이지 > 참가버튼 > 수락대기 넣기
     */	
	@Override
	public void insertAcceptWaitting(acceptwaittingBean bean) {
		dao.insertAcceptWaitting(bean);
	}
	/*
     * 스쿼드 게시판 페이지 > 참가버튼 > 참가기록 기본키 생성
     */	
	@Override
	public Integer getSequence_SquadHistory() {
		return dao.getSequence_SquadHistory();
	}
	/*
     * 스쿼드 게시판 페이지 > 참가버튼 > 수락대기 기본키 생성
     */	
	@Override
	public Integer getSequence_AcceptWaitting() {
		return dao.getSequence_AcceptWaitting();
	}
	/*
     * 스쿼드 게시판 페이지 > 참가버튼 > 참가자 수 증가
     */	
	@Override
	public void updateSB_acceptcnt_increase(int squadboardno) {
		dao.updateSB_acceptcnt_increase(squadboardno);
	}
	/*
     * 스쿼드 게시판 페이지 > 참가버튼 > 참가자 수 감소
     */	
	@Override
	public void updateSB_acceptcnt_decrease(int squadboardno) {
		dao.updateSB_acceptcnt_decrease(squadboardno);
	}
	/*
     * 스쿼드 게시판 페이지 > 참가나 신청 중인지 여부 확인(참가기록 테이블)
     */	
	@Override
	public String selectIdSquadHistory(HashMap<String, Object>map) {
		return dao.selectIdSquadHistory(map);
	}
	/*
     * 스쿼드 게시판 페이지 > 참가나 신청 중인지 여부 확인(신청여부 테이블)
     */	
	@Override
	public String selectIdAcceptWaitting(HashMap<String, Object>map) {
		return dao.selectIdAcceptWaitting(map);
	}
	/*
     * 스쿼드 게시판 페이지 > Ajax검색(예약시간)
     */	
	public String selectReserveDate(int squadboardno) {
		return dao.selectReserveDate(squadboardno);
	}	
	/*
     * 스쿼드 게시판 페이지 > 상태 수정
     */	
	public void updateSquadState(int squadboardno) {	
		 dao.updateSquadState(squadboardno);
	}
	/*
     * 공지사항 페이지 > 기본키 생성
     */	
	@Override
	public Integer getSequence2() {
		return dao.getSequence2();
	}
	/*
     * 공지사항 페이지 > 데이터 넣기
     */	
	@Override
	public String insertNoticeBoard(NoticeBoardBean bean) {
		return dao.insertNoticeBoard(bean);
	}
	/*
     * 공지사항 페이지 > 검색
     */	
	@Override
	public List<NoticeBoardBean> selectNoticeBoard() {
		return dao.selectNoticeBoard();
	}
	
	
	
	

	/*
     * 기타??
     */	
	@Override
	public int getUserNo(String writerId) {
		return dao.getUserNo(writerId);
	}

	
	
	
	
	
	
	
	
	
	
	
  
	

	
	
}