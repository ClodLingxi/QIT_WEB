package edu.ouc.stu.servlet;

import edu.ouc.stu.model.TbUsers;
import edu.ouc.stu.system.Tomcat;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@WebServlet("/UserManage")
public class UserManage extends HttpServlet {

    private static void failAction(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect(req.getHeader("referer"));
    }

    private static void successAction(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect("/admin/manage/userList.jsp");
    }

    private static void method(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String type = req.getParameter("type");
        if (type != null) {
            TbUsers passport = (TbUsers) req.getSession().getAttribute("passport");
            if(Tomcat.userManager.validate(passport) != null){
                switch (type) {
                    case "addUser" -> {
                        TbUsers user = TbUsers.getInstance(req);
                        if(user != null){
                            if (Tomcat.userManager.insert(user) > 0){
                                successAction(req, resp);
                                return;
                            }
                        }
                    }
                    case "updateUser" -> {
                        if (req.getParameter("id") != null) {
                            int id = Integer.parseInt(req.getParameter("id"));
                            TbUsers user = TbUsers.getInstance(req, id);
                            if(user != null){
                                if(Tomcat.userManager.updateByPrimaryKey(user) > 0){
                                    successAction(req, resp);
                                    return;
                                }
                            }
                        }
                    }
                    case "deleteUser" -> {
                        if (req.getParameter("id") != null) {
                            int id = Integer.parseInt(req.getParameter("id"));
                            if(Tomcat.userManager.deleteByPrimaryKey(id) > 0){
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
