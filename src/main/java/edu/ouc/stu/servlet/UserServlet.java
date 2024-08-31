package edu.ouc.stu.servlet;

import edu.ouc.stu.mapper.TbUsersMapper;
import edu.ouc.stu.model.TbUsers;
import edu.ouc.stu.system.Tomcat;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {


    private static final String CLIENT_PATH = "/client/index.jsp";
    private static final String ADMIN_PATH = "/admin/manage/main.html";

    private static final TbUsersMapper userManager =
            Tomcat.sqlSession.getMapper(TbUsersMapper.class);

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

    private static void failAction(String message, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.getSession().setAttribute("msg", message);
        resp.sendRedirect(req.getHeader("referer"));
    }

    private static void successAction(TbUsers passport, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.getSession().setAttribute("passport", passport);
        System.out.println(passport.getUserRole());
        System.out.println(TbUsers.Role.admin.ordinal());
        if (passport.getUserRole() == TbUsers.Role.admin.ordinal()) {
            resp.sendRedirect(ADMIN_PATH);
        } else {
            resp.sendRedirect(CLIENT_PATH);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String username = req.getParameter("userLogname");
        String password = req.getParameter("userPwd");
        String role = req.getParameter("role");

        TbUsers passport = TbUsers.getInstance(username, password, role);
        if (passport != null) {
            Object id = userManager.validate(passport);
            if (id != null){
                if (userManager.isEnable((Integer) id) != 0){
                    successAction(passport, req, resp);
                } else failAction("用户被禁用", req, resp);
            } else failAction("登录失败", req, resp);
        } else failAction("空数据", req, resp);
    }

}
