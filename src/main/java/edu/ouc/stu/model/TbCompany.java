package edu.ouc.stu.model;

import jakarta.servlet.http.HttpServletRequest;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Builder
public class TbCompany {
    private Integer companyId;

    private String companyName;

    private String companyArea;

    private String companySize;

    private String companyType;

    private String companyBrief;

    private Integer companyState;

    private Integer companySort;

    private String companyViewnum;

    private String companyPic;

    public static TbCompany getInstance(HttpServletRequest req, int companyId) {
        TbCompany tbCompany = getInstance(req);
        if (tbCompany != null) {
            tbCompany.setCompanyId(companyId);
        }
        return tbCompany;
    }

    public static TbCompany getInstance(HttpServletRequest req) {

//        if (userName != null && userPwd != null && userRealname != null && userEmail != null
//                && userRole != null && userState != null) {
//            return new TbJob(-1, userName, userPwd, userRealname, userEmail, Integer.parseInt(userRole), Integer.parseInt(userState));
//        } return null;
        return null;
    }
}