package edu.ouc.stu.system;

import edu.ouc.stu.mapper.TbCompanyMapper;
import edu.ouc.stu.mapper.TbJobMapper;
import edu.ouc.stu.mapper.TbResumeMapper;
import edu.ouc.stu.mapper.TbUsersMapper;
import edu.ouc.stu.model.TbUsers;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpServletRequest;
import lombok.SneakyThrows;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;
import java.text.SimpleDateFormat;

@WebListener
public class Tomcat implements ServletContextListener {

    public static SqlSession sqlSession;
    public static TbUsersMapper userManager;
    public static TbJobMapper jobMapper;
    public static TbCompanyMapper companyMapper;
    public static TbResumeMapper resumeMapper;

    public static final SimpleDateFormat dataFormatter = new SimpleDateFormat("yyyy年 MM月 dd日");

    @SneakyThrows
    public void contextInitialized(ServletContextEvent sce) {
        InputStream config = Resources.getResourceAsStream("mybatis-config.xml");
        SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(config);
        sqlSession = ssf.openSession(true);

        userManager = sqlSession.getMapper(TbUsersMapper.class);
        jobMapper = sqlSession.getMapper(TbJobMapper.class);
        companyMapper = sqlSession.getMapper(TbCompanyMapper.class);
        resumeMapper = sqlSession.getMapper(TbResumeMapper.class);
    }

    public void contextDestroyed(ServletContextEvent sce) {
        sqlSession.close();
    }
}
