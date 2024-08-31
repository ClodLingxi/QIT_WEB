package edu.ouc.stu.model;

import java.util.Date;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
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
}