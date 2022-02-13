package com.two.bicyclePrj;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class ApplicationLoaderListener
 *
 */
@WebListener
public class ApplicationLoaderListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public ApplicationLoaderListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
    	try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 클래스 로드됨");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 클래스가 없습니다.");
		}
    }
	
}
