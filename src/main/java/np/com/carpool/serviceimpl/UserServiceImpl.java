package np.com.carpool.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import np.com.carpool.domain.User;
import np.com.carpool.repository.UserRepository;
import np.com.carpool.service.UserService;

@Service
class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Override
	@Transactional
	public void add(User t) {
		// TODO Auto-generated method stub
		userRepository.save(t);
	}

	@Override
	public void update(User t) {
		// TODO Auto-generated method stub
		userRepository.save(t);
		
	}

	@Override
	public void remove(User t) {
		// TODO Auto-generated method stub
		userRepository.delete(t);
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
