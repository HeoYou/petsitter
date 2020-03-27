package kr.ac.bu.store;

import org.springframework.web.multipart.MultipartFile;

import kr.ac.bu.domain.Petsitter;
import kr.ac.bu.domain.User;
import kr.ac.bu.domain.User2;

public interface UserStore {

   int join (User user);
   User login (User user);
   int sitterJoin(Petsitter ps);
   int psPictureUpload(MultipartFile picture, String uId);
   void DeleteUser(String uId);
   void update(User user);
   User findUser(String uId);
   User EditUser(User user, String uId);
   int sitterModify(Petsitter ps);
   Petsitter selectSitter(String uId);
   int checkId(String uId);
   void deleteImages(String uId);
   User read(String uId);
   User2 userInfo(String uId);

}