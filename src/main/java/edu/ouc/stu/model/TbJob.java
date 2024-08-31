package edu.ouc.stu.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class TbJob {
    private Integer jobId;

    private Integer companyId;

    private String jobName;

    private Integer jobHiringnum;

    private String jobSalary;

    private String jobArea;

    private String jobDesc;

    private Date jobEndtime;

    private Integer jobState;

}