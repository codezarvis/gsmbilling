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
        <title>Bills View</title>

        <style>

            #val{
                position: relative;              
                left:779px;
                top: -25px;

            }

            #tableView1{

                position: relative;
                left:60px;
                width: 490px;
                top: 0px;
            }

            #heading{
                position: relative;              
                left:10px;
                top: -1px;
                font-weight: bold;
                font-size: larger;
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

                    <div id="heading"> Welcome, <c:out value="${user.userName}"></c:out> </div>
                    <div id="val">
                        <a href="user.jsp">Home</a> | <a href="SignOutController">SignOut</a>

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

                                <h2 align="center" class="ico-list">Monthly Bills</h2>
                                <hr/>
                            </div>

                            <div id="tableView1">

                                <table>

                                    <tr>
                                        <td>Meter Number</td>
                                        <td>Current Reading</td>
                                        <td>Units Consumed</td>
                                        <td>Bill Amount</td>
                                        <td>Status</td>
                                        <td></td>
                                    </tr>
                                    <tr></tr><tr></tr><tr></tr><tr></tr>

                                    <c:forEach items="${BillsList}" var="units">
                                        <tr>

                                            <td><c:out value="${units.meterNumber}"></c:out></td>
                                            <td><c:out value="${units.currentReading}"></c:out></td>
                                            <td><c:out value="${units.totalUnits}"></c:out></td>
                                            <td><c:out value="${units.totalPrice}"></c:out></td>
                                            <td><c:out value="${units.status}"></c:out></td>
                                            <c:if test="${units.status == 'pending'}">
                                                <td><a href="PayBillController?id=${units.meterNumber}&dt=${units.readingDate}">Pay Bill</a></td>
                                            </c:if>

                                            <c:if test="${units.status == 'paid'}">
                                                <td></td>
                                            </c:if>
                                        </tr>
                                    </c:forEach>
                                </table>
                                <p align ="center"><a href="user.jsp">Back</a></p>
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
               
                <a href="">Contact</a>
            </p>

            <p align="center">&copy;&nbsp;2013 <a href="">Your Company</a><br />
                <!-- Do you want to remove this backlinks? Look at www.nuviotemplates.com/payment.php -->
                <span id="copy"><a href="http://www.nuviotemplates.com/">Free web templates</a> by <a href="http://www.qartin.cz/">Qartin</a><br /><span class="smaller">Visit <a href="http://www.southpadre.net/" title="South Padre Island">South Padre Island</a></span></span></p>
            <!-- Do you want to remove this backlinks? Look at www.nuviotemplates.com/payment.php -->

        </div> <!-- /footer -->



    </body>
</html>
