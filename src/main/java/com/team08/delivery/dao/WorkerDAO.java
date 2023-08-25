package com.team08.delivery.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.team08.delivery.vo.DeliveryVO;
import com.team08.delivery.vo.WorkerVO;

@Repository
public class WorkerDAO {

	@Autowired
	private SqlSession sqlSession;

	public WorkerVO findByEmail(String workerEmail) throws DataAccessException {
		WorkerVO worker = sqlSession.selectOne("mapper.worker.findByEmail", workerEmail);
		return worker;
	}

	public String findEmailById(int workerId) throws DataAccessException {
		return sqlSession.selectOne("mapper.worker.findEmailById", workerId);
	}

	public List<DeliveryVO> findDeliveryAllByWorkerId(int workerId) {
		return sqlSession.selectList("mapper.delivery.findDeliveryAllByWorkerId", workerId);
	}

	public DeliveryVO findDeliveryById(int deliveryId) {
		return sqlSession.selectOne("mapper.delivery.findDeliveryById", deliveryId);
	}

	public void save(WorkerVO workerVO) {
		sqlSession.insert("mapper.worker.save", workerVO);
	}

	public void update(WorkerVO workerVO) {
		sqlSession.update("mapper.worker.update", workerVO);
	}
}
