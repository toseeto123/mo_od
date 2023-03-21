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
	
	public List<UserVO> selectAll(ModuleVO vo) {//추가된 부분
		return mybatis.selectList("UserDAO.selectAll", vo);
	}
	public UserVO selectMemberNo(int no) {
		return mybatis.selectOne("UserDAO.selectMemberNo", no);
	}
	
	public void insert(UserVO vo) {
		mybatis.insert("UserDAO.insert", vo);
		System.out.println(vo);
		
	}
	

	public UserVO selectId(UserVO vo) {
		return mybatis.selectOne("UserDAO.selectId",vo);
		
	}
	
	public int idChk(UserVO vo) throws Exception{
		int result = mybatis.selectOne("UserDAO.idChk", vo);
		return result;
	}
	
	public int idChk1(UserVO vo) throws Exception{
		int result1 = mybatis.selectOne("UserDAO.idChk", vo);
		return result1;
	}
	
	public void delete(UserVO vo) throws Exception{
		mybatis.delete("UserDAO.delete", vo);
		System.out.println(vo);
	}


	public void update(UserVO vo) {
		mybatis.delete("UserDAO.update", vo);
		System.out.println(vo);
		return;
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
//				System.out.println("RN:"+userInfo.get("nickname"));
//				System.out.println("RE:"+userInfo.get("email"));
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
