<?xml version="1.0"?>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
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
                top: -1px;
                font-weight: bold;
                font-size: large;
            }


            #clientDiv{

                position: relative;
                left: 570px;
                display: none;
            }

            #errDiv{

                position: relative;
                left: 540px;
                font-size: large;
                width:300px;
                display: none;

            }

            #bill{

                position: relative;
                left: 500px;
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
                                $("#errDiv").html("Bill Already Generated For This Month");
                                $("#bill").css('display','none');
                                return;
                            }
                           
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
                            $('#date').val(" ");
                            $('#reading').val(" ");
                            $('#crntReading').val(" ");
                            $('#units').val(" ");
                        }
                    
                    
                    });
                
                
                });
                
            });
            
            
            function difference(){
                var units = document.getElementById('units');
                //                var nullReading = parseInt(document.getElementById('nullReading').value);
                var reading = parseInt(document.getElementById('reading').value);
                var crntReading = parseInt(document.getElementById('crntReading').value);
                units.value = crntReading - reading; 
                   
                //                if(nullReading){
                //                    
                //                    units.value = crntReading - nullReading; 
                //                }
                //                else if(reading)  {
                 
                //                }
                
            
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

                    <div id="heading"> Welcome, <c:out value = "${operator.operatorName}"></c:out> </div>
                        <div id="val">
                            <a href="SessionController">Home</a> | <a href="SignOutController">SignOut</a>

                        </div>

                    </div>

                    <div id="search-bottom"></div>
                    <!-- Catalog -->

                    <br/><br/>
                    <div class="box">
                        <div id="col-l">

                            <div class="title01-top"></div>
                            <div class="title01"> 
                                <br/>
                                <div class="title01-in">

                                    <h2 align="center" class="ico-list">Client Bill Generation Form</h2>
                                    <hr/>
                                </div>

                                <form id="billGenerationForm">
                                    <div id="tableView1">

                                        <p align="center">Enter Meter Number <input type="text" name="meterId" id="meterId"/></p>
                                        <p align="center"><a href="#" id="link">Get Client Details</a></p>

                                        <div id="errDiv"></div>

                                        <div id="clientDiv">

                                        </div>

                                        <div id="bill">
                                            <br/>
                                            <table>
                                                <tr>
                                                    <td>Reading Date</td><td><input type="text" value= "<%=new java.util.Date()%>"/></td>
                                            </tr>
                                            <tr></tr><tr></tr><tr></tr>
                                            <tr>
                                                <td>Current Reading</td><td><input type="text" id="crntReading" name="crntReading" onblur="difference();"/></td>
                                            </tr>
                                            <tr></tr><tr></tr><tr></tr>
                                            <tr>
                                                <td>Total Units Consumed</td><td><input type="text" id="units" name="units"/></td>
                                            </tr>
                                            <tr></tr><tr></tr><tr></tr>
                                            <tr>
                                                <td><input type="button" value="Submit" id="btnClk"></td>
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
                        <h3 class="ico-info">E-Bill App</h3>
                    </div>
                </div>                
                <div class="title01-bottom"></div>

            <div class="box">


            </div> <!-- /box -->

            <p class="t-center"><a href="">Show more &raquo;</a></p>

        </div> <!-- /page -->

        <!-- Footer -->
        <div id="footer">
            <hr class="noscreen" />

            <p class="f-right noprint">
                <a href="">Sitemap</a>,
                <a href="">Contact</a>
            </p>

            <p align="center">&copy;&nbsp;2013 <a href="">Your Company</a><br />
                <!-- Do you want to remove this backlinks? Look at www.nuviotemplates.com/payment.php -->
                <span id="copy"><a href="http://www.nuviotemplates.com/">Free web templates</a> by <a href="http://www.qartin.cz/">Qartin</a><br /><span class="smaller">Visit <a href="http://www.southpadre.net/" title="South Padre Island">South Padre Island</a></span></span></p>
            <!-- Do you want to remove this backlinks? Look at www.nuviotemplates.com/payment.php -->

        </div> <!-- /footer -->

        </div> <!-- /main -->

    </body>
</html>
