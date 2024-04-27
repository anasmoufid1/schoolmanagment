<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
	session = request.getSession();
	int nbrProjet = (int)session.getAttribute("nbrProjet");
	int nbrclient = (int)session.getAttribute("nbrclient");
	int nbrdev = (int)session.getAttribute("nbrdev");
	int nbrChef = (int)session.getAttribute("numberOfChef");
%>

    </style>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.3.1/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/bootstrap-extended.min.css">
<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/fonts/simple-line-icons/style.min.css">
<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/colors.min.css">
<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">

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
                                <section class="mainsection">
										<div class="mainsection-top">
											<i class="fas fa-user-cog"></i>
										</div>
										<section class="mainsection-course">
											<h1>My Projects</h1>
											<div class="course-box">
												<div class="bg-default">
									  				
									<div class="grey-bg container-fluid" style="width:800px;margin-left:15px">
									  <section id="minimal-statistics">
									    <div class="row">
									      <div class="col-12 mt-3 mb-1">
									        <h4 class="text-uppercase">Minimal Statistics Cards</h4>
									        <p>Statistics on minimal cards.</p>
									      </div>
									    </div>    
									  
									    <div class="row">
									      <div class="col-xl-3 col-sm-6 col-12">
									        <div class="card">
									          <div class="card-content">
									            <div class="card-body">
									              <div class="media d-flex">
									                <div class="media-body text-left">
									                  <h3 class="danger"><%= nbrProjet %></h3>
									                  <span>Projects</span>
									                </div>
									                <div class="align-self-center">
									                  <i class="icon-rocket danger font-large-2 float-right"></i>
									                </div>
									              </div>
									            </div>
									          </div>
									        </div>
									      </div>
									      <div class="col-xl-3 col-sm-6 col-12">
									        <div class="card">
									          <div class="card-content">
									            <div class="card-body">
									              <div class="media d-flex">
									                <div class="media-body text-left">
									                  <h3 class="success"><%= nbrclient%></h3>
									                  <span> Clients</span>
									                </div>
									                <div class="align-self-center">
									                  <i class="icon-user success font-large-2 float-right"></i>
									                </div>
									              </div>
									            </div>
									          </div>
									        </div>
									      </div>
									  
									      <div class="col-xl-3 col-sm-6 col-12">
									        <div class="card">
									          <div class="card-content">
									            <div class="card-body">
									              <div class="media d-flex">
									                <div class="media-body text-left">
									                  <h3 class="warning"><%=nbrdev %></h3>
									                  <span>Developpeur</span>
									                </div>
									                <div class="align-self-center">
									                  <i class="icon-pie-chart warning font-large-2 float-right"></i>
									                </div>
									              </div>
									            </div>
									          </div>
									        </div>
									      </div>
									      <div class="col-xl-3 col-sm-6 col-12">
									        <div class="card">
									          <div class="card-content">
									            <div class="card-body">
									              <div class="media d-flex">
									                <div class="media-body text-left">
									                  <h3 class="primary"><%= nbrChef %></h3>
									                  <span>Chefs de projet</span>
									                </div>
									                <div class="align-self-center">
									                  <i class="icon-support primary font-large-2 float-right"></i>
									                </div>
									              </div>
									            </div>
									          </div>
									        </div>
									      </div>
									    </div>
									  
									   
									      
									  
									     
									  </section>
									  
									  </div>
									
										</div></div>
										</section>
									</section>
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