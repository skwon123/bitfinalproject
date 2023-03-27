package com.bit.web.play.dao;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.web.play.vo.GuestReviewBean;
import com.bit.web.play.vo.NoticeBoardBean;
import com.bit.web.play.vo.acceptwaittingBean;
import com.bit.web.play.vo.gamegenreBean;
import com.bit.web.play.vo.hostreviewBean;
import com.bit.web.play.vo.membersBean;
import com.bit.web.play.vo.squadboardBean;
import com.bit.web.play.vo.squadhistoryBean;

@Repository
public class playDao extends SqlSessionDaoSupport{
	
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}	
	// 로그인 페이지
	// 로그인 > 아이디찾기 
	public String find_user_id(String email) {
		return this.getSqlSession().selectOne("idSearch", email);
	}
	// 로그인 > 비밀번호 찾기
	public String find_user_pw(HashMap<String,Object> map) {
		return this.getSqlSession().selectOne("pwSearch", map);
	}
	// 로그인 > 비밀번호 비교
	public String loginPass(String inputId) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne("loginPass", inputId);
	}
	//권한
	public String selectAuthority(String inputId) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne("selectAuthority", inputId);
	}
		
	//회원가입 페이지
	//회원가입 > 데이터 넣기
	public void insertSeqNumber(membersBean bean) {
		this.getSqlSession().insert("insertSeqNumber", bean);
	}				
	//회원가입 > 아이디 중복체크
	public String ajaxGetId(String id) {
		return this.getSqlSession().selectOne("ajaxGetId", id);
	}
	//회원가입 > 닉네임 중복체크 
	public String ajaxGetNickname(String nickname) {
		return this.getSqlSession().selectOne("ajaxGetNickname", nickname);
	}
		
	//마이페이지
	//마이페이지 > 프로필 수정 > 검색
	public membersBean getViewProfile(String members_id) {
	    return this.getSqlSession().selectOne("getViewProfile", members_id);
	}
	//마이페이지 > 프로필 수정 > 수정
	public void postViewProfile(membersBean bean) {
		this.getSqlSession().update("postViewProfile", bean);
	}
	
