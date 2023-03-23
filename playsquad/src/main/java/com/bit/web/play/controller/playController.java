package com.bit.web.play.controller;

import com.bit.web.play.dao.playDao;
import com.bit.web.play.email.MailUtil;
import com.bit.web.play.service.PlayService;
import com.bit.web.play.service.impl.PlayServiceImpl;
import com.bit.web.play.vo.hostreviewBean;
import com.bit.web.play.vo.membersBean;
import com.bit.web.play.vo.searchType;
import com.bit.web.play.vo.squadboardBean;
import com.bit.web.play.vo.squadhistoryBean;
import com.bit.web.play.vo.gamegenreBean;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.web.play.vo.GuestReviewBean;
import com.bit.web.play.vo.NoticeBoardBean;
import com.bit.web.play.vo.acceptwaittingBean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.FileOutputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;

@Controller
//TODO 0314
@RequiredArgsConstructor
@Slf4j
public class playController {

	private final playDao dao;
	//TODO 0314 서비스를 wired 해주셔야합니다.
	private final PlayService playService;
	
//로그인페이지
	//	아이디 찾기
	@RequestMapping(value = "idSearch", method = RequestMethod.GET)
	@ResponseBody
	public String sendId(@RequestParam(value ="email", required = false)String email) {
		String checkedId = dao.find_user_id(email);
		MailUtil.naverMailSend(email, "PlaySquad ID입니다.", checkedId);
		return "success";
	};

