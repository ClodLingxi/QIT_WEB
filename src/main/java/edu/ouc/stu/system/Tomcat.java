package edu.ouc.stu.system;

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

    @SneakyThrows
    public void contextInitialized(ServletContextEvent sce) {
        InputStream config = Resources.getResourceAsStream("mybatis-config.xml");
        SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(config);
        sqlSession = ssf.openSession();
    }

    public void contextDestroyed(ServletContextEvent sce) {
        sqlSession.close();
    }
}
