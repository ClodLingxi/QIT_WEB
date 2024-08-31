package edu.ouc.stu.model;

import lombok.Data;

@Data
public class TbUsers {
    public enum Role{
        none,
        admin,
        company,
        user,
        ;

        @Override
        public String toString() {
            if (this.equals(admin)) return "系统管理员";
            else if (this.equals(company)) return "企业管理员";
            else if (this.equals(user)) return "普通用户";
            return name();
        }
    }

    private Integer userId;

    private String userName;

    private String userPwd;

    private String userRealname;

    private String userEmail;

    private Integer userRole;

    private Integer userState;

    private TbUsers(String userName, String userPwd, int role){
        this.userName = userName;
        this.userPwd = userPwd;
        this.userRole = role;
    }

    public static TbUsers getInstance(String userName, String userPwd, String role) {
        if (userName != null && userPwd != null && role != null) {
            try {
                Role ROLE = Role.valueOf(role);
                return new TbUsers(userName, userPwd, ROLE.ordinal());
            } catch (Exception e) {
                return new TbUsers(userName, userPwd, Role.user.ordinal());
            }
        }
        return null;
    }
}