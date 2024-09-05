package edu.ouc.stu.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import edu.ouc.stu.system.Tomcat;
import jakarta.servlet.http.HttpServletRequest;
import lombok.*;

@Getter
@Setter

public class TbResume {
    private Integer resumeId;

    private String resumeName;

    private String resumePicture;

    private String resumeGender;

    private Date resumeBirthday;

    private String resumeLocation;

    private String resumeRegistration;

    private String resumePhone;

    private String resumeEmail;

    private String resumeTarget;

    private String resumeExperience;

    private Integer ResumeUserId;

    public TbResume(){
        this.resumeId = -1;
        this.resumeName = "";
        this.resumePicture = "";
        this.resumeGender = "";
        this.resumeBirthday = new Date();
        this.resumeLocation = "";
        this.resumeRegistration = "";
        this.resumePhone = "";
        this.resumeEmail = "";
        this.resumeTarget = "";
        this.resumeExperience = "";
        this.ResumeUserId = 0;
    }

    public static TbResume getInstance(HttpServletRequest request) {
        TbResume resume = new TbResume();

        // Parse and set each field from the request parameters
        resume.setResumeId(parseInteger(request.getParameter("resumeId")));
        resume.setResumeName(request.getParameter("resumeName"));
        resume.setResumePicture(request.getParameter("resumePicture"));
        resume.setResumeGender(request.getParameter("resumeGender"));

        String birthdayString = request.getParameter("resumeBirthday");
        if (birthdayString != null && !birthdayString.isEmpty()) {
            try {
                SimpleDateFormat sdf = Tomcat.dataFormatter;
                Date birthday = sdf.parse(birthdayString);
                resume.setResumeBirthday(birthday);
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
        if (resume.getResumeName() == null || resume.getResumeGender() == null || resume.getResumeBirthday() == null) {
            return null;
        }

        resume.setResumeLocation(request.getParameter("resumeLocation"));
        resume.setResumeRegistration(request.getParameter("resumeRegistration"));
        resume.setResumePhone(request.getParameter("resumePhone"));
        resume.setResumeEmail(request.getParameter("resumeEmail"));
        resume.setResumeTarget(request.getParameter("resumeTarget"));
        resume.setResumeExperience(request.getParameter("resumeExperience"));

        return resume;
    }

    private static Integer parseInteger(String value) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return null;
        }
    }



}