
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
        <title>GSM | INDEX</title>

        <style type="text/css">

            #langs{
                position: relative;              
                left:783px;
                top: 0px;

            }

        </style>
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
                    <div id="langs">
                        <%@include file="header.jsp" %>
                    </div>
                </div>
                    <div id="search-bottom"></div>
                    <!-- Catalog -->

                    <br/><br/>
                    <div class="box">
                        <div id="col-l">

                            <div class="title01-top"></div>
                            <div class="title01">    
                                <div class="title01-in">
                                    <p class="f-right noprint"><strong><a href="" class="add"><fmt:message key="lbl.head1"/></a></strong></p>
                                    <h2 class="ico-list"><fmt:message key="lbl.heading"/></h2>
                                </div>
                            </div>                
                            <div class="title01-bottom"></div>

                            <div class="box">

                            </div> <!-- /box -->

                            <hr class="noscreen" />
                        </div> <!-- /col-l -->

                        <!-- Sidebar -->
                        <div id="col-r" class="noprint">

                            <!-- Login -->
                            <div id="signup">
                                <h3><fmt:message key="lbl.actions"/></h3>

                                <div class="in02">                    
                                    <ul class="nom">
                                        <li class="ico-reg"><strong> <a href="home.jsp"><fmt:message key="lbl.login"/></a></strong></li>

                                    </ul>
                                </div> <!-- /in02 -->

                            </div> <!-- /signup -->
                            <hr class="noscreen" />
                            <div id="signup-bottom"></div>


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
                    <!-- Do you want to remove this backlinks? Look at www.nuviotemplates.com/payment.php -->

                </div> <!-- /footer -->

            </div> <!-- /main -->

    </body>
</html>
