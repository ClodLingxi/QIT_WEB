package edu.ouc.stu.servlet;

import edu.ouc.stu.model.TbApply;
import edu.ouc.stu.model.TbUsers;
import edu.ouc.stu.system.Tomcat;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/ApplicantManage")
public class ApplicantManage extends HttpServlet {
    private static final String SUCCESS_PATH = "/client/recruit/applysuccess.jsp";

    private static void returnAction(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect(req.getHeader("referer"));
    }

    private static void successAction(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect(SUCCESS_PATH);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String type = req.getParameter("type");
        if (type != null) {
            TbUsers passport = (TbUsers) req.getSession().getAttribute("passport");
            Integer userId = (Integer) Tomcat.userManager.validate(passport);
            if (passport != null && userId > 0) {
                switch (type) {
                    case "apply" -> {
                        TbApply tbApply = TbApply.getInstance(req);
                        if (tbApply != null) {
                            Tomcat.applyMapper.insert(tbApply);
                            successAction(req, resp);
                            return;
                        }
                        returnAction(req, resp);
                    }
                    case "deleteApply" -> {
                        String id = req.getParameter("id");
                        if (id != null) {
                            TbApply tbApply = Tomcat.applyMapper.selectByPrimaryKey(Integer.parseInt(id));
                            if (tbApply != null && tbApply.getApplyUserId() == userId) {
                                Tomcat.applyMapper.deleteByPrimaryKey(Integer.parseInt(id));
                            }
                            returnAction(req, resp);
                            return;
                        }
                        returnAction(req, resp);
                    }
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
