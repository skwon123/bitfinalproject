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
<!-- //		System.out.println(bean); //���� ������  -->
<!-- //		 -->
<!-- //		dao.insertSeqNumber(bean); -->
<!-- //		 -->
<!-- //		return "redirect:/play/login.jsp"; -->
<!-- //		} -->
<!-- //	} -->

<!-- //	//������ ���� -->
<!-- //	@RequestMapping(value = "updateData") -->
<!-- //	 -->
<!-- //	public String updateDataAction(membersBean bean, HttpServletRequest req) { -->
<!-- //		String user_id = req.getSession().getId(); //�α��ε� ���� id�� ������ -->
<!-- //		bean.setId(user_id); -->
<!-- //		bean.setMembers_no(dao.updateGetSequence()); -->
<!-- //	 -->
<!-- //	} -->
<!-- //	 -->
<!-- //} -->
	
<!-- //	//�α��� ���� ó�� -->
<!-- //	@PostMapping("login") -->
<!-- //	public String login(membersBean bean, HttpSession session) throws Exception { -->
<!-- //		membersBean loginUser = (bean); -->
<!-- //		 -->
<!-- //		if(loginUser != null) { -->
<!-- //			//success -> session�� ��� -> home���� -->
<!-- //			session.setAttribute("loginUser", loginUser); -->
<!-- //			return "redirect:/"; -->
<!-- //		}else { -->
<!-- //			//fail -> login -->
<!-- //			return "member/login"; -->
<!-- //		} -->
<!-- //	} -->
	
	
	
<!-- 	//������ ���� -->
<!-- //	@RequestMapping(value = "updateAjax") -->
<!-- // -->
<!-- //	public String updateDataAction(membersBean bean, HttpServletRequest req) { -->
<!-- //		req.getAttribute(id) -->
<!-- //		bean.setMembers_no(dao.updateGetSequence()); -->
<!-- // -->
<!-- //		 -->
<!-- //		System.out.println(bean); //���� ������  -->
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
<!-- //	System.out.println(bean); //���� ������  -->
<!-- //	 -->
<!-- //	dao.updateData(map); -->
<!-- //	} -->
<!-- //	return "redirect:/play/profile.jsp"; -->
<!-- //	 -->
<!-- //}	 -->
	
	
<!-- //	//�ߺ�üũ -->
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
    <label for="file1">����</label> 
    <input type="file" id="file1" name="file1"> 
    <button id="btn_submit" onclick="javascript:fn_submit()">����</button>    
</div>
 
<div>
       <div class="img_wrap">
           <img id="img" />
       </div>
</div>
 
<script type="text/javascript">
    //�̹��� �̸�����
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
                alert("Ȯ���ڴ� �̹��� Ȯ���ڸ� �����մϴ�.");
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
//���� ���ε�
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
               alert("�����Ͽ����ϴ�.");
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