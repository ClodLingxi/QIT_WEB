package edu.ouc.stu.servlet;

import edu.ouc.stu.model.TbResume;
import edu.ouc.stu.model.TbUsers;
import edu.ouc.stu.system.Tomcat;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet("/ResumeManage")
public class ResumeManage extends HttpServlet {

    private static void failAction(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect(req.getHeader("referer"));
    }

    private static void successAction(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect("/admin/manage/resumeList.jsp");
    }

    private static void method(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String type = req.getParameter("type");
        if (type != null) {
            TbUsers passport = (TbUsers) req.getSession().getAttribute("passport");
            if(Tomcat.userManager.validate(passport) != null && passport.getUserRole() == 1){
                switch (type) {
                    case "deleteResume" -> {
                        if (req.getParameter("id") != null) {
                            int id = Integer.parseInt(req.getParameter("id"));
                            if(Tomcat.resumeMapper.deleteByPrimaryKey(id) > 0){
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
