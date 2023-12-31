package com.team08.delivery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team08.delivery.dao.AdminDAO;
import com.team08.delivery.vo.DeliveryVO;
import com.team08.delivery.vo.WorkerVO;

@Service
public class AdminService {

	@Autowired
	private AdminDAO adminDAO;
	
	public List<WorkerVO> listWorker(String region) {
		return adminDAO.selectWorkersByRegion(region);
	}
	
	public List<DeliveryVO> listDelivery(int workerId) {
		return adminDAO.selectDeliveriesByWorker(workerId);
	}
	
	public int addDelivery(DeliveryVO deliveryVO) {
		return adminDAO.insertDelivery(deliveryVO);
	}
	
}
