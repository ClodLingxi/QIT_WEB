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

    private String jobSalary;

    private String companyName;

    public static TbJob getInstance(HttpServletRequest req, int userId) {
        TbJob tbJob = getInstance(req);
        if (tbJob != null) {
            tbJob.setJobId(userId);
        }
        return tbJob;
    }

    public static TbJob getInstance(HttpServletRequest req) {
        return null;
    }
}