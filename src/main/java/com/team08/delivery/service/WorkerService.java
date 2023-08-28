package com.team08.delivery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team08.delivery.dao.WorkerDAO;
import com.team08.delivery.vo.DeliveryVO;
import com.team08.delivery.vo.WorkerVO;

@Service
public class WorkerService {

	@Autowired
	private WorkerDAO workerDAO;
	
//	public WorkerService(WorkerDAO workerDAO) {
//		this.workerDAO = workerDAO;
//	}
	
	public WorkerVO regist(String workerEmail, String workerCity) {
		WorkerVO workerVO = workerDAO.findByEmail(workerEmail);

		if(workerVO == null) {
			workerDAO.save(new WorkerVO(-1, workerEmail, workerCity));
		} else {
			workerVO.setWorkerCity(workerCity);
			workerDAO.update(workerVO);
		}
		
		return workerDAO.findByEmail(workerEmail);
	}
	
	public DeliveryVO findDeliveryById(int deliveryId) {
		return workerDAO.findDeliveryById(deliveryId);
	}
	
	public String findEmailById(int workerId) {
		return workerDAO.findEmailById(workerId);
	}
	
	public List<DeliveryVO> findDeliveryAllByWorkerId(int workerId) {
		return workerDAO.findDeliveryAllByWorkerId(workerId);
	}
}
