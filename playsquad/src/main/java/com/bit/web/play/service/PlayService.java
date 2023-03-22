package com.bit.web.play.service;

import java.util.HashMap;
import java.util.List;

import com.bit.web.play.vo.membersBean;
import com.bit.web.play.vo.page;
import com.bit.web.play.vo.searchType;
import com.bit.web.play.vo.squadboardBean;



public interface PlayService {

	
    String find_user_id(String email);

    void insertSeqNumber(membersBean bean); 
    
    List<squadboardBean> selectBoardList(HashMap<String, Object>map);

//    List<membersBean> memberModifyGET(HashMap<String, Object>map);
    
    
    

    // 회원 프로필 불러오기
    
    membersBean getViewProfile(String members_id) throws Exception;
    
    void postViewProfile(membersBean bean);
    
    
}