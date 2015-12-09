package np.com.carpool.serviceimpl;

import java.util.List;

import np.com.carpool.domain.User;
import np.com.carpool.domain.User.Role;
import np.com.carpool.repository.UserRepository;
import np.com.carpool.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Override
	@Transactional
	public void add(User t) {
		// TODO Auto-generated method stub
		if(!t.getPassword().equals(t.getPwdRepeat())){
			throw new IllegalArgumentException("Password not matched.");
		}
		if(this.userRepository.findByUsername(t.getUsername()) != null){
			throw new IllegalArgumentException("User name already exist.");
		}
		BCryptPasswordEncoder b = new BCryptPasswordEncoder();
		t.setPassword(b.encode(t.getPassword()));
		t.setRole(Role.ROLE_ADMIN);
		t.setEnabled(true);
		System.out.println("before saving to db inside UserServiceImp;");
		userRepository.save(t);
		
	}

	@Override
	public void update(User t) {
		// TODO Auto-generated method stub
		userRepository.save(t);

	}

	@Override
	public void remove(Long id) {
		// TODO Auto-generated method stub
		userRepository.delete(id);
	}

	@Override
	public User findOne(Long id) {
		// TODO Auto-generated method stub
		return userRepository.findOne(id);
	}

	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		return userRepository.findAll();
	}

	

}
