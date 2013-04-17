<?xml version="1.0"?>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="com.gsm.domain.sub.Client"%>
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
        <title>Operator View</title>

        <style type="text/css">

             #heading{
                position: relative;              
                left:10px;
                top: -1px;
                font-weight: bold;
                font-size: large;
            }

            #tableView1{

                position: relative;
                left:100px;
                width: 420px;
                top: 0px;
            }

            #val{
                position: relative;              
                left:783px;
                top: -25px;

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

                                    <h2 align="center" class="ico-list">Client's List</h2>
                                    <hr/>
                                </div>

                                <div id="tableView1">

                                    <table>

                                        <tr>

                                            <td>Service Number</td>
                                            <td>User Name</td>
                                            <td>Address</td>

                                            <td>Mobile</td>
                                            <td>Meter Number</td>

                                        </tr>

                                    <c:forEach items="${list}" var="client">


                                        <tr>

                                            <td><c:out value="${client.serviceNumber}"></c:out></td>
                                            <td><c:out value="${client.firstName} ${client.lastName}"></c:out></td>
                                            <td><c:out value="${client.address}"></c:out></td>

                                                <td><c:out value="${client.mobile}"></c:out></td>
                                            <td><c:out value="${client.meterNumber}"></c:out></td>

                                            </tr>

                                    </c:forEach>

                                </table>

                                <p align="center"><a href="SessionController">Back</a></p>
                            </div>

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
                    <h3 class="ico-info"></h3>
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

            <p align="center">&copy;&nbsp;2009 <a href="">Your Company</a><br />
                <!-- Do you want to remove this backlinks? Look at www.nuviotemplates.com/payment.php -->
                <span id="copy"><a href="http://www.nuviotemplates.com/">Free web templates</a> by <a href="http://www.qartin.cz/">Qartin</a><br /><span class="smaller">Visit <a href="http://www.southpadre.net/" title="South Padre Island">South Padre Island</a></span></span></p>
            <!-- Do you want to remove this backlinks? Look at www.nuviotemplates.com/payment.php -->

        </div> <!-- /footer -->



    </body>
</html>
