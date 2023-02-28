<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.navbar {
		width:1920px;
		height:200px;
	}
	.bi-list {
		width: 100px;
		height: 100px;
	}
	.dropdown-menu {
		text-align:center;
		width: 270px;
		height: 500px;
		
	}
	.dropdown-item {
		font-size: 30px;
	}
</style>

	<!-- <div class="row">
  <div class="col-sm-4">.col-sm-4</div>
  <div class="col-sm-8">.col-sm-8</div>
  	.col- (extra small devices - screen width less than 576px)
	.col-sm- (small devices - screen width equal to or greater than 576px)
	.col-md- (medium devices - screen width equal to or greater than 768px)
	.col-lg- (large devices - screen width equal to or greater than 992px)
	.col-xl- (xlarge devices - screen width equal to or greater than 1200px)
	.col-xxl- (xxlarge devices - screen width equal to or greater than 1400px)
</div> -->


	
<!-- dlkdldldl -->

	<nav class="navbar navbar-expand-xl navbar-light ">
		<!-- 삼지창 드롭다운  -->
		<div class="container-fluid col-sm-1">
			<div class="navbar-collapse collapse show" id="navbarWithDropdown" style="">
				<ul class="navbar-nav ms-3">
					<li class="nav-item dropdown">
						<a class="nav-link" href="#" id="navbarWithDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-list"></i>
						</a>
						<ul class="dropdown-menu" >
							<br />
							<li><a class="dropdown-item" href="#" onclick="location.href='http://localhost:8585/K09MySQLBoard/WWW/00Main/AboutBi.jsp';">About</a></li>
							<br />
							<li><a class="dropdown-item" href="#">Collection</a></li>
							<br />
							<li><a class="dropdown-item" href="#">Shop</a></li>
							<br />
							
							<li><a class="dropdown-item" role="button" data-bs-toggle="dropdown" aria-expanded="false" onclick="location.href='http://localhost:8585/K09MySQLBoard/WWW/00Main/CommunityMain.jsp';" href="#">Community</a></li>
							<br />
						</ul>
					</li>
				</ul>
			</div>
		</div>
		
		<!-- Brand/logo -->
		<a class="navbar-brand col-sm-2" href="#">
		    <img src="../image/mainlogo.png" style="width:300px;">
		</a>
		<div class="blank col-sm-5" > </div>
		
		<!--검색 버튼  -->
		<form class="form-inline mt-3 ms-3" method="get" action="">
		    <div class="input-group mb-3 col-sm-2">
		        <input type="text" class="form-control" placeholder="Search  " style="ime-mode:disabled; "  maxlength="30">
		       	<button class="btn" type="submit"><i class='bi bi-search'
		                    style='font-size:20px'></i> </button>
		    </div>
		</form>
		<!-- 서치버튼 밑줄바 형식  -->
		<!-- <div class="main_search">
			<input type="text" class="input" placeholder="Search  " style="ime-mode:disabled; title="비밀번호" maxlength="30">
		</div> -->
		<!-- 로그인 버튼  -->
		<div class="navbar-nav ms-auto col-sm-2">
			<!-- <button class="btn-join" style="background-color:#4cef7d; color:#666666"type="submit" value="로그아웃" action="Logout.jsp" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Logout.jsp">로그아웃</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;</button> -->
			<i class='bi bi-box-arrow-right' href="#" color="#666666" action="LoginMain.jsp" style='font-size:20px'></i><button class="btn" type="submit" onclick="location.href='./Logout.jsp';">Logout!</button>
			
		</div>
       <!--  <ul class="navbar-nav1 ms-auto col-sm-3">
            <li class="nav-item">
                <a class="nav-link" href="#" color="#666666"><i class='bi bi-person'
                        style='font-size:20px'></i></a> -->
      
       </nav>
