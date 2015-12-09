package np.com.carpool.service;

import java.util.List;

public interface AbstractService<T, ID> {
	
	public void add(T t);
	
	public void update(T t);
	
	public void remove(ID id);
	
	public T findOne(ID id);
	
	public List<T> findAll();

}
