package kr.ac.bu.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.ac.bu.domain.Petsitter;
import kr.ac.bu.domain.User;
import kr.ac.bu.domain.User2;

public interface UserService {
   int join(User user);
   int sitterJoin(Petsitter ps, List<MultipartFile> picture);
   User login(User user);
   void DeleteUser(String uId);
   User find(String uId);
   User findUser(String uId);
   void modifyUser(User user);
   User EditUser(User user, String uId);
   int sitterModify(Petsitter ps, List<MultipartFile> picture);
   Petsitter selectSitter(String uId);
   int checkId(String uId);
   User2 userInfo(String uId);
}