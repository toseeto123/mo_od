package kr.co.mood.user.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mood.module.ModuleVO;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	private SqlSession session;
	
	
	public List<UserVO> findEmail(String email) {
		return mybatis.selectList("UserDAO.findEmail", email);
	}
	
	public List<UserVO> selectAll(ModuleVO vo) {//추가된 부분
		return mybatis.selectList("UserDAO.selectAll", vo);
	}
	
	public UserVO selectIdCheck(String id) {
		return mybatis.selectOne("UserDAO.selectIdCheck", id);
	}
	
	public UserVO selectMemberNo(int no) {
		return mybatis.selectOne("UserDAO.selectMemberNo", no);
	}
	
	public void insert(UserVO vo) {
		mybatis.insert("UserDAO.insert", vo);
		System.out.println(vo);
		
	}
	
	public void googleInsert(UserVO vo) {
		mybatis.insert("UserDAO.googleInsert", vo);
	}
	

	public UserVO selectId(UserVO vo) {
		return mybatis.selectOne("UserDAO.selectId",vo);
		
	}
	
	public int idChk(UserVO vo) throws Exception{
		int result = mybatis.selectOne("UserDAO.idChk", vo);
		return result;
	}
	
	public int myinfo_email(UserVO vo) throws Exception{
		int result = mybatis.selectOne("UserDAO.myinfo_email", vo);
		return result;
	}
	
	public int idChk1(UserVO vo) throws Exception{
		int result1 = mybatis.selectOne("UserDAO.idChk", vo);
		return result1;
	}
	
	public void delete(String id) throws Exception{
		mybatis.delete("UserDAO.delete", id);
		System.out.println(id);
	}


	public void update(UserVO vo) {
		mybatis.update("UserDAO.update", vo);
		System.out.println("update"+vo);
		
	}
	
	public void password(UserVO vo) {
		mybatis.update("UserDAO.password", vo);
		System.out.println("password"+vo);
		
	}
	
	public void updatePwd(UserVO vo) {
		mybatis.update("UserDAO.updatePwd", vo);
	}
	
	public void updateAdminMember(UserVO vo) {
		mybatis.update("UserDAO.updateAdminMember", vo);
	}

	public void insertnaver(UserVO naver) {
		mybatis.insert("UserDAO.insertnaver", naver);
		System.out.println(naver);
		
	}
	
	// 카카오 정보 저장
			public void kakaoinsert(HashMap<String, Object> userInfo) {
				mybatis.insert("UserDAO.kakaoInsert",userInfo);
			}
			public UserVO findkakao(HashMap<String, Object> userInfo) {
				return mybatis.selectOne("UserDAO.findKakao", userInfo);
			}
			

		// 네이버 정보 저장
			public UserVO findNaver(HashMap<String, Object> naverUserInfo) {
				return mybatis.selectOne("UserDAO.findNaver", naverUserInfo);
			}
			public void NaverInsert(HashMap<String, Object> naverUserInfo) {
				mybatis.insert("UserDAO.NaverInsert",naverUserInfo);
			}

			

			

}
