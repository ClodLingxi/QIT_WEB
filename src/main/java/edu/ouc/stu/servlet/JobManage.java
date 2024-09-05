package edu.ouc.stu.servlet;

import edu.ouc.stu.model.TbJob;
import edu.ouc.stu.model.TbUsers;
import edu.ouc.stu.system.Tomcat;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet("/JobManage")
public class JobManage extends HttpServlet {

    private static void failAction(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect(req.getHeader("referer"));
    }

    private static void successAction(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect("/admin/manage/jobList.jsp");
    }

    private static void method(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String type = req.getParameter("type");
        if (type != null) {
            TbUsers passport = (TbUsers) req.getSession().getAttribute("passport");
            if(Tomcat.userManager.validate(passport) != null && passport.getUserRole() == 1) {
                switch (type) {
                    case "addJob" -> {
                        TbJob user = TbJob.getInstance(req);
                        if(user != null){
                            if (Tomcat.jobMapper.insert(user) > 0){
                                successAction(req, resp);
                                return;
                            }
                        }
                    }
                    case "updateJob" -> {
                        if (req.getParameter("id") != null) {
                            int id = Integer.parseInt(req.getParameter("id"));
                            TbJob user = TbJob.getInstance(req);
                            if(user != null){
                                if(Tomcat.jobMapper.updateByPrimaryKey(user) > 0){
                                    successAction(req, resp);
                                    return;
                                }
                            }
                        }
                    }
                    case "deleteJob" -> {
                        if (req.getParameter("id") != null) {
                            int id = Integer.parseInt(req.getParameter("id"));
                            if(Tomcat.jobMapper.deleteByPrimaryKey(id) > 0){
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

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        method(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        method(req, resp);
    }
}