	//	비밀번호찾기
	@RequestMapping(value="pwSearch", method=RequestMethod.GET)
	@ResponseBody
	public String pwSearch(@RequestParam(value="user_id", required = false)String userId, @RequestParam(value="pw_find_email", required=false)String pw_find_email) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("pw_find_email", pw_find_email);
		return dao.find_user_pw(map);
	};
	
	//로그인 체크
	@RequestMapping(value = "playsquadLoginCheck", method = RequestMethod.POST)
	@ResponseBody
	public String loginCheck(@RequestParam(value = "id", required = false)String inputId, @RequestParam(value = "password", required = false)String inputPassword,
							HttpServletRequest req) {
		
		 String loginPass = dao.loginPass(inputId);
		 String authority = dao.selectAuthority(inputId);
		 System.out.println(inputId);
		 System.out.println(inputPassword);
		 System.out.println(loginPass);
		 if(loginPass.equals(inputPassword)) {
			 req.getSession().setAttribute("userId", inputId);
			 req.getSession().setAttribute("userAuthority", authority);
			 System.out.println(dao.selectAuthority(inputId));
			 req.getSession().setMaxInactiveInterval(60*60*24);
			 return "success";
		 }else { 
			 return "failed";
		 }
	};
	
	//	로그아웃
	@RequestMapping(value = "logoutAction")
	@ResponseBody
	public String logoutAction(HttpServletRequest req) {
		System.out.println("User Logout");
		req.getSession().invalidate();
		System.out.println("Session Deleted");
		return "Logout Success";
	};
	
	
	@RequestMapping(value = "playsquadListAction", method = RequestMethod.POST)
	public String playsquadListAction() {
		System.out.println("List Action In Process..");
		
		return "play/mainpage";
	};
	
	// 스쿼드 모집글 작성전 로딩
	@RequestMapping(value = "newsquadLoadingAction")
	public String newsquadLoadingAction(Model model) {
		model.addAttribute("games", dao.popularGameListSelect());
		return "play/new_squad";
	}
	
	
	// 스쿼드 모집 글 작성
	// 세션에서 아이디 읽어오기, 해시태그 받아서 db에 넣는 기능 미구현
	@PostMapping(value = "squadBoardInsert")
	public String squadBoardInsert(squadboardBean bean,
			@RequestParam(value = "reservedate_input") String reservedate_input
	 , @RequestParam(value = "userId", required=false)String writerId
	 , @RequestParam(value = "filename", required=false, defaultValue = "defaultImg.jpg")String filename
	 , @RequestParam(value = "thumbnail_file", required=false)MultipartFile file) {
		System.out.println("Board Insert In Process..");
		// 테스트용 작성자 아이디 blue로 임시 설정. 로그인부터 연결시 parameter에서 가져와야 함.
		// 구현시 아래 코드 수정해야
		//String writerId = "blue";
		System.out.println(writerId);
		
		// squadboard_no
		bean.setSquadboard_no(dao.getSquadBoardSequence());
		// gamegenre_no - view에서 가져옴

		// members_no - db에서 작성자 아이디로 가져온다
		// bean.setMembers_no(dao.getUserNo(writerId));
		bean.setMembers_id(writerId);
		// hostname - db에서 작성자 아이디로 가져온다
		bean.setHostname(dao.getUserName(writerId));

		// user_acceptcnt - 신규 모집글 작성이므로 insert시 무조건 0
		bean.setUser_acceptcnt(0);

		// user_maxcnt - view에서 가져옴
		// recruitoption - view에서 가져옴
		// playtime - view에서 가져옴
		// regdate - mapper에서 sysdate로

		// reservedate - view에서 가져오지만 형변환 필요. parsing 후 insert
		System.out.println(reservedate_input);
		String newReservedate = reservedate_input.replace("T", " ");
		System.out.println(reservedate_input + newReservedate);
		LocalDateTime reservedate = LocalDateTime.parse(newReservedate,
				DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
		System.out.println(reservedate);
		bean.setReservedate(reservedate);

		// squadstate - insert시 무조건 0(모집중)
		bean.setSquadstate(0);

		// price - view에서 가져옴
		// payedstate - view에서 가져옴
		// filename
		String uploadLoc = "C:\\project\\com.bit.web.play\\src\\main\\webapp\\resources\\img\\play\\upload\\";
		FileOutputStream fos = null;
		String originFileName = file.getOriginalFilename();
		if(originFileName.length() > 0) {
			try {
			fos = new FileOutputStream(uploadLoc + originFileName);
			fos.write(file.getBytes());
			bean.setFilename(originFileName);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}else if(originFileName.isEmpty() && filename.length() > 0){
			bean.setFilename(filename); 
		}else {
			return "redirect:play/insertFailed.jsp";
		}
		
		// tags 미구현. 임시로 기본태그 설정
		bean.setTags("defaultHashtag");

		// db에 넣기 전 콘솔에 뿌려서 체크
		System.out.println(bean);
		// insert
		dao.insertSquadBoard(bean);
		System.out.println("Board Insert Success!");
		return "redirect:play/insertSuccess.jsp";
	}
		
	// 모집중인 스쿼드
	@GetMapping(value = "squadstate0ListAction")
	@ResponseBody
	public List<squadboardBean> mainPageListAction(Model model) {
		//model.addAttribute("mojib", dao.squadstate0Select());
		//System.out.println(model);
		System.out.println(dao.squadstate0Select());
		return  dao.squadstate0Select();
	};
	
	// 인기게임
	@GetMapping(value = "popularGameListAction")
	@ResponseBody
	public List<gamegenreBean> popularGameListAction(){
		System.out.println(dao.popularGameListSelect());
		return dao.popularGameListSelect();
	};
	
	// 인기스쿼드 호스트 팔로워순
	@GetMapping(value = "squadPopularSelectAction")
	@ResponseBody
	public List<squadboardBean> squadPopularSelectAction(){
		return dao.squadPopularSelect();
	};
	


	//회원가입
	
	@RequestMapping(value = "newMember")

	public String newAjaxCrudReplyAction(membersBean bean) {
	
		log.debug("회원가입 {}", bean);

		playService.insertSeqNumber(bean); 
		return "redirect:/play/login.jsp";
	};
	
	//회원가입 - 아이디 중복체크
	@PostMapping(value = "ajaxFindID")
	@ResponseBody
	public String findId(@RequestParam(value = "id",required = false,defaultValue = "BLUE")String id) {	 
		   System.out.println(dao);
		//return "Test";
		return dao.ajaxGetId(id)!=null?String.valueOf(true):String.valueOf(false);
	}
	//회원가입 - 별명 중복 체크
	@PostMapping(value = "ajaxFindNickname")
	@ResponseBody
	public String findNickname(@RequestParam(value = "Nickname",required = false,defaultValue = "BLUE")String ninckname) {	 
		   System.out.println(dao);
		//return "Test";
		return dao.ajaxGetNickname(ninckname)!=null?String.valueOf(true):String.valueOf(false);
	}

	    

	    
	    //프로필 
	    // 프로필 가져오기
	    @RequestMapping(value = "/play/viewProfile", method = RequestMethod.GET)
	    public String getView(membersBean bean, String id ,Model model) throws Exception {
	    	
	    	membersBean vo = playService.getViewProfile(id);
	    	
	    	model.addAttribute("view", vo);
	    	
//	    	bean.setMembers_id(id);
	    	
	    	System.out.println(vo);
	    	return "play/profile";
	    }
	    //프로필 수정
//	    @RequestMapping(value = "/play/updateProfile", method = RequestMethod.POST)
//	    public String postView(membersBean bean)  {
//	    	
//	    	playService.postViewProfile(bean);
//	    	 
//	    	System.out.println(bean);
//	    	return "play/mypage";
//	    }
	    
		@RequestMapping(value = "/play/updateProfile", method = RequestMethod.POST )
		public String updateProfile(membersBean bean,
				@RequestParam(value = "profileimg", required = false, defaultValue = "profileimg") MultipartFile file) {
	       
			String loc = "C:\\Users\\BIT\\git\\bitProject\\sample\\src\\main\\webapp\\resources\\img\\play\\upload\\";
			
			FileOutputStream fos = null;
			String orginFile = file.getOriginalFilename();
			if (orginFile.length() > 0) {
				try {
					fos = new FileOutputStream(loc + orginFile);
					fos.write(file.getBytes());
					bean.setProfile_img(orginFile);
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}

			}
			playService.postViewProfile(bean);
	    	 
	    	System.out.println(bean);
	    	return "play/mypage";
			
			}

	
	    
	    
	    

		//스쿼드 게시판
		//스쿼드 게시판 - 매핑
		@RequestMapping(value="squadBoardInfoSelect", method = RequestMethod.GET)
		public String squadboardInfoSelectProcess(HttpServletRequest request,Model model, 
				squadboardBean squadboard, hostreviewBean hostreview, int no, String hostId) {
			//System.out.println(hostId);
			HttpSession session = request.getSession();
			String userId = (String)session.getAttribute("userId");
			System.out.println(no);
			System.out.println(userId);
			HashMap<String, Object>map = new HashMap<String, Object>();
			map.put("squadboard_no", no);
			map.put("members_id", userId);
			// 스쿼드 게시판 상세 내용
			model.addAttribute("squad", dao.selectSquadBoardInfo(no));
			// 호스트기준 스쿼드 정보
			model.addAttribute("squadList", dao.selectSquadBoardHost(hostId));
			// 호스트기준 호스트리뷰
			model.addAttribute("reviewList", dao.selectHostReviewHost(hostId));
			//참가나 신청 중인지 여부 확인
			if(userId != null) {
				model.addAttribute("attendSH", dao.selectIdSquadHistory(map));
				model.addAttribute("attendAW", dao.selectIdAcceptWaitting(map));
				
			}
			
			
			return "play/squadboard";
		}
		
		//스쿼드 게시판 - 참가 2차확인 창
		@RequestMapping("squadRequsetSelect")
		public String squadRequsetSelectProcess(Model model, int no) {
			model.addAttribute("squad", dao.selectSquadBoardInfo(no));			
			return "play/squad_request";
		}

		//스쿼드 게시판 - 참가 2차확인 확인버튼
		@RequestMapping("squadRequsetAccept")
		public String squadRequsetAcceptProcess(squadhistoryBean shBean,acceptwaittingBean awBean,
				@RequestParam(value = "squadboard_no", required = false)int squadboard_no,
				@RequestParam(value = "recruitoption", required = false)int recruitoption) {			
			if(recruitoption == 0) {
				shBean.setSquadhistory_no(dao.getSequence_SquadHistory());
				dao.insertSquadHistory(shBean);		
				System.out.println(squadboard_no);
				dao.updateSB_acceptcnt_increase(squadboard_no);
			} else if(recruitoption == 1){
				awBean.setAcceptwaitting_no(dao.getSequence_AcceptWaitting());
				dao.insertAcceptWaitting(awBean); 
			}
			return "play/squad_request_success";
		}


		//공지사항
		@RequestMapping(value="NoticeBoardInsert", method = RequestMethod.POST)
		public String NoticeBoardInsert(NoticeBoardBean bean, Model model, @RequestParam String writer_id) {
			bean.setNoticeboard_no(dao.getSequence2());
			//bean.setWriter_id(writer_id);
			System.out.println(bean);
			dao.insertNoticeBoard(bean);
			return "play/noticeboard";
			
		}
		
		@RequestMapping(value="selectNoticeBoard", method=RequestMethod.GET)
			public String selectNoticeBoard(Model model) {
			model.addAttribute("notice", dao.selectNoticeBoard());
			System.out.println(model);
			return "play/noticeboard";
		}		
		
		//검색
		
		@RequestMapping(value="/play/listPageSearch")
		public String selectBoardList(ModelMap model, HttpServletRequest request) {
			//검색 맵 생성
			HashMap<String, Object>map  = new HashMap<String, Object>();
			map.put("query", request.getParameter("query"));
			map.put("data", request.getParameter("data"));
//			//페이징 맵 생성
//			PageBean pageBean = pageAction.paging(request, map);
//			map.put("start",  pageBean.getStart());
//			map.put("end",  pageBean.getEnd());
			//모델 생성
//			model.addAttribute("pageBean", pageBean);
			model.addAttribute("list", playService.selectBoardList(map));
			//System.out.println(playService.selectBoardList(map));
			System.out.println(map);
			return "play/search";
		}

		//게스트 후기 insert
		@RequestMapping(value="GuestReviewInsert", method = RequestMethod.POST)
		public String GuestReviewInsert(GuestReviewBean bean, Model model, @RequestParam String writer_id) {
			bean.setHostreview_no(dao.getGuestReviewSequence()); // hostreview_no
			System.out.println(bean); //콘솔에 뿌림
			dao.insertGuestReview(bean); //insert
			return "play/mypage";

		}

		//게스트 후기 select
		@RequestMapping(value="GuestReviewSelect", method=RequestMethod.GET)
		public String GuestReviewSelect(Model model, String id) {
			model.addAttribute("review", dao.selectGuestReview1(id));
			//model.addAttribute("reviewList", dao.selectGuestReview1(writer_id));
			System.out.println(model);
			return "play/mypage";
		}
		
}