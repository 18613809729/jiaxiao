package com.nbs;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.serializer.SerializeConfig;
import com.alibaba.fastjson.serializer.SimpleDateFormatSerializer;
import com.nbs.jiaoxiao.domain.po.UserInfo;
import com.nbs.jiaoxiao.mapper.UserInfoMapper;

public class Test {
	private static final Logger LOGGER = LoggerFactory.getLogger(Test.class);
	
	 private static SerializeConfig mapping = new SerializeConfig();    
	    static {   
	    	mapping.put(Date.class, new SimpleDateFormatSerializer("yyyy-MM-dd HH:mm:ss"));    
	    }   
	
	public static void update1(SqlSessionFactory factor) throws InterruptedException {
		SqlSession sqlSession =  factor.openSession(false);
		UserInfo userInfo1 = sqlSession.selectOne("com.nbs.loan.mapper.UserInfoMapper.selectByPriKey", 1L);
		userInfo1.setCustName("张三丰二");
		sqlSession.update("com.nbs.loan.mapper.UserInfoMapper.updateByPriKey", userInfo1);
		
		UserInfo userInfo2 = sqlSession.selectOne("com.nbs.loan.mapper.UserInfoMapper.selectByPriKey", 2L);
		userInfo2.setCustName("张三丰二");
		sqlSession.update("com.nbs.loan.mapper.UserInfoMapper.updateByPriKey", userInfo2);
		Thread.sleep(10000);
		UserInfo userInfo4 = sqlSession.selectOne("com.nbs.loan.mapper.UserInfoMapper.selectByPriKey", 4L);
		userInfo4.setCustName("张三丰二");
		sqlSession.update("com.nbs.loan.mapper.UserInfoMapper.updateByPriKey", userInfo4);
	} 
	
	public static void update2(SqlSessionFactory factor) throws InterruptedException {
		SqlSession sqlSession =  factor.openSession(false);
		UserInfo userInfo4 = sqlSession.selectOne("com.nbs.loan.mapper.UserInfoMapper.selectByPriKey", 4L);
		userInfo4.setCustName("张三丰二");
		sqlSession.update("com.nbs.loan.mapper.UserInfoMapper.updateByPriKey", userInfo4);
		Thread.sleep(10000);
		UserInfo userInfo2 = sqlSession.selectOne("com.nbs.loan.mapper.UserInfoMapper.selectByPriKey", 2L);
		userInfo2.setCustName("张三丰二");
		sqlSession.update("com.nbs.loan.mapper.UserInfoMapper.updateByPriKey", userInfo2);
	} 
	
	public static void main(String[] args) throws IOException, InterruptedException {
		String resource = "config/mybatis-config.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		SqlSessionFactory factory = builder.build(inputStream);
		SqlSession sqlSession =  factory.openSession(false);
		UserInfoMapper userInfoMapper = sqlSession.getMapper(UserInfoMapper.class);
		
		UserInfo userInfo = new UserInfo();
		userInfo.setCustName("张三丰");
		System.out.println(userInfoMapper.selectList(userInfo, new RowBounds(0, 1)));
		
		/*UserInfo userInfo = new UserInfo();
		userInfo.setPin("ceshi6");
		userInfo.setCustName("张三丰");
		userInfo.setMobile("18613809729");
		userInfo.setEmail("296389201");
		userInfo.setSalt("123456");
		userInfo.setPwd("12345");
		userInfo.setStatus(1);
		userInfo.setRemark("初始创建");
		userInfo.setLastUpdateNoUserId("admin");*/
	//	System.out.println(userInfoMapper.insert(userInfo));
		//System.out.println(userInfo);
		///System.out.println(userInfoMapper.deleteByPriKey(1));
		//System.out.println(userInfoMapper.delete(userInfo));
		//System.out.println(userInfoMapper.deleteActualByPriKey(1));
		//System.out.println(userInfoMapper.deleteActual(userInfo));
	//	UserInfo userInfo1 = userInfoMapper.selectByPriKey(4);
	//	System.out.println(JSON.toJSONString(userInfo1, mapping));
		//userInfo1.setCustName("米歇尔");
	//	System.out.println(userInfoMapper.updateByPriKey(userInfo1));
		
		//UserInfo con = new UserInfo();
		//con.setCustName("张三");
		//System.out.println(userInfoMapper.exist(con));
		
	//	con.getParam().appointLastUpdateNoEnd(5);
	//	con.getParam().appointCreatedTimeEnd(new Date());
		//con.getParam().appointColumnSort("id desc, cust_name");
	//	System.out.println(JSON.toJSON(userInfoMapper.selectList(con)));
		
		//System.out.println(JSON.toJSON(userInfoMapper.selectCount(con)));
		
		//System.out.println(userInfoMapper.clean(0));
		
		//System.out.println(userInfoMapper.deleteActual(new UserInfo()));
		
	}
}
