/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.web.controller;

import com.gsm.domain.sub.AppUser;
import com.gsm.service.AppUserService;
import com.gsm.service.utils.DomainServiceUtils;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class AuthenticateFilter implements Filter {

    private static final boolean debug = false;
    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;

    public AuthenticateFilter() {
    }

    public AppUser checkCookie(HttpServletRequest request, HttpServletResponse response) {

        AppUser appUser = null;

        try {
            Cookie[] cookies = request.getCookies();


            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {
                    Cookie c = cookies[i];

                    if (c.getName().equals("cName")) {
                        String guid = c.getValue();
                        AppUserService appUserService = DomainServiceUtils.getAppUserService();
                        appUser = appUserService.findByGuid(guid);

                    }
                }
            }

        } catch (Exception exception) {
            exception.printStackTrace();
        }


        return appUser;

    }

    @Override
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        String reqURI = request.getRequestURI();
        String contextPath = request.getContextPath();

        if (reqURI.equals("/GSMApp/")) {

            AppUser user = checkCookie(request, response);

            if (user == null) {
                response.sendRedirect("home.jsp");
                return;
            }
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            RequestDispatcher dispatcher = request.getRequestDispatcher(reqURI);
            dispatcher.forward(request, response);


        }


        if (reqURI.equals(request.getContextPath() + "/changePassword.jsp")) {

            AppUser user = (AppUser) request.getSession().getAttribute("user");

            if (user == null) {
                request.setAttribute("403", "U R Not Authorized to View this Page, Please Login");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
                dispatcher.forward(request, response);
                return;
            }

        }

        if (reqURI.equals(request.getContextPath() + "/admin.jsp")) {

            AppUser user = (AppUser) request.getSession().getAttribute("user");

            if (user == null) {
                request.setAttribute("403", "U R Not Authorized to View this Page, Please Login");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
                dispatcher.forward(request, response);
                return;
            }

        }

        if (reqURI.equals(request.getContextPath() + "/setQuestion.jsp")) {

            AppUser user = (AppUser) request.getSession().getAttribute("user");

            if (user == null) {
                request.setAttribute("403", "U R Not Authorized to View this Page, Please Login");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
                dispatcher.forward(request, response);
                return;
            }

        }

        if (reqURI.equals(request.getContextPath() + "/viewUsers.jsp")) {

            AppUser user = (AppUser) request.getSession().getAttribute("user");

            if (user == null) {
                request.setAttribute("403", "U R Not Authorized to View this Page, Please Login");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
                dispatcher.forward(request, response);
                return;
            }

        }

        if (reqURI.equals(request.getContextPath() + "/bill.jsp")) {

            AppUser user = (AppUser) request.getSession().getAttribute("user");

            if (user == null) {
                request.setAttribute("403", "U R Not Authorized to View this Page, Please Login");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
                dispatcher.forward(request, response);
                return;
            }

        }

        if (reqURI.equals(request.getContextPath() + "/billPayments.jsp")) {

            AppUser user = (AppUser) request.getSession().getAttribute("user");

            if (user == null) {
                request.setAttribute("403", "U R Not Authorized to View this Page, Please Login");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
                dispatcher.forward(request, response);
                return;
            }

        }

        if (reqURI.equals(request.getContextPath() + "/billReport.jsp")) {

            AppUser user = (AppUser) request.getSession().getAttribute("user");

            if (user == null) {
                request.setAttribute("403", "U R Not Authorized to View this Page, Please Login");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
                dispatcher.forward(request, response);
                return;
            }

        }

        if (reqURI.equals(request.getContextPath() + "/clientBill.jsp")) {

            AppUser user = (AppUser) request.getSession().getAttribute("user");

            if (user == null) {
                request.setAttribute("403", "U R Not Authorized to View this Page, Please Login");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
                dispatcher.forward(request, response);
                return;
            }

        }

        if (reqURI.equals(request.getContextPath() + "/createOperator.jsp")) {

            AppUser user = (AppUser) request.getSession().getAttribute("user");

            if (user == null) {
                request.setAttribute("403", "U R Not Authorized to View this Page, Please Login");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
                dispatcher.forward(request, response);
                return;
            }

        }

        if (reqURI.equals(request.getContextPath() + "/createUser.jsp")) {

            AppUser user = (AppUser) request.getSession().getAttribute("user");

            if (user == null) {
                request.setAttribute("403", "U R Not Authorized to View this Page, Please Login");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
                dispatcher.forward(request, response);
                return;
            }

        }

        if (reqURI.equals(request.getContextPath() + "/header.jsp")) {

            AppUser user = (AppUser) request.getSession().getAttribute("user");

            if (user == null) {
                request.setAttribute("403", "U R Not Authorized to View this Page, Please Login");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
                dispatcher.forward(request, response);
                return;
            }

        }

        if (reqURI.equals(request.getContextPath() + "/operator.jsp")) {

            AppUser user = (AppUser) request.getSession().getAttribute("user");

            if (user == null) {
                request.setAttribute("403", "U R Not Authorized to View this Page, Please Login");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
                dispatcher.forward(request, response);
                return;
            }

        }

        if (reqURI.equals(request.getContextPath() + "/paidBill.jsp")) {

            AppUser user = (AppUser) request.getSession().getAttribute("user");

            if (user == null) {
                request.setAttribute("403", "U R Not Authorized to View this Page, Please Login");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
                dispatcher.forward(request, response);
                return;
            }

        }

        if (reqURI.equals(request.getContextPath() + "/user.jsp")) {

            AppUser user = (AppUser) request.getSession().getAttribute("user");

            if (user == null) {
                request.setAttribute("403", "U R Not Authorized to View this Page, Please Login");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
                dispatcher.forward(request, response);
                return;
            }

        }

        if (reqURI.equals(request.getContextPath() + "/viewClients.jsp")) {

            AppUser user = (AppUser) request.getSession().getAttribute("user");

            if (user == null) {
                request.setAttribute("403", "U R Not Authorized to View this Page, Please Login");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
                dispatcher.forward(request, response);
                return;
            }

        }

        if (reqURI.equals(request.getContextPath() + "/viewOperators.jsp")) {

            AppUser user = (AppUser) request.getSession().getAttribute("user");

            if (user == null) {
                request.setAttribute("403", "U R Not Authorized to View this Page, Please Login");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
                dispatcher.forward(request, response);
                return;
            }

        }

        chain.doFilter(req, res);

    }

    @Override
    public void destroy() {
    }
}
