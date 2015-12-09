package np.com.carpool.serviceimpl;

import java.util.Date;
import java.util.List;

import np.com.carpool.domain.Trip;
import np.com.carpool.domain.User;
import np.com.carpool.repository.TripRepository;
import np.com.carpool.repository.UserRepository;
import np.com.carpool.service.TripService;
import np.com.carpool.utils.SpringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
class TripServiceImpl implements TripService{
	
	@Autowired
	private TripRepository tripRepository;
	
	@Autowired
	private UserRepository userRepository;

	@Override
	@Transactional
	public void add(Trip t) {
		// TODO Auto-generated method stub
		String username = SpringUtils.getUserName();
		User user = userRepository.findByUsername(username);
		t.setDate(new Date());
		t.setUser(user);
		tripRepository.save(t);
	}

	@Override
	public void update(Trip t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(Long id) {
		// TODO Auto-generated method stub
		tripRepository.delete(id);
	}

	@Override
	public Trip findOne(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Trip> findAll() {
		// TODO Auto-generated method stub
		
		return tripRepository.findAll();
	}

}
