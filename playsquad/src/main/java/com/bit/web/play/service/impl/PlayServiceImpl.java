package com.bit.web.play.service.impl;

import com.bit.web.play.dao.playDao;
import com.bit.web.play.service.PlayService;
import com.bit.web.play.vo.hostreviewBean;
import com.bit.web.play.vo.membersBean;
import com.bit.web.play.vo.page;
import com.bit.web.play.vo.squadboardBean;

import lombok.RequiredArgsConstructor;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class PlayServiceImpl implements PlayService {

    private final playDao dao;

    @Override
    public String find_user_id(String email) {
        return dao.find_user_id(email);
    }

    @Override
    public void insertSeqNumber(membersBean bean) {
        dao.insertSeqNumber(bean);
    }
	
//	@Override
//	public List<squadboardBean> selectHostNameList(String hostname){
//		return dao.selectHostNameList(hostname);
//	}
//	

    // 검색
	@Override
	public List<squadboardBean> selectBoardList(HashMap<String, Object>map) {
		return dao.selectBoardList(map);
	}
	
	//프로필 업데이트

	@Override
	public membersBean getViewProfile(String members_id) throws Exception {

	 return dao.getViewProfile(members_id);
	}
	
	@Override
	public void postViewProfile(membersBean bean) {

		dao.postViewProfile(bean);
	}
	
	
}