
<%@page import="java.sql.ResultSet"%>
<%@page import="DSAS.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>DSAS: A Secure Data Sharing and Authorized
            Searchable Framework for e-Healthcare System</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="Tooplate">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">

        <!-- MAIN CSS -->
        <link rel="stylesheet" href="css/tooplate-style.css">
        <link rel="stylesheet" href="css/table.css">

    </head>
    
                <%
        if (request.getParameter("Success") != null) {%>
    <script>alert('Doctor Assigned for patient ');</script>  
    <%}
    %>
    <body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">

        <!-- PRE LOADER -->
        <section class="preloader">
            <div class="spinner">

                <span class="spinner-rotate"></span>

            </div>
        </section>
        <!-- MENU -->
        <section class="navbar navbar-default navbar-static-top" role="navigation">
            <div class="container">

                <div class="navbar-header">
                    <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon icon-bar"></span>
                        <span class="icon icon-bar"></span>
                        <span class="icon icon-bar"></span>
                    </button>

                    <!-- lOGO TEXT HERE -->
                    <a href="#" class="navbar-brand"><i class="fa fa-h-square"></i>&nbsp;DSAS</a>
                </div>

                <!-- MENU LINKS -->
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                         <li><a href="CSHome.jsp" class="smoothScroll">Home</a></li>
                        <li><a href="PatientsActivation.jsp" class="smoothScroll">Patients Activation</a></li>
                        <li><a href="DoctorsActivation.jsp" class="smoothScroll">Doctors Activation</a></li>
                        <li><a href="PatientsDetails.jsp" class="smoothScroll">Patients</a></li>
                        <li><a href="DoctorsDetails.jsp" class="smoothScroll">Doctors</a></li>
                        <li><a href="CloudFiles.jsp" class="smoothScroll">Files</a></li>
                        <li><a href="AssignDoctors.jsp" class="smoothScroll">Assign Doctors</a></li>
                        <li><a href="DoctorRequest.jsp" class="smoothScroll">Doctor Request</a></li>
                        <li><a href="Graph.jsp" class="smoothScroll">Graph</a></li>
                        <li class="appointment-btn"><a href="logout.jsp">Logout</a></li>
                    </ul>
                </div>

            </div>
        </section>


        <!-- NEWS DETAIL -->
        <section id="appointment" data-stellar-background-ratio="3">
            <div class="container">
                <div class="row">
                    <center><h2>Assign Doctor for Patients</h2></center>
                    <br><br>
                    <form  action="AssignDoctor" method="post">
                        <label>Select the Patient</label><br>
                        <div class="control-group">
                            <select class="form-control" required="" name="pid">
                                <%
                                    Connection con = SQLconnection.getconnection();
                                    Statement st = con.createStatement();
                                    try {
                                        ResultSet rs = st.executeQuery("Select * from medicalrecords where docassign='NO'");
                                        while (rs.next()) {

                                %>
                                <option value="<%=rs.getString("pid")%>">Patient ID: <%=rs.getString("pid")%></option>
                                <%                                        }
                                        rs.close();
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }

                                %>
                            </select>
                        </div>
                        <br>
                        <label>Select the Doctor</label><br>
                        <div class="control-group">
                            <select class="form-control" required="" name="did">
                                <%                                            try {
                                        ResultSet rs1 = st.executeQuery("Select * from doctors where ustatus ='Active'");
                                        while (rs1.next()) {

                                %>
                                <option value="<%=rs1.getString("id")%>">Doctor Name: <%=rs1.getString("name")%> and Doctor Mail: <%=rs1.getString("email")%></option>
                                <%                                        }
                                        rs1.close();
                                        con.close();
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }

                                %>
                            </select>
                        </div>
                        <br>
                        <div class="col-md-4 col-md-offset-4">
                            <button type="submit" class="form-control" id="cf-submit" name="submit">Assign</button>
                        </div>
                    </form>

                </div>
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            </div>
        </section>



        <!-- FOOTER -->
        <footer data-stellar-background-ratio="5">
           <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 border-top">
                <div class="col-md-4 col-sm-6">
                    <div class="copyright-text"> 
                        <p>Copyright &copy; 2024 DSAS e-Healthcare</p>
                        <p>Design and Developed by Team 23</p>
                    </div>
                </div>
                <div class="col-md-2 col-sm-2 text-align-center">
                    <div class="angle-up-btn"> 
                        <a href="#top" class="smoothScroll wow fadeInUp" data-wow-delay="1.2s"><i class="fa fa-angle-up"></i></a>
                    </div>
                </div>   
            </div>
        </div>
    </div>
        </footer>


        <!-- SCRIPTS -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.sticky.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/magnific-popup-options.js"></script>
        <script src="js/wow.min.js"></script>
        <script src="js/smoothscroll.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/custom.js"></script>

    </body>
</html>


