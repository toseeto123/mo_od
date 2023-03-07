package kr.co.mood.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public void insert(UserVO vo) {
		System.out.println("insert해따");
		
		mybatis.insert("UserDAO.insert", vo);
		
		System.out.println(vo);
		
	}
	

	public UserVO selectId(UserVO vo) {
		System.out.println("user 가져와따1");
		
//		Map<String, Object> param = new HashMap<String, Object>();
//		
//		param.put("id", result.getId());
//		param.put("pwd", result.getPwd());
//		param.put("name",result.getName());
//		param.put("age",result.getAge());
//		param.put("gender",result.getGender());
//		param.put("lev",result.getLev());
//		param.put("adr",result.getAdr());
//		param.put("email",result.getEmail());
//		param.put("phone",result.getPhone());
//		param.put("day",result.getDay());
//		
//		
//		System.out.println(param);
//		System.out.println(result);
		return mybatis.selectOne("UserDAO.selectId",vo);
		
	}

}
