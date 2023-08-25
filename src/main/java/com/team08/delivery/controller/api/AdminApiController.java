package com.team08.delivery.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.team08.delivery.service.AdminService;
import com.team08.delivery.vo.DeliveryVO;
import com.team08.delivery.vo.WorkerVO;

@RestController
@RequestMapping("/api/admin")
public class AdminApiController {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value = "/listWorker")
	public ResponseEntity<List<WorkerVO>> listWorker(@RequestParam("region") String region) {
		List<WorkerVO> workerList = adminService.listWorker(region);
		return new ResponseEntity<List<WorkerVO>>(workerList, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/addDelivery", method = RequestMethod.POST)
	public ResponseEntity<Integer> addDelivery(@RequestBody DeliveryVO deliveryVO) {
		int result = adminService.addDelivery(deliveryVO);
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
}