//	public void postViewProfile(membersBean bean) {
//		this.getSqlSession().update("PostViewProfile", bean);
//	}
	
	//검색페이지
	//검색 기능
	public List<squadboardBean>selectBoardList(HashMap<String, Object>map){
		return this.getSqlSession().selectList("selectBoardList", map);
	}
	
	//메인페이지
	// 모집중인 스쿼드 리스트 검색
	public List<squadboardBean> squadstate0Select(){
		return this.getSqlSession().selectList("squadstate0Select");
	}
	// 인기 스쿼드 리스트 호스트 팔로워순 검색
	public List<squadboardBean> squadPopularSelect(){
		return this.getSqlSession().selectList("squadPopularSelect");
	}
	// 인기게임 리스트 검색
	public List<gamegenreBean> popularGameListSelect(){
		return this.getSqlSession().selectList("popularGameListSelect");
	}
		
	
	// 스쿼드게시판 생성 페이지
	// 유저 아이디로 닉네임 return
	public String getUserName(String writerId) {
		return this.getSqlSession().selectOne("getUserName", writerId);
	}
	// 게임 이미지 호출
	public String gameImgSrcSelect(int no) {
		return this.getSqlSession().selectOne("gameImgSrcSelect", no);
	}
	// 스쿼드 모집 게시판 PK 생성
	public int getSquadBoardSequence() {
		return this.getSqlSession().selectOne("getSquadBoardSequence");
	}
	// 스쿼드 모집 글 insert
	public void insertSquadBoard(squadboardBean bean) {
		this.getSqlSession().insert("insertSquadBoard", bean);
	}

	
	//스쿼드 게시판 페이지
	//스쿼드게시판 > 스쿼드 상세내용 검색
	public Object selectSquadBoardInfo(int squadboardno) {
		return this.getSqlSession().selectOne("selectSquadBoardInfo", squadboardno);
	}
			
	//스쿼드게시판 > 호스트기준 스쿼드 정보 리스트 검색
	public List<squadboardBean>selectSquadBoardHost(String hostId){
		return this.getSqlSession().selectList("selectSquadBoardHost", hostId);
	}
	//스쿼드게시판 > 호스트기준 리뷰 리스트 검색
	public List<hostreviewBean>selectHostReviewHost(String hostId){
		return this.getSqlSession().selectList("selectHostReviewHost", hostId);
	}		
	//스쿼드 참가
	//스쿼드게시판 > 참가버튼 > 참가기록 넣기
	public void insertSquadHistory(squadhistoryBean bean) {
		this.getSqlSession().insert("insertSquadHistory", bean);
	}
	//스쿼드게시판 > 참가버튼 > 수락대기 넣기
	public void insertAcceptWaitting(acceptwaittingBean bean) {
		this.getSqlSession().insert("insertAcceptWaitting", bean);
	}
	//스쿼드게시판 > 참가버튼 > 참가기록 기본키 생성
	public Integer getSequence_SquadHistory() {
		return this.getSqlSession().selectOne("getSequence_SquadHistory");
	}
	//스쿼드게시판 > 참가버튼 > 수락대기 기본키 생성
	public Integer getSequence_AcceptWaitting() {
		return this.getSqlSession().selectOne("getSequence_AcceptWaitting");
	}
	
	//스쿼드게시판 > 참가버튼 > 참가자 수 증가
	public void updateSB_acceptcnt_increase(int squadboardno) {
		this.getSqlSession().update("updateSB_acceptcnt_increase", squadboardno);
	}
	//스쿼드게시판 > 참가버튼 > 참가자 수 감소
	public void updateSB_acceptcnt_decrease(int squadboardno) {
		this.getSqlSession().update("updateSB_acceptcnt_decrease", squadboardno);
	}
	//스쿼드게시판 > 참가나 신청 중인지 여부 확인(참가기록 테이블)
	public String selectIdSquadHistory(HashMap<String, Object>map) {
		return this.getSqlSession().selectOne("selectIdSquadHistory", map);
	}
	//스쿼드게시판 > 참가나 신청 중인지 여부 확인(신청여부 테이블)
	public String selectIdAcceptWaitting(HashMap<String, Object>map) {
		return this.getSqlSession().selectOne("selectIdAcceptWaitting", map);
	}
	
	//공지사항 페이지
	//공지사항 > 공지사항 기본키 생성
	public Integer getSequence2() {
		return this.getSqlSession().selectOne("getSequence2");
	}
	//공지사항 > 공지사항 데이터 넣기
	public String insertNoticeBoard(NoticeBoardBean bean) {
		return this.getSqlSession().selectOne("insertNoticeBoard", bean);
	}
	//공지사항 > 공지사항 검색
	public List<NoticeBoardBean> selectNoticeBoard(){
		return this.getSqlSession().selectList("selectNoticeBoard");
	}
	
	
	//게스트 후기
	//게스트 후기 > 기본키 생성	
	public Integer getGuestReviewSequence() {
		return this.getSqlSession().selectOne("getGuestReviewSequence");		
	}
		
	//게스트 후기 > 후기 데이터 넣기
	public String insertGuestReview(GuestReviewBean bean) {
		return this.getSqlSession().selectOne("insertGuestReview", bean);
	}
		
	//게스트 후기 > 호스트리뷰 검색 (작성자 기준) 
	public List<GuestReviewBean> selectGuestReview1(String id){
		return this.getSqlSession().selectList("selectGuestReview1", id);
	}	

	
	// 사용자 정보 insert
	public String insertMyInfo(membersBean bean) {
		return this.getSqlSession().selectOne("insertMyInfo", bean);
	}
	
	//사용자 정보 select
	public List<membersBean> selectMyInfo(String id) {
		return this.getSqlSession().selectList("selectMyInfo", id);
	}
	
	// 기타?
	// 유저 아이디로 회원번호 return
	public int getUserNo(String writerId) {
		return this.getSqlSession().selectOne("getUserNo", writerId);
	}
	
	public String newAjaxGetSequence() {
		return this.getSqlSession().selectOne("newAjaxGetSequence");
	}
	

}


