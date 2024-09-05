package edu.ouc.stu.servlet;

import edu.ouc.stu.model.TbUsers;
import edu.ouc.stu.system.Tomcat;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

@WebServlet("/UserManage")
public class UserManage extends HttpServlet {

    private static void failAction(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect(req.getHeader("referer"));
    }

    private static void successAction(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        req.getRequestDispatcher("/admin/manage/userList.jsp").forward(req, resp);
    }

    private static void method(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String type = req.getParameter("type");
        if (type != null) {
            TbUsers passport = (TbUsers) req.getSession().getAttribute("passport");
            if(Tomcat.userManager.validate(passport) != null && passport.getUserRole() == 1){
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
                    case "getUser" -> {
                        String role = req.getParameter("userRole");
                        String selectName = req.getParameter("userName");
                        String pageNum = req.getParameter("pageNum");
                        int num = 0;
                        if (pageNum != null){
                            num = (Integer.parseInt(pageNum) - 1) * 20;
                            req.setAttribute("pageNum", pageNum);
                        }
                        else req.setAttribute("pageNum", "1");

                        List<TbUsers> userList;
                        if (role == null){
                            userList = Tomcat.userManager.selectSomeUsers(num);
                        } else userList = Tomcat.userManager.selectSomeUsersByParam(num, role, selectName);

                        if (userList == null) userList = new LinkedList<>();

                        req.setAttribute("userList", userList);

                        Integer userCount = Tomcat.userManager.countAllUsers();
                        req.setAttribute("totalPage", (userCount / 20) + 1);
                        successAction(req, resp);
                        return;
                    }
                    case "getUserCount" -> {
                        Integer userCount = Tomcat.userManager.countAllUsers();
                        req.setAttribute("totalPage", (userCount / 20) + 1);
                        successAction(req, resp);
                        return;
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
