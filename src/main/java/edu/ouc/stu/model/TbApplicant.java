package edu.ouc.stu.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class TbApplicant {
    private Integer applicantId;

    private String applicantEmail;

    private String applicantPwd;

    private Date applicantRegistdate;

}