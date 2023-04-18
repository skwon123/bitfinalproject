package com.bit.web.play.controller;

import com.bit.web.play.action.PagingAction;
import com.bit.web.play.email.MailUtil;
import com.bit.web.play.service.PlayService;
import com.bit.web.play.vo.hostreviewBean;
import com.bit.web.play.vo.membersBean;
import com.bit.web.play.vo.pageBean;
import com.bit.web.play.vo.squadboardBean;
import com.bit.web.play.vo.squadhistoryBean;
import com.bit.web.play.vo.gamegenreBean;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.bit.web.play.vo.GuestReviewBean;
import com.bit.web.play.vo.NoticeBoardBean;
import com.bit.web.play.vo.acceptwaittingBean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.FileOutputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller

@RequiredArgsConstructor
@Slf4j
public class playController {

	@Autowired   
	private PagingAction pageAction;  
	private final PlayService playService;

	/* 
	 * �α��� ������ > �α��� > ���̵�ã�� 
	 */
	@RequestMapping(value = "idSearch", method = RequestMethod.GET)
	@ResponseBody
	public String sendId(@RequestParam(value ="email", required = false)String email) {
		String checkedId = playService.find_user_id(email);
		MailUtil.naverMailSend(email, "PlaySquad ID�Դϴ�.", checkedId);
		return "success";
	};
	/*
	 * �α��� ������ > �α��� > ��й�ȣ ã��
	 */
	@RequestMapping(value="pwSearch", method=RequestMethod.GET)
	@ResponseBody
	public String pwSearch(@RequestParam(value="user_id", required = false)String userId, @RequestParam(value="pw_find_email", required=false)String pw_find_email) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("pw_find_email", pw_find_email);
		return playService.find_user_pw(map);
	};
	/*
	 * �α��� üũ
	 */
	@RequestMapping(value = "playsquadLoginCheck", method = RequestMethod.POST)
	@ResponseBody
	public String loginCheck(@RequestParam(value = "id", required = false)String inputId, @RequestParam(value = "password", required = false)String inputPassword,
			HttpServletRequest req) {

		String loginPass = playService.loginPass(inputId);
		String authority = playService.selectAuthority(inputId);
		System.out.println(inputId);
		System.out.println(inputPassword);
		System.out.println(loginPass);
		if(loginPass.equals(inputPassword)) {
			req.getSession().setAttribute("userId", inputId);
			req.getSession().setAttribute("userAuthority", authority);
			System.out.println(playService.selectAuthority(inputId));
			req.getSession().setMaxInactiveInterval(60*60*24);
			return "success";
		}else { 
			return "failed";
		}
	};
	/*
	 * �α׾ƿ�
	 */
	@RequestMapping(value = "logoutAction")
	@ResponseBody
	public String logoutAction(HttpServletRequest req) {
		System.out.println("User Logout");
		req.getSession().invalidate();
		System.out.println("Session Deleted");
		return "Logout Success";
	};
	/*
	 * �α��ν� mainpage��
	 */
	@RequestMapping(value = "playsquadListAction", method = RequestMethod.POST)
	public String playsquadListAction() {
		System.out.println("List Action In Process..");

		return "play/mainpage";
	};
	/*
	 * ������ ������ �ۼ��� �ε�
	 */
	@RequestMapping(value = "newsquadLoadingAction")
	public String newsquadLoadingAction(Model model) {
		model.addAttribute("games", playService.popularGameListSelect());
		return "play/new_squad";
	}
	/*
	 * ������ ������ �ۼ��� �ε�, ���ǿ��� ���̵� �о����, �ؽ��±� �޾Ƽ� db�� �ִ� ��� �̱���
	 */
	@PostMapping(value = "squadBoardInsert")
	public String squadBoardInsert(squadboardBean bean,
			@RequestParam(value = "reservedate_input") String reservedate_input
			, @RequestParam(value = "userId", required=false)String writerId
			, @RequestParam(value = "filename", required=false, defaultValue = "defaultImg.jpg")String filename
			, @RequestParam(value = "thumbnail_file", required=false)MultipartFile file) {
		System.out.println("Board Insert In Process..");
		// �׽�Ʈ�� �ۼ��� ���̵� blue�� �ӽ� ����. �α��κ��� ����� parameter���� �����;� ��.
		// ������ �Ʒ� �ڵ� �����ؾ�
		//String writerId = "blue";
		System.out.println(writerId);
		// squadboard_no
		bean.setSquadboard_no(playService.getSquadBoardSequence());
		// gamegenre_no - view���� ������
		// members_no - db���� �ۼ��� ���̵�� �����´�
		// bean.setMembers_no(playService.getUserNo(writerId));
		bean.setMembers_id(writerId);
		// hostname - db���� �ۼ��� ���̵�� �����´�
		bean.setHostname(playService.getUserName(writerId));
		// user_acceptcnt - �ű� ������ �ۼ��̹Ƿ� insert�� ������ 0
		bean.setUser_acceptcnt(0);
		// user_maxcnt - view���� ������
		// recruitoption - view���� ������
		// playtime - view���� ������
		// regdate - mapper���� sysdate��
		// reservedate - view���� ���������� ����ȯ �ʿ�. parsing �� insert
		System.out.println(reservedate_input);
		String newReservedate = reservedate_input.replace("T", " ");
		System.out.println(reservedate_input + newReservedate);
		LocalDateTime reservedate = LocalDateTime.parse(newReservedate,
				DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
		System.out.println(reservedate);
		bean.setReservedate(reservedate);
		// squadstate - insert�� ������ 0(������)
		bean.setSquadstate(0);
		// price - view���� ������
		// payedstate - view���� ������
		// filename
		String uploadLoc = "C://Users//BIT//git//bitfinalproject//playsquad//src//main//webapp//resources//img//play//upload//board//";
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

		// tags �̱���. �ӽ÷� �⺻�±� ����
		bean.setTags("defaultHashtag");

		// db�� �ֱ� �� �ֿܼ� �ѷ��� üũ
		System.out.println(bean);
		// insert
		playService.insertSquadBoard(bean);
		System.out.println("Board Insert Success!");
		return "redirect:play/insertSuccess.jsp";
	}
	/*
	 * �������� ������
	 */		
	@GetMapping(value = "squadstate0ListAction")
	@ResponseBody
	public List<squadboardBean> mainPageListAction(Model model) {
		//model.addAttribute("mojib", playService.squadstate0Select());
		//System.out.println(model);
		System.out.println(playService.squadstate0Select());
		return  playService.squadstate0Select();
	};
	/*
	 * �α����
	 */	
	@GetMapping(value = "popularGameListAction")
	@ResponseBody
	public List<gamegenreBean> popularGameListAction(){
		System.out.println(playService.popularGameListSelect());
		return playService.popularGameListSelect();
	};
	/*
	 * �α⽺���� ȣ��Ʈ �ȷο���
	 */	
	@GetMapping(value = "squadPopularSelectAction")
	@ResponseBody
	public List<squadboardBean> squadPopularSelectAction(){
		return playService.squadPopularSelect();
	};
	/*
	 * ȸ������
	 */	
	@RequestMapping(value = "newMember")
	public String newAjaxCrudReplyAction(membersBean bean) {
		log.debug("ȸ������ {}", bean);
		playService.insertSeqNumber(bean); 
		return "redirect:/play/login.jsp";
	};
	/*
	 * ȸ������ - ���̵� �ߺ�üũ
	 */	
	@PostMapping(value = "ajaxFindID")
	@ResponseBody
	public String findId(@RequestParam(value = "id",required = false,defaultValue = "BLUE")String id) {	 
		System.out.println(playService);
		//return "Test";
		return playService.ajaxGetId(id)!=null?String.valueOf(true):String.valueOf(false);
	}
	/*
	 * ȸ������ - ���� �ߺ� üũ
	 */	
	@PostMapping(value = "ajaxFindNickname")
	@ResponseBody
	public String findNickname(@RequestParam(value = "Nickname",required = false,defaultValue = "BLUE")String ninckname) {	 
		System.out.println(playService);
		//return "Test";
		return playService.ajaxGetNickname(ninckname)!=null?String.valueOf(true):String.valueOf(false);
	}    
	/*
	 * ������ - ��������
	 */	
	@RequestMapping(value = "/play/viewProfile", method = RequestMethod.GET)
	public String getView(membersBean bean, String id ,Model model) throws Exception {
		membersBean vo = playService.getViewProfile(id);
		model.addAttribute("view", vo);
		//	    	bean.setMembers_id(id);
		System.out.println(vo);
		return "play/profile";
	}
	/*
	 * ������ ����
	 * 
	 * @RequestMapping(value = "/play/updateProfile", method = RequestMethod.POST)
	 * public String postView(membersBean bean) {
	 * 
	 * playService.postViewProfile(bean);
	 * 
	 * System.out.println(bean); return "play/mypage"; }
	 */
	/*
	 * ������ - ����
	 */	
	@RequestMapping(value = "updateProfile", method = {RequestMethod.POST, RequestMethod.GET})
	public String updateProfile(membersBean bean,
			@RequestParam(value = "profileimg", required = false, defaultValue = "profileimg") MultipartFile file, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String userId = (String)session.getAttribute("userId");
		String loc = "C://Users//BIT//git//bitfinalproject//playsquad//src//main//webapp//resources//img//play//upload//profile//";
		FileOutputStream fos = null;
		String orginFile = file.getOriginalFilename();
		System.out.println(orginFile);
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
		System.out.println(orginFile);
		System.out.println(bean);
		return "redirect:/GuestReviewSelect?id="+userId;

	}
	/*
	 * ������ �Խ��� - ����
	 */		
	@RequestMapping(value="squadBoardInfoSelect", method = RequestMethod.GET)
	public String squadboardInfoSelectProcess(HttpServletRequest request,Model model, int no, String hostId) {

		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		//System.out.println(no);
		//System.out.println(hostId);
		//System.out.println(userId);
		HashMap<String, Object>map1 = new HashMap<String, Object>();
		map1.put("members_id", hostId);
		map1.put("squadboard_no", no);
		HashMap<String, Object>map2 = new HashMap<String, Object>();
		map2.put("squadboard_no", no);
		map2.put("members_id", userId);
		// ������ �Խ��� �� ����
		model.addAttribute("squad", playService.selectSquadBoardInfo(no));
		model.addAttribute("squadCnt", playService.selectSquadCnt(hostId));
		// ȣ��Ʈ���� ������ ����
		model.addAttribute("squadList", playService.selectSquadBoardHost(map1));
		// ȣ��Ʈ���� ȣ��Ʈ����
		model.addAttribute("reviewList", playService.selectHostReviewHost(hostId));
		//������ ��û ������ ���� Ȯ��
		if(userId != null) {
			model.addAttribute("attendSH", playService.selectIdSquadHistory(map2));
			model.addAttribute("attendAW", playService.selectIdAcceptWaitting(map2));				
		}
		return "play/squadboard";
	}
	/*
	 * ������ �Խ��� - ���� 2��Ȯ�� â
	 */	
	@RequestMapping("squadRequsetSelect")
	public String squadRequsetSelectProcess(Model model, int no) {
		model.addAttribute("squad", playService.selectSquadBoardInfo(no));			
		return "play/squad_request";
	}
	/*
	 * ������ �Խ��� - ���� 2��Ȯ�� Ȯ�ι�ư
	 */	
	@RequestMapping("squadRequsetAccept")
	public String squadRequsetAcceptProcess(squadhistoryBean shBean,acceptwaittingBean awBean,
			@RequestParam(value = "squadboard_no", required = false)int squadboard_no,
			@RequestParam(value = "recruitoption", required = false)int recruitoption,
			@RequestParam(value = "userAcceptcnt", required = false)int userAcceptcnt,
			@RequestParam(value = "userMaxcnt", required = false)int userMaxcnt) {
		HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("squadboard_no", squadboard_no);
		map.put("squadstate", 1);
		if(userAcceptcnt < userMaxcnt) {
			if(recruitoption == 0) {
				shBean.setSquadhistory_no(playService.getSequence_SquadHistory());
				playService.insertSquadHistory(shBean);		
				System.out.println(squadboard_no);
				playService.updateSB_acceptcnt_increase(squadboard_no);
				String result = playService.selelctCompareUserCnt(squadboard_no);
				if(result.equals("fullYes")) {
					playService.updateSquadState(map);
				}
				return "play/squad_request_success";
			} else if(recruitoption == 1){
				awBean.setAcceptwaitting_no(playService.getSequence_AcceptWaitting());
				playService.insertAcceptWaitting(awBean);
				return "play/squad_request_success";
			}
		}
		return "play/squad_request_fail";
	}
	/*
	 * ������ �Խ��� - AJAX
	 */		
	@GetMapping(value="squadBoardAjaxSelect")
	@ResponseBody
	public String squadBoardAjaxSelectProcess(String newSquadboardNo) {
		//Integer new_no = Integer.parseInt(no);
		System.out.println(newSquadboardNo);
		System.out.println(playService.selectReserveDate(Integer.parseInt(newSquadboardNo)));

		return playService.selectReserveDate(Integer.parseInt(newSquadboardNo));
	}
	/*
	 * ������ �Խ��� - ���� ����(������)
	 */	
	@RequestMapping(value="SquadStateUpdate")
	public String SquadStateUpdateProcess(int no, String hostId) {
		HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("squadboard_no", no);
		map.put("squadstate", 2);
		playService.updateSquadState(map);
		playService.deleteAcceptWaittingSB(no);
		return "redirect:/squadBoardInfoSelect?no="+no+"&hostId="+hostId;
	}

	/*
	 *  �� ������ ������ - ����
	 */
	@RequestMapping(value="mysquadInfoSelect")
	public String mysquadInfoSelectProcess(Model model, String hostId) {
		//�Խ�Ʈ ���� ���� �� ������ �˻�
		model.addAttribute("GSquadList", playService.selectParticipationSquad(hostId));
		//�Խ�Ʈ ���� ���� ��� 
		model.addAttribute("GHistoryList", playService.selectGuestHistory(hostId));
		//ȣ��Ʈ ���� ���� �� ������ �˻�
		model.addAttribute("HSquadList", playService.selectHostingSquad(hostId));
		//ȣ��Ʈ ���� ȣ���� ���
		model.addAttribute("HHistoryList", playService.selectHostingHistory(hostId));

		return "play/mysquad";
	}

	/*
	 *  �� ������ ������ > ���� ���
	 */
	@RequestMapping("squadDeleteOrCancel")
	public String squadDeleteProcess(HttpServletRequest request,@RequestParam("no") int no, String job, int rc, String work) {
		System.out.println(no);
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");

		HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("squadboard_no", no);

		if(job.equals("host")) {			
			if(work.equals("delete")) {
				System.out.println("delete");
				System.out.println("no :" + no);
				map.put("squadstate", 4);
				playService.deleteAcceptWaittingSB(no);
				playService.deleteSquadHistorySB(no);
				playService.updateSquadState(map);
			}else if(work.equals("end")) { 
				System.out.println("end");
				map.put("squadstate", 3);
				playService.deleteAcceptWaittingSB(no);
				playService.updateSquadState(map);
			}

		} else if(job.equals("guest")) {
			map.put("members_id", userId);
			if(rc == 0) {
				playService.deleteSquadHistoryGuest(map);
				playService.updateSB_acceptcnt_decrease(no);
				String result = playService.selelctCompareUserCnt(no);
				if(result.equals("fullNo")) {
					HashMap<String, Object>map2 = new HashMap<String, Object>();
					map2.put("squadboard_no", no);
					map2.put("squadstate", 0);
					playService.updateSquadState(map2);
				}

			}else if(rc == 1) {
				playService.deleteAcceptWaittingGuest(map);
			}
		}
		return "play/squadDeleteSuccess";
	}

	/*
	 * ȣ��Ʈ ���������� > ����
	 */
	@RequestMapping("squadHostingSelect")
	public String squadHostingSelectProcess(Model model, int no) {
		model.addAttribute("squadhistory", playService.selectSquadHistoryNo(no));
		model.addAttribute("acceptwaitting", playService.selectAcceptWaittingNo(no));
		return "play/squadHosting";
	}
	/*
	 * ȣ��Ʈ ���������� > ��ư 
	 */
	@RequestMapping("squadHostingButtonAC")
	public String squadHostingButtonProcess(squadhistoryBean shBean, int no, String acId, String ac) {
		HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("squadboard_no", no);
		map.put("members_id", acId);

		shBean.setSquadhistory_no(playService.getSequence_SquadHistory());
		shBean.setSquadboard_no(no);
		shBean.setMembers_id(acId);
		System.out.println(shBean);
		if(ac.equals("yes")) {
			String result = playService.selelctCompareUserCnt(no);
			playService.deleteAcceptWaittingGuest(map);
			shBean.setSquadhistory_no(playService.getSequence_SquadHistory());
			playService.insertSquadHistory(shBean);		
			playService.updateSB_acceptcnt_increase(no);
			if(result.equals("fullYes")) {
				HashMap<String, Object>map2 = new HashMap<String, Object>();
				map2.put("squadboard_no", no);
				map2.put("squadstate", 1);
				playService.updateSquadState(map2);
				System.out.println("fullYes");
			}

		}else if(ac.equals("no")){
			playService.deleteAcceptWaittingGuest(map);
		}

		return "redirect:/squadHostingSelect?no="+no;
	}

	@RequestMapping("squadHostingButtonSH")
	public String squadHostingButtonProcess(int no, String acId) {
		HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("squadboard_no", no);
		map.put("members_id", acId);
		playService.deleteSquadHistoryGuest(map);
		playService.updateSB_acceptcnt_decrease(no);

		return "redirect:/squadHostingSelect?no="+no;
	}

	/*
	 * ��������
	 */	
	@RequestMapping(value="NoticeBoardInsert", method = RequestMethod.POST)
	public String NoticeBoardInsert(NoticeBoardBean bean, @RequestParam String writer_id) {
		bean.setNoticeboard_no(playService.getSequence2());
		bean.setWriter_id(writer_id);
		System.out.println(bean);
		playService.insertNoticeBoard(bean);
				
		return "play/noticeboard";

	}

	@RequestMapping(value="selectNoticeBoard", method=RequestMethod.GET)
	public String selectNoticeBoard(Model model) {
		model.addAttribute("notice", playService.selectNoticeBoard());
		System.out.println(model);
		return "play/noticeboard";
	}		
	/*
	 * �˻�
	 */		
	@RequestMapping(value="/play/listPageSearch")
	public String selectBoardList(ModelMap model, HttpServletRequest request) {
		//�˻� �� ����
		HashMap<String, Object>map  = new HashMap<String, Object>();
		map.put("query", request.getParameter("query"));
		map.put("data", request.getParameter("data"));
		//����¡ �� ����
		pageBean pageBean = pageAction.paging(request, map);
		map.put("start",  pageBean.getStart());
		map.put("end",  pageBean.getEnd());
		//�� ����
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("list", playService.selectBoardList(map));
		//System.out.println(playService.selectBoardList(map));
		System.out.println(map);
		return "play/search";
	}

	/*
	 * �Խ�Ʈ �ı� insert
	 */	

	/*@GetMapping(value="ReviewInfo")
	public String ReviewInfo(GuestReviewBean bean, String host_id, Model model) {

	}*/

	@RequestMapping(value="GuestReviewInsert")
	public String GuestReviewInsert(GuestReviewBean bean,
			HttpServletRequest req) {
		String userId = (String) req.getSession().getAttribute("userId");
		System.out.println("Review Insert in process"); // ���� ���
		System.out.println(userId); // ���� ���
		bean.setHostreview_no(playService.getGuestReviewSequence()); // hostreview_no, ���� ���
		bean.setWriter_id(userId); //writer_id �ֿܼ� ������ �� Ȯ��
		bean.setName(playService.getNicknameById(userId));
		bean.setScore(Integer.parseInt(req.getParameter("score")));
		bean.setGood_cnt(0);
		bean.setRef(0);
		bean.setPnum(0);
		bean.setLev(0);
		bean.setStep(0);
		
		// �ֿܼ� �ѷ��� Ȯ��
		System.out.println(bean); 
		// insert
		playService.insertGuestReview(bean); 
		System.out.println("Review Insert Success!");
		//return "play/mypage";
		return "redirect:play/reviewInsertSuccess.jsp";

	}
	/*
	 * �Խ�Ʈ �ı� select
	 */	
	@RequestMapping(value="GuestReviewSelect", method=RequestMethod.GET)
	public String GuestReviewSelect(Model model, String id) {
		model.addAttribute("review", playService.selectGuestReview1(id));
		model.addAttribute("info", playService.selectMyInfo(id));
		//model.addAttribute("reviewList", playService.selectGuestReview1(writer_id));
		System.out.println(model);
		return "play/mypage";
	}

	@RequestMapping(value="insertMyInfo", method = RequestMethod.POST)
	public String insertMyInfo(membersBean bean, Model model, @RequestParam String members_id) {
		bean.setMembers_id(members_id);
		System.out.println(bean); //�ֿܼ� �Ѹ�
		playService.insertMyInfo(bean); //insert
		return "play/mypage";
	}
	/*
	 * ���������� - ���� ����
	 */		
	@RequestMapping(value="selectMyInfo", method=RequestMethod.GET)
	public String selectMyInfo(Model model, String id) {
		model.addAttribute("info", playService.selectMyInfo(id));
		System.out.println(model);
		return "play/mypage";
	}

	/* 
	 * �α���� ���Ӻ� ������ ����Ʈ
	 */
	@RequestMapping(value="popularGameInfoSelect")
	public String popularGameInfoSelectPro(Model model, int ggno) {
		model.addAttribute("list", playService.squadListForEachGameSelect(ggno));
		model.addAttribute("info", playService.popularGameInfoSelect(ggno));
		playService.squadCntUpdate();
		return "play/popular_game";
	}
	/* 
	 * �α���� ���Ӻ� �α� ȣ��Ʈ ����Ʈ
	 */
	@RequestMapping(value="hostListForEachGameSelect", method=RequestMethod.GET)
	@ResponseBody
	public List<membersBean> hostListForEachGameSelectPro(int ggno){
		return playService.hostListForEachGameSelect(ggno);
	}
	
	/* 
	 * ��û ������ ������ (����������)
	 */
	@GetMapping(value = "registerSquadInfoSelect")
	@ResponseBody
	public List<squadboardBean> registerSquadInfoSelect(String userId) {
		System.out.println(playService.registerSquadInfoSelect(userId));
		return playService.registerSquadInfoSelect(userId);
	};
	
	
	/* 
	 * �ַ� �ϴ� ���� (����������)
	 */
	@GetMapping(value = "mainGamePlay")
	@ResponseBody
	public List<gamegenreBean> mainGamePlay(String userId) {
		System.out.println(playService.mainGamePlay(userId));
		return playService.mainGamePlay(userId);
	};
	
	/* 
	 * �ȷο� ��� (����������)
	 */
	@RequestMapping(value="follow", method=RequestMethod.POST)
	@ResponseBody
	public int follow(Model model, HttpSession session, HttpServletRequest req, @RequestParam("host_id") String host_id) {
	    int followermembers_no = playService.followTableSequence();
	    String my_id = (String) req.getSession().getAttribute("userId");
	    List<Map<String, Object>> followList = playService.followCheck(my_id);
	    List<String> followingList = new ArrayList<String>();
	    for (Map<String, Object> map : followList) {
	        String following_id = ((String) map.get("FOLLOWINGMEMBERS_ID")).replaceAll("followingmembers_id=", "");
	        followingList.add(following_id);
	    }
	    HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("followermembers_no", followermembers_no);
		map.put("my_id", my_id);
		map.put("host_id", host_id);
		System.out.println(followList);
	    if(followingList.contains(host_id)==true) {
	    	playService.followDelete(map);
	    	playService.followCntDown(host_id);
	    	return playService.selectFollowCnt(host_id);
	    }else if(followingList.contains(host_id)==false) {
	    	playService.followTableInsert(map);
	    	playService.followCntUpdate(host_id);
	    	return playService.selectFollowCnt(host_id);
	    }
	    else {
	    	System.out.println("error");
	    	return playService.selectFollowCnt(host_id);
	    }

	}
	@RequestMapping(value="followBtnAction")
	@ResponseBody
	public int followBtnActionProcess(@RequestParam("host_id") String host_id, HttpServletRequest req){
		String my_id = (String) req.getSession().getAttribute("userId");
		List<Map<String, Object>> followList = playService.followCheck(my_id);
		List<String> followingList = new ArrayList<String>();
		System.out.println(my_id+host_id);
	    for (Map<String, Object> map : followList) {
	        String following_id = ((String) map.get("FOLLOWINGMEMBERS_ID")).replaceAll("followingmembers_id=", "");
	        followingList.add(following_id);
	    }
	    if(host_id.equals(my_id)) {
	    	return 3;
	    }else {
	    	if(followingList.contains(host_id)==true) {
	    		return 1;
	    	}else if(followingList.contains(host_id)==false) {
	    		return 2;
	    	}
	    	else {
	    		System.out.println("error");
	    		return 4;
	    	}
	    }
	}
}