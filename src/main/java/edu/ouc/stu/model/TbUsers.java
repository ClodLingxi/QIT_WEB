package edu.ouc.stu.model;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class TbUsers {
    private Integer userId;

    private String userLogname;

    private String userPwd;

    private String userRealname;

    private String userEmail;

    private Integer userRole;

    private Integer userState;

}