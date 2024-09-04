package edu.ouc.stu.model;

import jakarta.servlet.http.HttpServletRequest;
import lombok.*;

@Setter
@Getter
@ToString
@AllArgsConstructor

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
        this.userRealname = "";
        this.userEmail = "";
        this.userState = 1;
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

    public static TbUsers getInstance(HttpServletRequest req, int userId) {
        TbUsers tbUsers = getInstance(req);
        if (tbUsers != null) {
            tbUsers.setUserId(userId);
        }
        return tbUsers;
    }

    public static TbUsers getInstance(HttpServletRequest req) {
        String userName = req.getParameter("userLogname");
        String userPwd = req.getParameter("userPwd");
        String userRealname = req.getParameter("userRealname");
        String userEmail = req.getParameter("userEmail");
        String userRole = req.getParameter("userRole");
        String userState = req.getParameter("userState");
        if (userName != null && userPwd != null && userRealname != null && userEmail != null
                && userRole != null && userState != null) {
            return new TbUsers(-1, userName, userPwd, userRealname, userEmail, Integer.parseInt(userRole), Integer.parseInt(userState));
        } return null;
    }

}