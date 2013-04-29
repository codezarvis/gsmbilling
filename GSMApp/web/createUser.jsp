<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta http-equiv="content-language" content="en" />
        <meta name="robots" content="all,follow" />
        <meta name="description" content="..." />
        <meta name="keywords" content="..." />
        <link rel="stylesheet" media="screen,projection" type="text/css" href="css/main.css" />
        <!--[if lte IE 6]><link rel="stylesheet" type="text/css" href="css/main-msie.css" /><![endif]-->
        <link rel="stylesheet" media="print" type="text/css" href="css/print.css" />
        <script type="text/javascript" src="js/prototype.js"></script>
        <script type="text/javascript" src="js/tabs.js"></script>
        <script type="text/javascript" src="js/tooltip.js"></script>
        <script type="text/javascript" src="js/showdetail.js"></script>
        <title>User Creation</title>

        <style type="text/css">

              
            #langs{
                position: relative;              
                left:783px;
                top: -100px;

            }
            
            #bfr{

                position: relative;
                height: 45px;
                left:72px;
                width: 50px;
                top: -54px;
                display: none;
            }

            #table{

                position: relative;
                height: 380px;
                left:180px;
                width: 300px;
                top: 20px;
            }

            #val{
                position: relative;              
                left:783px;
                top: -25px;

            }

            #heading{
                position: relative;              
                left:10px;
                top: -1px;
                font-weight: bold;
                font-size: larger;
            }
        </style>
        <script src="${pageContext.request.contextPath}/assets/js/jquery-1.8.2.min.js"></script>
        <script type="text/javascript">
            
            $(document).ready(function(){
                
                $('#btnCreate').click(function(){
                    
                    var servicenum = $('#serviceNum').val();
                    var firstName = $('#firstName').val();
                    var lastName = $('#lastName').val();
                    var address = $('#address').val();
                    var mobile = $('#mobile').val();
                    var email = $('#email').val();
                    var meterNum = $('#meterNum').val();
                    
                    if(servicenum == null || servicenum.length == 0){
                        
                        alert('Service Number Required');
                        return false;
                        
                    }
                    
                    if(firstName == null || firstName.length == 0){
                        
                        alert('First Name Required');
                        return false;
                        
                    }
                    
                    if(lastName == null || lastName.length == 0){
                        
                        alert('Last Name Required');
                        return false;
                        
                    }
                    
                    if(address == null || address.length == 0){
                        
                        alert('Address Required');
                        return false;
                        
                    }
                    
                    if(mobile == null || mobile.length == 0){
                        
                        alert('Mobile Required');
                        return false;
                        
                    }
                    
                    if(email == null || email.length == 0){
                        
                        alert('E-mail Required');
                        return false;
                        
                    }
                    
                    if(meterNum == null || meterNum.length == 0){
                        
                        alert('Meter Number Required');
                        return false;
                        
                    }
                    
                    $('#bfr').css('display', 'block');
                    
                    $.ajax({
                        type:'POST',
                        data:$('#userCreationForm').serialize(),
                        url:'${pageContext.request.contextPath}/CreateUserController',
                        success : function(response) {
                            
                            alert(response);
                            $('#bfr').css('display', 'none'); 
                            $('#serviceNum').val(" ");
                            $('#firstName').val(" ");
                            $('#lastName').val(" ");
                            $('#address').val(" ");
                            $('#mobile').val(" ");
                            $('#email').val(" ");
                            $('#meterNum').val(" ");
                          
                        }
                    });
                
                });
            
            });
            
        </script>
    </head>

    <body>

        <div id="main">

            <!-- Header -->
            <div id="header">

                <h1 id="logo"><a href="./" title="[Go to homepage]"><img src="assets/images/f301.gif" width="165" height="60" alt="Logo" /></a></h1>

                <hr class="noscreen" />

                <!-- Date -->
                <div>
                    <p class="nom"><strong><%=new java.util.Date()%></strong>
                </div>
                <br/>
                <hr class="noscreen" />
            </div> <!-- /header -->

            <!-- Tabs -->

            <!-- Search -->

            <script type="text/javascript">
                new Control.Tabs('search-type');
            </script>


            <!-- Content -->
            <div id="page" class="box">

                <div id="search-top"></div>
                <div id="search-in">

                    <div id="heading"> <fmt:message key="lbl.welcome"/>, <c:out value="${user.userName}"></c:out> </div>
                        <div id="val">
                            <a href="admin.jsp"><fmt:message key="lbl.home"/></a> | <a href="SignOutController"><fmt:message key="lbl.signout"/></a>

                    </div>

                </div>

                <div id="search-bottom"></div>
                <!-- Catalog -->

                <br/><br/>
                <div class="box">
                    <div id="col-l">
                        <div id="langs">
                            <%@include file="header.jsp" %>
                        </div>
                        <div class="title01-top"></div>
                        <div class="title01"> 
                            <br/>
                            <div class="title01-in">

                                <h2 align="center" class="ico-list"><fmt:message key="lbl.profile"/></h2>
                                <hr/>
                            </div>

                            <form id="userCreationForm">
                                <div id="table">
                                    <table>

                                        <tr>
                                            <td><fmt:message key="lbl.serviceNo"/></td><td><input type="text" name="serviceNum" id="serviceNum" ></td>
                                        </tr>
                                        <tr></tr><tr></tr><tr></tr>

                                        <tr>
                                            <td><fmt:message key="lbl.firstName"/></td><td><input type="text" name="firstName" id="firstName" ></td>
                                        </tr>
                                        <tr></tr><tr></tr><tr></tr>

                                        <tr>
                                            <td><fmt:message key="lbl.lastName"/></td><td><input type="text" name="lastName" id="lastName" ></td>
                                        </tr>
                                        <tr></tr><tr></tr><tr></tr>

                                        <tr>
                                            <td><fmt:message key="lbl.address"/></td><td><textarea rows="2" cols="14" name="address" id="address"></textarea></td>
                                        </tr>
                                        <tr></tr><tr></tr><tr></tr>

                                        <tr>

                                            <td><fmt:message key="lbl.area"/>
                                                </td><td><select name="area" id="area">
                                                        <c:forEach items="${list}" var="operator">
                                                            <option><c:out value="${operator.area}"></c:out></option>
                                                        </c:forEach>
                                                    </select>

                                                </td>
                                            </tr>

                                            <tr>

                                                <td><fmt:message key="lbl.wardNum"/></td><td>
                                                    <select name="wardNum" id="wardNum" >
                                                        <c:forEach items="${list}" var="operator">
                                                            <option><c:out value="${operator.wardNo}"></c:out></option>
                                                        </c:forEach>
                                                    </select>

                                                </td>
                                            </tr>

                                            <tr>
                                                <td><fmt:message key="lbl.mobile"/></td><td><input type="text" name="mobile" id="mobile"  ></td>
                                            </tr>
                                            <tr></tr><tr></tr><tr></tr>

                                            <tr>
                                                <td><fmt:message key="lbl.email"/></td><td><input type="text" name="email" id="email" ></td>
                                            </tr>
                                            <tr></tr><tr></tr><tr></tr>

                                            <tr>
                                                <td><fmt:message key="lbl.meterNum"/></td><td><input type="text" name="meterNum" id="meterNum" ></td>
                                            </tr>

                                        </table>

                                        <p align="left"><input type="button" value="<fmt:message key="lbl.createBtn"/>" id="btnCreate"> </p>
                                     
                                        <p align="left"><a href="SessionController"><fmt:message key="lbl.cancel"/></a></p>

                                        <div id="bfr"><img src="assets/images/ajax-loader-large.gif"></div>
                                    </div>
                                </form>
                                <div class="title01-bottom"></div>
                            </div>                


                            <div class="box">

                            </div> <!-- /box -->

                            <hr class="noscreen" />
                        </div> <!-- /col-l -->

                        <!-- Sidebar -->



                        <hr class="noscreen" />



                        <script type="text/javascript">
                            new Control.Tabs('switch');
                        </script>

                        <hr class="noscreen" />          
                    </div> <!-- /col-r -->
                </div> <!-- /box -->
                <div class="title01-top"></div>
                <div class="title01">    
                    <div class="title01-in">
                        <h3 class="ico-info"><fmt:message key="lbl.appName"/></h3>
                    </div>
                </div>                
                <div class="title01-bottom"></div>

                <div class="box">


                </div> <!-- /box -->

                <p class="t-center"><a href=""><fmt:message key="lbl.showMore"/></a></p>

            </div> <!-- /page -->

            <!-- Footer -->
            <div id="footer">
                <hr class="noscreen" />

                <p class="f-right noprint">

                    <a href=""><fmt:message key="lbl.contact"/></a>
                </p>

                <p align="center">&copy;&nbsp;2013 <a href=""><fmt:message key="lbl.company"/></a><br />
                    <!-- Do you want to remove this backlinks? Look at www.nuviotemplates.com/payment.php -->
                </p>


            </div> <!-- /footer -->

            </div> <!-- /main -->

        </body>
    </html>
