package edu.ouc.stu.servlet;

import edu.ouc.stu.model.TbResume;
import edu.ouc.stu.model.TbUsers;
import edu.ouc.stu.system.Tomcat;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.util.UUID;

@MultipartConfig
@WebServlet("/ResumeClient")
public class ResumeClient extends HttpServlet {

    private static final String VIEW_RESUME_PATH = "/client/applicant/resume.jsp";
    private static final String EDIT_RESUME_PATH = "/client/applicant/resumeBasicinfoUpdate.jsp";

    private static void failAction(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        req.getRequestDispatcher(EDIT_RESUME_PATH).forward(req, resp);
    }

    private static void successAction(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        req.getRequestDispatcher(VIEW_RESUME_PATH).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        if (type != null) {
            TbUsers passport = (TbUsers) req.getSession().getAttribute("passport");
            Integer userId = (Integer) Tomcat.userManager.validate(passport);
            if(userId != null && passport.getUserRole() == 3){
                switch (type) {
                    case "queryResume" -> {
                        TbResume tbResume = Tomcat.resumeMapper.selectByUserId(userId);
                        if (tbResume != null && !tbResume.getResumeName().isEmpty()) {
                            req.getSession().setAttribute("resume", tbResume);
                            successAction(req, resp);
                        }
                        else {
                            tbResume = new TbResume();
                            tbResume.setResumeUserId(userId);

                            Tomcat.resumeMapper.insert(tbResume);

                            tbResume = Tomcat.resumeMapper.selectByUserId(userId);
                            req.getSession().setAttribute("resume", tbResume);

                            failAction(req, resp);
                        }
                    }
                    case "updateResume" -> {
                        TbResume tbResume = TbResume.getInstance(req);
                        Integer resume_id = Tomcat.resumeMapper.selectByUserId(userId).getResumeId();
                        if (tbResume != null){
                            tbResume.setResumeId(resume_id);
                            tbResume.setResumeUserId(userId);
                            if (Tomcat.resumeMapper.updateByPrimaryKey(tbResume) > 0) {
                                req.getSession().setAttribute("resume", tbResume);
                                successAction(req, resp);
                                break;
                            }
                            failAction(req, resp);
                            break;
                        }
                        failAction(req, resp);
                    }
                    case "uploadPicture" -> {

                        Part resumePicture = req.getPart("resumePicture");
                        String oldFileName = resumePicture.getSubmittedFileName();
                        String realPath = req.getSession().getServletContext().getRealPath("/");
                        String fiLeType = oldFileName.substring(oldFileName.lastIndexOf("."));
                        String uuid = UUID.randomUUID().toString();
                        String newFileName = uuid + fiLeType;
                        resumePicture.write(realPath + "/upload/images/resumes/" + newFileName);

                        TbResume tbResume = Tomcat.resumeMapper.selectByUserId(userId);
                        tbResume.setResumePicture(newFileName);

                        if (Tomcat.resumeMapper.updateByPrimaryKey(tbResume) > 0) {
                            successAction(req, resp);
                        }
                        else {
                            failAction(req, resp);
                        }

                    }
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
