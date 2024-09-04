package edu.ouc.stu.model;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.io.IOException;
import java.util.UUID;

@Setter
@Getter
@Builder
@MultipartConfig
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

    public static TbCompany getInstance(HttpServletRequest req, int companyId) throws ServletException, IOException {
        TbCompany tbCompany = getInstance(req);
        if (tbCompany != null) {
            tbCompany.setCompanyId(companyId);
        }
        return tbCompany;
    }

    public static TbCompany getInstance(HttpServletRequest req) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        String companyName = req.getParameter("companyName");
        String companyArea = req.getParameter("companyArea");
        String companySize = req.getParameter("companySize");
        String companyType = req.getParameter("companyType");
        String companyBrief = req.getParameter("companyBrief");
        String companyState = req.getParameter("companyState");
        String companySort = req.getParameter("companySort");
        String companyViewNum = req.getParameter("companyViewnum");

        Part companyPic = req.getPart("companyPic");
        String oldFileName = companyPic.getSubmittedFileName();
        String realPath = req.getSession().getServletContext().getRealPath("/");
        String fiLeType = oldFileName.substring(oldFileName.lastIndexOf("."));
        String uuid = UUID.randomUUID().toString();
        String newFileName = uuid + fiLeType;

        companyPic.write(realPath + "/upload/images/" + newFileName);

        if (companyName != null && companyArea != null && companySize != null &&
                companyType != null && companyBrief != null && companyState != null && companySort != null) {
            return new TbCompany(-1, companyName, companyArea, companySize, companyType, companyBrief,
                    Integer.parseInt(companyState), Integer.parseInt(companySort), companyViewNum, newFileName);
        }

        return null;
    }
}