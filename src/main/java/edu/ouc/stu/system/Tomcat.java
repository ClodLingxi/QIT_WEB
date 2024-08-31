package edu.ouc.stu.system;

import edu.ouc.stu.mapper.TbCompanyMapper;
import edu.ouc.stu.mapper.TbJobMapper;
import edu.ouc.stu.mapper.TbResumeMapper;
import edu.ouc.stu.mapper.TbUsersMapper;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import lombok.SneakyThrows;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;

@WebListener
public class Tomcat implements ServletContextListener {

    public static SqlSession sqlSession;

    public static TbUsersMapper userManager;
    public static TbJobMapper jobMapper;
    public static TbCompanyMapper companyMapper;
    public static TbResumeMapper resumeMapper;

    @SneakyThrows
    public void contextInitialized(ServletContextEvent sce) {
        InputStream config = Resources.getResourceAsStream("mybatis-config.xml");
        SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(config);
        sqlSession = ssf.openSession();

        userManager = sqlSession.getMapper(TbUsersMapper.class);
        jobMapper = sqlSession.getMapper(TbJobMapper.class);
        companyMapper = sqlSession.getMapper(TbCompanyMapper.class);
        resumeMapper = sqlSession.getMapper(TbResumeMapper.class);
    }

    public void contextDestroyed(ServletContextEvent sce) {
        sqlSession.close();
    }
}
