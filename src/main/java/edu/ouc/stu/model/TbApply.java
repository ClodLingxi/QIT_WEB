package edu.ouc.stu.model;

import jakarta.servlet.http.HttpServletRequest;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
@Builder

public class TbApply {
    private int applyId;
    private int applyUserId;
    private int applyJobId;
    private int applyState;
    private Date applyDate;
    private String applyCompanyName;
    private String applyJobName;
    private int applyCompanyId;

    public static TbApply getInstance(HttpServletRequest request) {
        TbUsers passport = (TbUsers) request.getSession().getAttribute("passport");
        String id = request.getParameter("id");
        TbApply tbApply = null;

        if (passport != null && id != null) {
            tbApply = new TbApply(
                    -1,
                    passport.getUserId(),
                    Integer.parseInt(id),
                    1,
                    new Date(),
                    "",
                    "",
                    1
                    );
        }

        return tbApply;
    }

}
