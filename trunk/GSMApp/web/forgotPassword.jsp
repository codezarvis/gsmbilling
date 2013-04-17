<?xml version="1.0"?>
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
        <title>Password Generation</title>

        <style type="text/css">

            #bfr{

                position: relative;
                height: 30px;
                left: 80px;
                width: 50px;
                top: -45px;
                display: none;
            }


        </style>
        <script src="${pageContext.request.contextPath}/assets/js/jquery-1.8.2.min.js"></script>
        <script type="text/javascript">
           
            $(document).ready(function(){
               
                $('#submitbtn').click(function(){
            
                    var userName = $('#userName').val();
                    var answer = $('#answer').val();
                    
                    if(userName == null || userName.length == 0) {
                        alert('User Name is required !');
                        return false;
                    }
                    
                    if(answer == null || answer.length == 0) {
                        alert('Answer is required !');
                        return false;
                    }
                    
                    $('#bfr').css('display', 'block');
                       
                    $.ajax({
                        type:'POST',
                        data:$('#pwdForm').serialize(),
                        url:'${pageContext.request.contextPath}/ForgotPasswordController',
                        success : function(response) {
                            alert(response);
                            $('#bfr').css('display', 'none');
                            $("#userName").val(" ");
                            $("#answer").val(" ");
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
            <div id="search-tabs" class="box">

            </div> <!-- /search-tabs -->

            <!-- Search -->


            <script type="text/javascript">
                new Control.Tabs('search-type');
            </script>

            <!-- Content -->
            <div id="page" class="box">

                <div id="search-top">
                      
                </div>

                <div id="search-in"> 
                  <a href="home.jsp">Home</a>
                </div>

                <div id="search-bottom"></div>

                <br/>
                <!-- Catalog -->
                <div class="box">
                    <div id="col-l">

                        <div class="title01-top"></div>
                        <div class="title01">    
                            <div class="title01-in">
                                <p class="f-right noprint"><strong><a href="" class="add">Submit a Site</a></strong></p>
                                <h2 class="ico-list">Katalog</h2>
                            </div>
                        </div>                
                        <div class="title01-bottom"></div>



                        <hr class="noscreen" />
                    </div> <!-- /col-l -->

                    <!-- Sidebar -->
                    <div id="col-r" class="noprint">

                        <!-- Login -->
                        <div id="signup">
                            <h3>Password Retrieval</h3>

                            <div class="in">

                                <form id="pwdForm">

                                    <table align="center">

                                        <tr>
                                            <td>UserName</td>
                                        </tr>
                                        <tr>
                                            <td><input type="text" name="userName" id="userName"/></td>
                                        </tr> <tr></tr> <tr></tr>                
                                        <tr>
                                            <td>Question</td>
                                        </tr>   
                                        <tr>
                                            <td>
                                                <select id="securityQuestion" name="securityQuestion">
                                                    <option value ="What is ur native place?">What is ur native place?</option>
                                                    <option value ="What is the name of ur first pet?">What is the name of ur first pet?</option>
                                                    <option value =" Where did u do ur primary schooling?">Where did u do ur primary schooling?</option>
                                                    <option value =" What is ur favourite sport?">What is ur favourite sport?</option>

                                                </select>

                                            </td>
                                        </tr>
                                        <tr></tr> <tr></tr> <tr></tr>                
                                        <tr>
                                            <td>Answer</td>
                                        </tr>

                                        <tr>
                                            <td><input type="text" name="answer" id="answer"/></td>
                                        </tr>  <tr></tr> <tr></tr> 
                                        <tr>
                                            <td> <input type="button" value="Submit" id="submitbtn"/></td>

                                        </tr>                


                                    </table>
                                                                                 
                                    <div id="bfr"><img src="assets/images/ajax-loader-large.gif"></div>

                                </form>
                            </div> <!-- /in -->

                            <div class="in02">                    
                                <ul class="nom">


                                </ul>
                            </div> <!-- /in02 -->

                        </div> <!-- /signup -->
                        <hr class="noscreen" />
                        <div id="signup-bottom"></div>

                        <!-- Tabs -->

                        <!-- Most Recent -->
                        <div id="tab-01">


                        </div>

                        <!-- Most Viewed -->
                        <div id="tab-02">


                        </div>

                        <script type="text/javascript">
                            new Control.Tabs('switch');
                        </script>

                        <hr class="noscreen" />          
                    </div> <!-- /col-r -->
                </div> <!-- /box -->

                <div class="title01-top"></div>
                <div class="title01">    
                    <div class="title01-in">
                        <h3 class="ico-info">Most Recent</h3>
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



                <p align="center">&copy;&nbsp;2009 <a href="">Your Company</a><br />
                    <!-- Do you want to remove this backlinks? Look at www.nuviotemplates.com/payment.php -->
                    <span id="copy"><a href="http://www.nuviotemplates.com/">Free web templates</a> by <a href="http://www.qartin.cz/">Qartin</a><br /><span class="smaller">Visit <a href="http://www.southpadre.net/" title="South Padre Island">South Padre Island</a></span></span></p>
                <!-- Do you want to remove this backlinks? Look at www.nuviotemplates.com/payment.php -->

            </div> <!-- /footer -->

        </div> <!-- /main -->

    </body>
</html>
