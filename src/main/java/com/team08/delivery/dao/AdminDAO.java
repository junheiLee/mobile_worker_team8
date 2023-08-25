package com.team08.delivery.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.team08.delivery.vo.DeliveryVO;
import com.team08.delivery.vo.WorkerVO;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public List<WorkerVO> selectWorkersByRegion(String region) throws DataAccessException {
		List<WorkerVO> workerList = null;
		workerList = sqlSession.selectList("mapper.worker.selectWorkersByRegion", region);
		return workerList;
	}
	
	public List<DeliveryVO> selectDeliveriesByWorker(int workerId) {
		List<DeliveryVO> deliveryList = null;
		deliveryList = sqlSession.selectList("mapper.delivery.selectDeliveriesByWorker", workerId);
		return deliveryList;
	}
	
	public int insertDelivery(DeliveryVO deliveryVO) {
		return sqlSession.insert("mapper.delivery.insertDelivery", deliveryVO);
	}
}
