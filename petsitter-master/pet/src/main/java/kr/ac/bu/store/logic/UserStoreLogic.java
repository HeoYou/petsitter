package kr.ac.bu.store.logic;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.bu.domain.PetSitterPictureUpload;
import kr.ac.bu.domain.Petsitter;
import kr.ac.bu.domain.User;
import kr.ac.bu.domain.User2;
import kr.ac.bu.store.UserStore;
import kr.ac.bu.store.factory.ConnectionFactory;
import kr.ac.bu.store.factory.JdbcUtils;

@Repository
public class UserStoreLogic implements UserStore {

	private static final String SAVE_PATH = "C:/Users/HeoYou/git/petsitter/pet/src/main/webapp/resources/upload/";
	private static final String PREFIX_URL = "/upload/";

	@Autowired
	SqlSession session;
	private String uId;

	private static final String namespace = "kr.ac.bu.mappers.user-mapper"; // user-mapper.xml�쓽 namespace媛�
	private static final String petsitternamespace = "kr.ac.bu.mappers.petsitter-mapper"; // user-mapper.xml�쓽
	// namespace媛�

	@Override
	public int join(User user) {

		User compareUser;
		compareUser = (User) session.selectOne(namespace + ".login", user);

		if (compareUser == null) {

			try {
				session.insert(namespace + ".join", user);
				return 1; // 가입이 완료되었을 때
			} catch (DataAccessException de) {
				System.out.println(de.getMessage());
				return 2; // 가입이 되지 않을경우
			}

		} else {
			return 0; // 이미 가입된 아이디가 있을경우
		}
	}

	@Override
	public int checkId(String uId) {


		return session.selectOne(namespace + ".checkid", uId);
	}

	@Override
	public User login(User user) {
		return (User) session.selectOne(namespace + ".login", user);
	}

	@Override
	public int sitterJoin(Petsitter ps) {

		session.insert(petsitternamespace + ".petsitterjoin", ps);

		return 0;
	}

	@Override
	public void DeleteUser(String uId) {

		String sql = "DELETE FROM USER WHERE uId = ?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = ConnectionFactory.createConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uId);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(conn, rs, pstmt);
		}

	}

	@Override
	public User findUser(String uId) {
		String sql = "SELECT uId, uName, uAddress, uPhone FROM user WHERE uId = ?";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		User user = null;

		try {
			conn = ConnectionFactory.createConnection();
			psmt = conn.prepareStatement(sql.toString());
			psmt.setString(1, uId);
			rs = psmt.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setUId(rs.getString(1));
				user.setUName(rs.getString(2));
				user.setUAddress(rs.getString(3));
				user.setUPhone(rs.getString(4));
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(rs, psmt, conn);
		}

		return user;

	}

	@Override
	public void update(User user) {

		Connection conn = null;
		PreparedStatement psmt = null;

		try {

			conn = ConnectionFactory.createConnection();

			psmt = conn.prepareStatement("UPDATE user SET uName = ?, uAddress = ?, uPhone = ? WHERE uId = ?");

			psmt.setString(1, user.getUName());
			psmt.setString(2, user.getUAddress());
			psmt.setString(3, user.getUPhone());
			psmt.setString(4, user.getUId());

			psmt.executeUpdate();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(psmt, conn);
		}
	}

	@Override
	public User EditUser(User user, String uId) {
		String sql = "UPDATE user SET uName = ?, uAddress = ?, uPhone = ? WHERE uId = ?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = ConnectionFactory.createConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUName());
			pstmt.setString(2, user.getUAddress());
			pstmt.setString(3, user.getUPhone());
			pstmt.setString(4, uId);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(conn, rs, pstmt);
		}

		return user;
	}

	@Override
	public Petsitter selectSitter(String uId) {

		return session.selectOne(namespace + ".petsitter", uId);

	}

	@Override
	public int sitterModify(Petsitter ps) {

		session.update(namespace + ".sittermodify", ps);

		return 0;
	}

	@Override
	public void deleteImages(String uId) {

		session.delete(namespace + ".deleteimage", uId);

	}

	@Override
	public int psPictureUpload(MultipartFile picture, String uId) {

		try {
			// 파일 정보
			String originFilename = picture.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			Long size = picture.getSize();

			// 서버에서 저장 할 파일 이름
			String saveFileName = genSaveFileName(extName);

			PetSitterPictureUpload psPictureUpload = new PetSitterPictureUpload(saveFileName, uId);

			System.out.println("originFilename : " + originFilename);
			System.out.println("extensionName : " + extName);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + saveFileName);

			writeFile(picture, saveFileName);

			// 업로드된 파일의 이름을 데이터베이스에 저장시켜준다. 이미지테이블
			session.insert(petsitternamespace + ".petsitterpicture", psPictureUpload);

//         url = PREFIX_URL + saveFileName;
		} catch (IOException e) {
			System.out.println(e.toString());
			// throw new FileUploadException();
			throw new RuntimeException(e);
		}
		return 0;
	}

	// 업로드한 시간을 기준으로 파일이름을 재정의 해준다.
	private String genSaveFileName(String extName) {
		String fileName = "";

		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH) + 1;
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;

		return fileName;
	}

	// 파일의 데이터를 가지고와서 파일시스템에 저장한다.
	private boolean writeFile(MultipartFile picture, String saveFileName) throws IOException {
		boolean result = false;

		byte[] data = picture.getBytes();
		FileOutputStream fos = new FileOutputStream(SAVE_PATH + saveFileName);

		fos.write(data);
		fos.close();

		return result;

	}

	@Override
	public User read(String uId) {

		String sql = "SELECT uId, uPw, uName, uAddress, uPhone FROM user WHERE uId = ?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		User user = null;

		try {
			conn = ConnectionFactory.createConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uId);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				user = new User();
				user.setUId(rs.getString(1));
				user.setUPw(rs.getString(2));
				user.setUName(rs.getString(3));
				user.setUAddress(rs.getString(4));
				user.setUPhone(rs.getString(5));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(conn, rs, pstmt);
		}
		return user;
	}

	@Override
	public User2 userInfo(String uId) {
		
		return session.selectOne(namespace + ".userinfo", uId);
	}

}