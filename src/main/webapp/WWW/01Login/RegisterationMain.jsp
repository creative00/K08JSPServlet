<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">  
    
    <title>Registration</title>
    
    
    <script type="text/javascript">
    
	
	function openIdChk(){
		
		window.name = "parentForm";
		window.open("IdCheckForm.jsp",
				"chkForm", "width=500, height=300, resizable = no, scrollbars = no");	
	}

	// 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
	// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
	// 다시 중복체크를 하도록 한다.
	function inputIdChk(){
		document.myform.idDuplication.value ="idUncheck";
	}

    
    /* function checkValue () {
    	var form = document.myform;
    	
    	
    	if(!form.user_id.value){
			alert("아이디를 입력하세요.");
			return false;
		}
    	if(!form.idDuplication.value != "idCheck"){
			alert("아이디 중복체크를 해주세요.");
			return false;
		}
		
		if(form.user_pass.value == ""){
			alert("패스워드를 입력하세요.");
			return false;
		}
		if(form.user_pass.value != form.pass2.value){
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
		if(!form.name.value){
			alert("이름을 제대로 입력하세요.");
			return false;
		}
    } */
   
	function email_change(){
	
		if(document.myform.email.options[document.myform.email.selectedIndex].value == '0'){
		/* 아래 주석 처리 */
		//document.myform.email_domain.disabled = true;
		document.myform.email_domain.value = "";	
		}
		
		if(document.myform.email.options[document.myform.email.selectedIndex].value == '9'){
			/* 아래 주석 처리 */
		//document.myform.email_domain.disabled = false;
		document.myform.email_domain.value = "";
		document.myform.email_domain.focus();
		} 
		
		else{
			/* 아래 주석 처리 */
		//document.myform.email_domain.disabled = true;
		document.myform.email_domain.value = document.myform.email.options[document.myform.email.selectedIndex].value;
		}
	}
	</script>
    <style>
	
		
		* {	
			font-family: Verdana;
		    margin: 100;
		}
		#header {
			/*  background-color:lightgrey; */
			 height:170px;
			 width:1920px;
		}
		#nav {
			/*  background-color:#666666; */
			 height:150px;
			 float: center;
		}
		#section {
			width:250px;
			height:800px;
			text-align: left;
			float: left;
			background-color:red;
		}
		#footer {
			/* background-color: green; */
			clear:both;
		}
		#header,#nav, #footer, #section { text-align:center; }
		#section {line-height : 240px;}
		
		.join_blank {
			display: block;
		   /*  padding: 100px; */
		    width: 500px;
		    height: 600px;
		   	background-color:yellow;
		    text-align: left;
		} 
		
	</style>
</head>

<body>
	<div id="header">
		<%@ include file="../00Main/inc/top.jsp" %>
	</div>
	<!-- <div id="nav">
	</div> -->
