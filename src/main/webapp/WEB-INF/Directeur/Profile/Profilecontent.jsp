<%
	session = request.getSession();
	

 	String emaill = (String) session.getAttribute("email");
 	String nomm = (String) session.getAttribute("personneNom");
 	String prenomm = (String) session.getAttribute("personnePrenom");
 	String adresss = (String) session.getAttribute("personneAdress");
 	int tell = (int) session.getAttribute("personneTel");
 	int id = (int) session.getAttribute("personneID");
%>
<title>Insert title here</title>
<style>
	body {
    background: rgb(99, 39, 120)
}

.form-control:focus {
    box-shadow: none;
    border-color: #BA68C8
}

.profile-button {
    background: rgb(99, 39, 120);
    box-shadow: none;
    border: none
}
.form-control {
        width: 100px;
    }

.profile-button:hover {
    background: #682773
}

.profile-button:focus {
    background: #682773;
    box-shadow: none
}

.profile-button:active {
    background: #682773;
    box-shadow: none
}

.back:hover {
    color: #682773;
    cursor: pointer
}

.labels {
    font-size: 11px
}

.add-experience:hover {
    background: #BA68C8;
    color: #fff;
    cursor: pointer;
    border: solid 1px #BA68C8
}

</style>
<div class="main">
            <nav class="navbar navbar-expand px-3 border-bottom">
                <button class="btn" id="sidebar-toggle" type="button">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </nav>
            <main class="content px-3 py-2">
                
                    <!-- Table Element -->
                    <div class="card border-0">
                        <div class="card-header">
                            
                            <h6 class="card-subtitle text-muted">
                                <div class="container rounded bg-white mt-5 mb-5" style="width:900px">
	        <div class="row">
	            <div class="col-md-3 border-right">
	                <div class="d-flex flex-column align-items-center text-center p-3 py-5">
	                    <img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
	                    <span class="font-weight-bold"><%=nomm %> <%=prenomm%></span>
	                    <span class="text-black-50"><%=emaill %></span>
	                    <span> </span>
	                </div>
	            </div>
	            <div class="col-md-5 border-right">
	                <div class="p-3 py-5">
	                    <div class="d-flex justify-content-between align-items-center mb-3">
	                        <h4 class="text-right">Profile Settings</h4>
	                    </div>
	                 <form action="/ProjetJEE/ProfileDirecteur" method="post">
	                    <div class="row mt-2">
	                        <div class="col-md-6">
	                            <label class="labels">Nom</label>
	                            <input type="text" class="form-control" value="<%=nomm%>" name="nom" style="width:160px">
	                        </div>
	                        <div class="col-md-6">
	                            <label class="labels">Prenom</label>
	                            <input type="text" class="form-control" value="<%=prenomm%>" name="prenom" placeholder="surname" style="width:160px">
	                        </div>
	                    </div>
	                    <div class="row mt-2">
	                        <div class="col-md-6">
	                            <label class="labels">Address</label>
	                            <input type="text" class="form-control" value="<%=adresss%>" name="address" style="width:160px">
	                        </div>
	                        <div class="col-md-6">
	                            <label class="labels">Telephone</label>
	                            <input type="text" class="form-control" value="<%=tell%>" name="telephone" style="width:160px">
	                            <input type="hidden" class="form-control" value="<%=id%>" name="personneID" style="width:160px" >
	                        </div>
	                    </div>
	                    <div class="mt-5 text-center">
	                        <button class="btn btn-primary profile-button" type="submit">Save Profile</button>
	                    </div>
	                  </form>
	                </div>
	            </div>
	        </div>
	    </div>
                            </h6>
                        </div>
                        </div>
            </main>
            <a href="#" class="theme-toggle">
                <i class="fa-regular fa-moon"></i>
                <i class="fa-regular fa-sun"></i>
            </a>
            <%@ include file="../footer.jsp"%>
        </div>