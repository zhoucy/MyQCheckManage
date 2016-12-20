package com.gangdian.qc.dao;

import java.util.List;






import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;



import com.gangdian.qc.model.QCUser;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@RunWith(SpringJUnit4ClassRunner.class) 
@ContextConfiguration(locations = {"classpath:spring-servlet.xml","classpath:sp-db.xml"})
public class UserDaoTest {
	
	@Autowired
	private QCUserDao mapper;
	

	
	@Test
	public void testPageHelper(){
		//创建spring容器
//		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:spring-config.xml");
//		String[] configLocations = {"classpath:spring-config.xml","classpath:spring-mvc-shiro.xml"};
//		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(configLocations);
//		//从spring容器中获取mapper对象
//		UserMapper mapper = applicationContext.getBean(UserMapper.class);
//		PasswordHelper password=applicationContext.getBean(PasswordHelper.class);
		QCUser example = new QCUser();
		//分页处理
		PageHelper.startPage(1, 10);
		
		QCUser user=new QCUser("chen", "123");
		
		System.out.print(user.getPassword());

		List<QCUser> list = mapper.listAllUser();
		//取出商品列表
		for (QCUser u : list) {
			System.out.println(u.getName());
				}
		//取出分页信息
		
//		System.out.println(mapper.findByUsername("admin"));
//		PageInfo<QCUser> pageInfo = new PageInfo<>(list);
//		long total = pageInfo.getTotal();
//		System.out.println("共有商品信息�?+total+");
	}

}