</body>
<body>
	<!--연결할 파일 경로 지정. 예를 들어 "Join_Action.jsp" -->
	<form name="myform" action="Join_Action.jsp" method="POST" onsubmit="return formValidate();">
        <style>
        *{font-family: Verdana, Geneva, Tahoma, sans-serif;  margin: 0px auto;}
			;
	        form{  text-align: center; }
	        input, select {border: 1px solid #afafaf; border-color: #4cef7d; border-bottom: solid 1px rgba(0, 0, 0, 1);}
	        input.userInput{padding:3px 2px;}
	        select.userSelect{padding:2px 0;}
	        .c_imp{color: red;}
	        .userTable{border: none; border-collapse: collapse; width: 830px; }
	        .userTable td{padding:10px; border: 0px solid #b9babb;}
	        .userTable td.userTit{ background-color: #E4E6E9; display: block; /* border: 0px solid #b9babb; */  font-weight: bold;}
	        .btn_search{background-color: #3d3d3d; color: #4cef7d; width: 80px; height: 30px; padding:1px 0 2px;}
	        .btn_search:hover{background-color: #6d6d6d;}        
	        .btn_submit{width:120px;height:28px;font-weight:bold;cursor:pointer;background-color: #E70E16;color:white;font-size: 14px;}
	        .btn_cancel{border:none; width:120px;height:30px;font-weight:bold;cursor:pointer;background-color: #464646;color:white;font-size: 18px;}
	        .w20{width:20px;} .w30{width:30px;} .w40{width:40px;} .w50{width:50px;} .w100{width:100px;} 
	        .w300{width:300px;} .w510{width:510px;} .w410{width:410px;} 
	        #id_loading{position:absolute;top:530px;z-index:10;width:100%;text-align:center;display:block;}
        </style>
        <table class="userTable">
            <div id="selection">
            <!-- <div class="join_blank"></div>
           		 -->
           	<colgroup> 
                <col width="130px" />
                <col width="540px" />
            </colgroup>
            <tr>
            	<div class="title" style="font-size: 50px; color:grey; text-align: center; margin:80px;">회원가입 Welcome to Vert
            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            	</div>
            	
                <td class="userTit" rowspan="2"><span class="c_imp"></span>  이메일 (필수)</td>
                <td class="userVal">
                    <input type="text" name="email_id" value="" class="userInput w100"  onfocus="this.value='';"/>
                    <span style="font-size:16px;">＠</span>
                    <input type="text" name="email_domain" value="" class="userInput w100" />
                    
                    <!--select 안의 name=email로 설정됨  -->
                    <select name="email" title="이메일 도메인 주소 선택" onchange="email_change()" class="userSelect w100">
                        <option value="0"> -- 선택 --</option>
                        <option value="naver.com">naver.com</option>
                        <option value="nate.com">nate.com</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="daum.net">daum.net</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="9" selected>직접 입력</option>
                    </select>
                    <label><input type="radio" name="mailing" value="yes" checked /> 수신 허용&nbsp;&nbsp;&nbsp;</label>
                    <label><input type="radio" name="mailing" value="no" /> 수신 불가&nbsp;&nbsp;</label>
                </td>
            </tr>
            <!-- <tr>
                <td class="userVal" style="height:25px;color:#888888;">
                	 ※ hanmail.net은 메일 수신이 어려울 수 있으니 가급적 다른 메일을 이용하시기 바랍니다.
                </td>
            </tr> -->
            <tr>
                <td class="userTit"><span class="c_imp"></span>  아이디</td>
                <td class="userVal">
                    <input type="text" name="user_id" value="" maxlength="12" class="userInput"
                        onkeydown="inputIdChk()" style="width:200px;" />                    
                    <button type="button" class="btn_search" onclick="openIdChk()">중복 확인</button>
                    <input type="hid=den" name="idDuplication" value="idUncheck"/>
                    <span style="margin-left:10px;"></span>
                    <span style="color:#888888;">+ 4~15자, 첫 영문자, 영문자와 숫자 조합</span>
                </td>
            </tr>
            <tr>
                <td class="userTit"><span class="c_imp"></span>  비밀번호</td>
                <td class="userVal">
                    <input type="password" name="user_pass"  value="" style="width:200px;" class="userInput"
                        maxlength="25" />
                </td>
            </tr>
            <tr>
                <td class="userTit"><span class="c_imp"></span>  비밀번호 확인</td>
                <td class="userVal">
                    <input type="password" name="pass2" value="" style="width:200px;" class="userInput"
                        maxlength="25" />
                    <span style="margin:0 0 0 3px;color:#888888;">(확인을 위해 다시 입력해 주세요.)</span>
                </td>
            </tr>
            <tr>
                <td class="userTit"><span class="c_imp"></span>이름</td>
                <td class="userVal">
                    <input type="text" name="name" value="" style="width:120px;" class="userInput" maxlength="10" />
                </td>
            </tr>
            <tr>
                <td class="userTit"><span class="c_imp"></span>  성별</td>
                <td class="userVal">
                    <label><input type="radio" name="gender" value="male" checked />남자&nbsp;&nbsp;</label>
                    <label><input type="radio" name="gender" value="female" />여자&nbsp;&nbsp;</label>
                    <span style="margin-left:20px;"></span>
                </td>
            </tr>
            
            <tr>
                <td class="userTit"><span class="c_imp"></span> 휴대전화</td>
                <td class="userVal">
                    <input type="text" name="mobile1" value="" class="userInput w40" maxlength="3" /> -
                    <input type="text" name="mobile2" value="" class="userInput w50" maxlength="4" /> -
                    <input type="text" name="mobile3" value="" class="userInput w50" maxlength="4" />
                    <span style="margin-left:20px;"></span>
                    <label><input type="radio" name="sms" value="yes" checked /> SMS 수신허용</label>
                    <label><input type="radio" name="sms" value="no" /> SMS 수신불가</label>
                </td>
            </tr> 
           </div>
        </table>
        <table style="width:670px; margin-top:20px;">
        <br /><br />
            <tr>
                <td align="center">                    
                    <input type="submit"  value="등록하기" class="btn_cancel" style="background-color:#4cef7d;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" value="새로쓰기" class="btn_cancel"  style="background-color:#9da09e;" />
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
        </table> 
        <div id="nav">
        </div>      
    </form>
	     <!-- 하단 아이콘 바 -->
	<div id="link">
		<%@ include file="../00Main/inc/link.jsp" %>
	</div>
   	
    <div id="footer">
		<%@ include file="../00Main/inc/footer.jsp" %>
		
	</div>
    
</body>

</html>
