package kr.ac.bu.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.bu.domain.Petsitter;
import kr.ac.bu.domain.User;
import kr.ac.bu.domain.User2;
import kr.ac.bu.service.UserService;
import kr.ac.bu.store.UserStore;

@Service
public class UserServiceLogic implements UserService {

	@Autowired
	private UserStore userStore;

	@Override
	public int join(User user) {

		return userStore.join(user);
	}

	@Override
	public int checkId(String uId) {

		return userStore.checkId(uId);
	}

	@Override
	public User EditUser(User user, String uId) {
		return userStore.EditUser(user, uId);

	}

	@Override
	public int sitterJoin(Petsitter ps, List<MultipartFile> pictures) {
		userStore.sitterJoin(ps);
		if (pictures.size() > 0) {
			for (int i = 0; i < pictures.size(); i++) {
				userStore.psPictureUpload(pictures.get(i), ps.getuId());
			}
		}
		return 0;
	}

	@Override
	public void DeleteUser(String uId) {
		userStore.DeleteUser(uId);

	}

	@Override
	public User login(User user) {

		return userStore.login(user);
	}

	@Override
	public User findUser(String uId) {
		return userStore.findUser(uId);
	}

	@Override
	public void modifyUser(User user) {
		userStore.update(user);

	}

	@Override
	public Petsitter selectSitter(String uId) {

		return userStore.selectSitter(uId);
	}

	@Override
	public int sitterModify(Petsitter ps, List<MultipartFile> pictures) {

		userStore.sitterModify(ps);

		System.out.println(pictures.size());

		if (pictures.size() > 0) {
			userStore.deleteImages(ps.getuId());
			for (int i = 0; i < pictures.size(); i++) {
				userStore.psPictureUpload(pictures.get(i), ps.getuId());
			}
		}

		return 0;

	}

	@Override
	public User find(String uId) {
		// TODO Auto-generated method stub
		return userStore.read(uId);
	}

	@Override
	public User2 userInfo(String uId) {
		
		return userStore.userInfo(uId);
	}

}