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
    private static final String SUCCESS_PATH = "/client/recruit/applysuccess.jsp?companyName=%s&jobName=%s";

    private static void returnAction(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect(req.getHeader("referer"));
    }

    private static void successAction(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        req.getRequestDispatcher(SUCCESS_PATH).forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String type = req.getParameter("type");
        if (type != null) {
            TbUsers passport = (TbUsers) req.getSession().getAttribute("passport");
            Integer userId = (Integer) Tomcat.userManager.validate(passport);
            String applyId = req.getParameter("id");
            if (passport != null && userId > 0 && applyId != null) {
                passport.setUserId(userId);
                switch (type) {
                    case "addApply" -> {
                        TbApply tbApply = Tomcat.applyMapper.selectByUserIdAndJobId(userId, applyId);
                        if (tbApply == null) {
                            tbApply = TbApply.getInstance(req);
                            if (tbApply != null) {
                                Tomcat.applyMapper.insert(tbApply);
                                successAction(req, resp);
                                return;
                            }
                        }
                    }
                    case "deleteApply" -> {
                        TbApply tbApply = Tomcat.applyMapper.selectByPrimaryKey(Integer.parseInt(applyId));
                        if (tbApply != null && tbApply.getApplyUserId() == userId) {
                            Tomcat.applyMapper.deleteByPrimaryKey(Integer.parseInt(applyId));
                        }
                    }
                }
            }
            returnAction(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
