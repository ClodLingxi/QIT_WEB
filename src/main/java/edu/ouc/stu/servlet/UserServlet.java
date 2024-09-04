package edu.ouc.stu.servlet;

import edu.ouc.stu.mapper.TbUsersMapper;
import edu.ouc.stu.model.TbUsers;
import edu.ouc.stu.system.Tomcat;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {


    private static final String CLIENT_PATH = "/client/index.jsp";
    private static final String ADMIN_PATH = "/admin/manage/main.jsp";

//    private static Boolean validateCode(HttpServletRequest req, HttpServletResponse resp){
//        String verifyCode = req.getParameter("verifyCode");
//        String verifyCodeValue = (String)req.getSession().getAttribute("verifyCodeValue");
//        HttpSession session = req.getSession();
//            if(!verifyCodeValue.equalsIgnoreCase(verifyCode)){
//                session.setAttribute("msg", "验证码错误");
//                resp.sendRedirect(LOGIN_PATH);
//                return;
//            }
//        return true;
//    }

    private static void exitAction(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String role = req.getParameter("role");
        if (role != null && role.equals("admin")) {
            resp.sendRedirect(req.getContextPath() + CLIENT_PATH);
        }
        else resp.sendRedirect(req.getContextPath() + "/client/login.jsp");
        req.getSession().invalidate();
    }

    private static void registerAction(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String role = req.getParameter("role");
        if (role != null && role.equals("user")) {
            String username = req.getParameter("userLogname");
            String password = req.getParameter("userPwd");
            TbUsers passport = TbUsers.getInstance(username, password, "user");
            Object id = Tomcat.userManager.validate(passport);
            if (id != null) {
                failAction("账号已存在", req, resp);
                return;
            }
            if(Tomcat.userManager.insert(passport) > 0){
                successAction(passport, req, resp);
                return;
            }
            failAction("添加账号失败", req, resp);
        }
    }

    private static void failAction(String message, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.getSession().setAttribute("msg", message);
        resp.sendRedirect(req.getHeader("referer"));
    }

    private static void successAction(TbUsers passport, HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        req.getSession().setAttribute("passport", passport);
        System.out.println(passport.getUserRole());
        System.out.println(TbUsers.Role.admin.ordinal());
        if (passport.getUserRole() == TbUsers.Role.admin.ordinal()) {
            resp.sendRedirect(ADMIN_PATH);
        } else {
            req.getRequestDispatcher(CLIENT_PATH).forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        String type = req.getParameter("type");
        if(type != null) {
            if(type.equals("exit")) {
                exitAction(req, resp);
                return;
            }
            else if(type.equals("register")) {
                registerAction(req, resp);
                return;
            }

        }

        String username = req.getParameter("userLogname");
        String password = req.getParameter("userPwd");
        String role = req.getParameter("role");

        TbUsers passport = TbUsers.getInstance(username, password, role);
        if (passport != null) {
            Object id = Tomcat.userManager.validate(passport);
            if (id != null){
                if (Tomcat.userManager.isEnable((Integer) id) != 0){
                    successAction(passport, req, resp);
                } else failAction("用户被禁用", req, resp);
            } else failAction("登录失败", req, resp);
        } else failAction("空数据", req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        this.doPost(req,resp);
    }
}
