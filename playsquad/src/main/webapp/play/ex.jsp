<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- //		 -->
<!-- //		 -->
<!-- //		 -->
<!-- //		bean.setMembers_no(dao.newAjaxGetSequence()); -->
<!-- //		System.out.println(bean); //값이 들어가는지  -->
<!-- //		 -->
<!-- //		dao.insertSeqNumber(bean); -->
<!-- //		 -->
<!-- //		return "redirect:/play/login.jsp"; -->
<!-- //		} -->
<!-- //	} -->

<!-- //	//프로필 수정 -->
<!-- //	@RequestMapping(value = "updateData") -->
<!-- //	 -->
<!-- //	public String updateDataAction(membersBean bean, HttpServletRequest req) { -->
<!-- //		String user_id = req.getSession().getId(); //로그인된 유저 id를 가져옴 -->
<!-- //		bean.setId(user_id); -->
<!-- //		bean.setMembers_no(dao.updateGetSequence()); -->
<!-- //	 -->
<!-- //	} -->
<!-- //	 -->
<!-- //} -->
	
<!-- //	//로그인 로직 처리 -->
<!-- //	@PostMapping("login") -->
<!-- //	public String login(membersBean bean, HttpSession session) throws Exception { -->
<!-- //		membersBean loginUser = (bean); -->
<!-- //		 -->
<!-- //		if(loginUser != null) { -->
<!-- //			//success -> session에 담기 -> home으로 -->
<!-- //			session.setAttribute("loginUser", loginUser); -->
<!-- //			return "redirect:/"; -->
<!-- //		}else { -->
<!-- //			//fail -> login -->
<!-- //			return "member/login"; -->
<!-- //		} -->
<!-- //	} -->
	
	
	
<!-- 	//프로필 수정 -->
<!-- //	@RequestMapping(value = "updateAjax") -->
<!-- // -->
<!-- //	public String updateDataAction(membersBean bean, HttpServletRequest req) { -->
<!-- //		req.getAttribute(id) -->
<!-- //		bean.setMembers_no(dao.updateGetSequence()); -->
<!-- // -->
<!-- //		 -->
<!-- //		System.out.println(bean); //값이 들어가는지  -->
<!-- //		 -->
<!-- //		dao.updateData(map); -->
<!-- //		} -->
<!-- //		return "redirect:/play/profile.jsp"; -->
<!-- //		 -->
<!-- //	} -->
	
<!-- //	 -->

	
	
<!-- //	 -->
<!-- //}else{ -->
<!-- //	HashMap<String, Object>map=new HashMap<String, Object>(); -->
<!-- //	 -->
<!-- //	System.out.println(bean); //값이 들어가는지  -->
<!-- //	 -->
<!-- //	dao.updateData(map); -->
<!-- //	} -->
<!-- //	return "redirect:/play/profile.jsp"; -->
<!-- //	 -->
<!-- //}	 -->
	
	
<!-- //	//중복체크 -->
<!-- //	 -->
<!-- //	@Controller -->
<!-- //	public class UserController { -->
<!-- //	     -->
<!-- //	    @Autowired -->
<!-- //	    private playDao playDAO; -->
<!-- // -->
<!-- //	    @GetMapping("/checkId") -->
<!-- //	    @ResponseBody -->
<!-- //	    public boolean checkId(@RequestParam String id) { -->
<!-- //	        membersBean user = playDAO.getUserById(id); -->
<!-- //	        return user == null; -->
<!-- //	    } -->
<!-- //	} -->
<!-- //	 -->
	

	
	
	
	
<!-- //	@RequestMapping(value = "boardInsert2") -->
<!-- //	public String homeBoardInsert(ReplyBoard2 board, -->
<!-- //			@RequestParam(value = "file", required = false, defaultValue = "noImage.jpg") MultipartFile file) { -->
<!-- //        -->
<!-- //		String loc = "c:\\springbean2\\src\\main\\webapp\\resources\\upload\\"; -->
<!-- //		FileOutputStream fos = null; -->
<!-- //		String orginFile = file.getOriginalFilename(); -->
<!-- //		if (orginFile.length() > 0) { -->
<!-- //			try { -->
<!-- //				fos = new FileOutputStream(loc + orginFile); -->
<!-- //				fos.write(file.getBytes()); -->
<!-- //				board.setFilename(orginFile); -->
<!-- //			} catch (Exception e) { -->
<!-- //				// TODO: handle exception -->
<!-- //				e.printStackTrace(); -->
<!-- //			} -->
<!-- // -->
<!-- //		} -->
<!-- //		//System.out.println(dao.getSequence()); -->
<!-- //		board.setNo(dao.getSequence()); -->
<!-- //		if(board.getJob().equals("new")) { -->
<!-- //			board.setPnum(board.getNo()); -->
<!-- //			board.setRef(board.getNo()); -->
<!-- //		}else { -->
<!-- //			HashMap<String, Object>map=new HashMap<String, Object>(); -->
<!-- //			map.put("job", board.getJob()); -->
<!-- //			map.put("pnum", board.getPnum()); -->
<!-- //			map.put("ref", board.getRef()); -->
<!-- //			map.put("step", board.getStep()); -->
<!-- //			dao.updateReply(map); -->
<!-- //			dao.updateStep(map); -->
<!-- //			board.setStep(board.getStep()+1); -->
<!-- //			board.setLev(board.getLev()+1); -->
<!-- //		} -->
<!-- //		System.out.println(board); -->
<!-- //		//dao.insertBoard(board); -->
<!-- //		 -->
<!-- //		return "redirect:/board.jsp"; -->
<!-- //	} -->
<body>
 
<div>
    <label for="file1">파일</label> 
    <input type="file" id="file1" name="file1"> 
    <button id="btn_submit" onclick="javascript:fn_submit()">전송</button>    
</div>
 
<div>
       <div class="img_wrap">
           <img id="img" />
       </div>
</div>
 
<script type="text/javascript">
    //이미지 미리보기
    var sel_file;
 
    $(document).ready(function() {
        $("#file1").on("change", handleImgFileSelect);
    });
 
    function handleImgFileSelect(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
 
        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
 
        filesArr.forEach(function(f) {
            if (!f.type.match(reg)) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }
 
            sel_file = f;
 
            var reader = new FileReader();
            reader.onload = function(e) {
                $("#img").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }
</script>
    
<script>
//파일 업로드
function fn_submit(){
        
        var form = new FormData();
        form.append( "file1", $("#file1")[0].files[0] );
        
         jQuery.ajax({
             url : "/web/result"
           , type : "POST"
           , processData : false
           , contentType : false
           , data : form
           , success:function(response) {
               alert("성공하였습니다.");
               console.log(response);
           }
           ,error: function (jqXHR) 
           { 
               alert(jqXHR.responseText); 
           }
       });
}
</script>
</body>
</html>

</body>
</html>