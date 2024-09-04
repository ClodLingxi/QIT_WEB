package edu.ouc.stu.model;

import java.sql.Date;

import jakarta.servlet.http.HttpServletRequest;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class TbJob {
    private Integer jobId;

    private String jobName;

    private Integer companyId;

    private Integer jobHiringnum;

    private Integer jobApplicantnum;

    private Date jobEnddate;

    private Byte jobState;

    private String companyName;

    public static TbJob getInstance(HttpServletRequest req, int userId) {
        TbJob tbJob = getInstance(req);
        if (tbJob != null) {
            tbJob.setJobId(userId);
        }
        return tbJob;
    }

    public static TbJob getInstance(HttpServletRequest req) {

//        if (userName != null && userPwd != null && userRealname != null && userEmail != null
//                && userRole != null && userState != null) {
//            return new TbJob(-1, userName, userPwd, userRealname, userEmail, Integer.parseInt(userRole), Integer.parseInt(userState));
//        } return null;
        return null;
    }
}