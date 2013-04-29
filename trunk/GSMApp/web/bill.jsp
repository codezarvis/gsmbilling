<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${param['lang']!=null}">

    <fmt:setLocale value="${param['lang']}" scope="session"/>


</c:if>
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
        <title>Bill Generation</title>

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


            #tableView1{

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
                top: 0px;
                font-weight: bold;
                font-size: large;
            }


            #clientDiv{

                position: relative;
                left: 28px;
                display: none;
            }

            #errDiv{

                position: relative;
                left: -2px;
                top: 20px;
                font-size: large;
                width:330px;
                display: none;
                color: red;

            }

            #bill{

                position: relative;
                left: 17px;
                display: none;
            }


        </style>
        <script src="${pageContext.request.contextPath}/assets/js/jquery-1.8.2.min.js"></script>

        <script type="text/javascript">
            
            $(document).ready(function(){
                
                
                $("#link").click(function(){
                
                    var meterId = $("#meterId").val();
                    
                    if(meterId == null || meterId.length == 0){
                        
                        alert("Meter Number is Required..!");
                    }
               
                    $.ajax({
                        type:'GET',
                        
                        url:'${pageContext.request.contextPath}/ClientDetailsController?id='+meterId,
                        success : function(response) {
                            var res = response;
                            
                            if(res == 1){
                                $("#errDiv").css('display','block');
                                $("#errDiv").html("Bill Has Been Generated For This Month");
                                $("#bill").css('display','none');
                                return;
                            }
                           
                            $("#errDiv").css('display','none');
                            $("#clientDiv").css('display','block');
                            $("#clientDiv").html(response);
                            $("#bill").css('display','block');
                        }
                    
                    
                    });
                
                
                });
                
                $("#btnClk").click(function(){
                
                                
                    var crntreading = $("#crntReading").val();
                                                          
                    if(crntreading == null || crntreading.length == 0){
                        
                        alert("Current reading is Required..!");
                    }
                    
                    $.ajax({
                        type:'POST',
                        data:$('#billGenerationForm').serialize(),
                        url:'${pageContext.request.contextPath}/ClientDetailsController',
                        success : function(response1) {
                            alert("Bill Generated Successfully..!!");
                            $('#meterId').val("");
                            $("#clientDiv").css('display','none');
                            $("#bill").css('display','none');
                            
                        }
                    
                    
                    });
                
                
                });
                
            });
            
            
            function difference(){
                var units = document.getElementById('units');
                var reading = parseInt(document.getElementById('reading').value);
                var crntReading = parseInt(document.getElementById('crntReading').value);
                units.value = crntReading - reading; 
                   
            }
            
         
              
        </script>
    </head>

    <body>

        <div id="main">

            <!-- Header -->
            <div id="header">

                <h1 id="logo"><a href="./" title="[Go to homepage]"><img src="assets/images/f301.gif" width="165" height="60" alt="Logo" /></a></h1>

                <hr class="noscreen" />

                <!-- Date -->
                <div >
                    <p class="nom"><strong><%=new java.util.Date()%></strong>
                </div> <!-- /date -->
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

                    <div id="heading"> 

                        <fmt:message key="lbl.welcome"/>, <c:out value = "${operator.operatorName}"></c:out> 

                        <fmt:message key="lbl.area"/>: <c:out value="${operator.area}"></c:out> | <fmt:message key="lbl.wardNum"/>: <c:out value="${operator.wardNo}"></c:out>
                        </div>
                        <div id="val">
                                <a href="SessionController"><fmt:message key="lbl.home"/></a> | <a href="SignOutController"><fmt:message key="lbl.signout"/></a>

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

                                <h2 align="center" class="ico-list"><fmt:message key="lbl.billForm"/></h2>
                                <hr/>
                            </div>

                            <form id="billGenerationForm">
                                <div id="tableView1">

                                    <p align="center"><fmt:message key="lbl.meterNum"/><input type="text" name="meterId" id="meterId"/></p>

                                    <p align="center"><a href="#" id="link"><fmt:message key="lbl.getDetails"/></a></p>

                                    <div id="errDiv"></div>

                                    <div id="clientDiv">

                                    </div>

                                    <div id="bill">

                                        <table>
                                            <tr>
                                                <td><fmt:message key="lbl.date"/></td><td><input type="text" value= "<%=new java.util.Date()%>"/></td>
                                            </tr>
                                            <tr></tr>
                                            <tr>
                                                <td><fmt:message key="lbl.reading"/></td><td><input type="text" id="crntReading" name="crntReading" onblur="difference();"/></td>
                                            </tr>
                                            <tr></tr>
                                            <tr>
                                                <td><fmt:message key="lbl.units"/></td><td><input type="text" id="units" name="units"/></td>
                                            </tr>
                                            <tr></tr>
                                            <tr>
                                                <td><input type="button" value="<fmt:message key="lbl.submit"/>" id="btnClk"></td>
                                            </tr>
                                        </table>

                                    </div>

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
