package edu.ouc.stu.servlet;

import edu.ouc.stu.model.TbCompany;
import edu.ouc.stu.model.TbJob;
import edu.ouc.stu.model.TbUsers;
import edu.ouc.stu.system.Tomcat;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@MultipartConfig
@WebServlet("/CompanyManage")
public class CompanyManage extends HttpServlet {

    private static void failAction(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect(req.getHeader("referer"));
    }

    private static void successAction(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect("/admin/manage/companyList.jsp");
    }

    private static void method(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String type = req.getParameter("type");
        if (type != null) {
            TbUsers passport = (TbUsers) req.getSession().getAttribute("passport");
            if(Tomcat.userManager.validate(passport) != null){
                switch (type) {
                    case "addCompany" -> {
                        TbCompany company = TbCompany.getInstance(req);
                        if(company != null){
                            if (Tomcat.companyMapper.insert(company) > 0){
                                successAction(req, resp);
                                return;
                            }
                        }
                    }
                    case "updateCompany" -> {
                        if (req.getParameter("id") != null) {
                            int id = Integer.parseInt(req.getParameter("id"));
                            TbCompany company = TbCompany.getInstance(req, id);
                            if(company != null){
                                if(Tomcat.companyMapper.updateByPrimaryKey(company) > 0){
                                    successAction(req, resp);
                                    return;
                                }
                            }
                        }
                    }
                    case "deleteCompany" -> {
                        if (req.getParameter("id") != null) {
                            int id = Integer.parseInt(req.getParameter("id"));
                            if(Tomcat.companyMapper.deleteByPrimaryKey(id) > 0){
                                successAction(req, resp);
                                return;
                            }
                        }
                    }
                }
            }
        }
        failAction(req, resp);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        method(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        method(req, resp);
    }
}
