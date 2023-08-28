package com.team08.delivery.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team08.delivery.service.WorkerService;
import com.team08.delivery.vo.DeliveryVO;
import com.team08.delivery.vo.WorkerVO;

@Controller
@RequestMapping("/worker")
public class WorkerController {

	@Autowired
	private WorkerService workerService;

	// public WorkerController(WorkerService workerService) {
	// this.workerService = workerService;
	// }

	@RequestMapping(method = RequestMethod.GET)
	public String main() {
		return "worker/main";
	}

	// 이메일 입력 폼 불러오기
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm() {
		return "worker/login";
	}

	// 이메일, 지역 등록
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam String workerEmail, @RequestParam String workerCity, HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		HttpSession session = request.getSession();
		WorkerVO worker = workerService.regist(workerEmail, workerCity);
		// session.setAttribute("worker", worker.getWorkerEmail());
		session.setAttribute("worker", worker.getWorkerEmail());

		return "worker/main";
	}

	// // 이메일, 지역 등록
	// @ResponseBody
	// @RequestMapping(value = "/login", method = RequestMethod.POST)
	// public WorkerVO login(@RequestParam String workerEmail, @RequestParam
	// String workerCity, HttpServletRequest request,
	// HttpServletResponse response) throws IOException {
	//
	// return workerService.regist(workerEmail, workerCity);
	// }

	// 배송 불러오기
	@RequestMapping(value = "/{workerId}", method = RequestMethod.GET)
	public String upload(@PathVariable Integer workerId, HttpServletRequest request) {

		HttpSession session = request.getSession();
		 List<DeliveryVO> deliveryList = workerService.findDeliveryAllByWorkerId(workerId);
//		List<DeliveryVO> deliveryList = Arrays.asList(
//				new DeliveryVO(1, 1, "OPEN", "image_url", "고객 계정", "상세주소: 서울시 서초구 효령로 335", "서초구", "대한민국", "1604-19",
//						"playdata", "computer", "https://playdata.io", "초인종 눌러야 열어주심"),
//				new DeliveryVO(2, 1, "OPEN", "image_url", "고객 계정", "상세주소: 서울시 서초구 효령로 335", "서초구", "대한민국", "1604-19",
//						"playdata", "computer", "https://playdata.io", "초인종 눌러야 열어주심"));
		System.out.println(deliveryList.toString());
		session.setAttribute("deliveryList", deliveryList);

		return "worker/main";
	}

	// 배송 예약 목록 이동
	@RequestMapping(value = "/delivery", method = RequestMethod.GET)
	public String deliveryList() {
		return "worker/deliveryList";
	}

	// 상세 화면
	@RequestMapping(value = "delivery/{deliveryId}", method = RequestMethod.GET)
	public String detail(@PathVariable Integer deliveryId, Model model) {

		DeliveryVO deliveryVO = workerService.findDeliveryById(deliveryId);
		//DeliveryVO deliveryVO = new DeliveryVO(1, 1, "OPEN", "image_url", "고객 계정", "상세주소: 서울시 서초구 효령로 335", "서초구",
		//		"대한민국", "1604-19", "playdata", "computer", "https://playdata.io", "초인종 눌러야 열어주심");
		model.addAttribute("deliveryVO", deliveryVO);
		return "worker/detail";
	}

//	// 상세 내용 보기
//	@ResponseBody
//	@RequestMapping(value = "/api/delivery/{deliveryId}", method = RequestMethod.GET)
//	public DeliveryVO detailcontent(@) {
//		DeliveryVO deliveryVO = workerService.findDeliveryById(deliveryId);
//		//DeliveryVO deliveryVO = new DeliveryVO(1, 1, "OPEN", "image_url", "고객 계정", "상세주소: 서울시 서초구 효령로 335", "서초구",
//		//		"대한민국", "1604-19", "playdata", "computer", "https://playdata.io", "초인종 눌러야 열어주심");
//		return deliveryVO;
//	}

	// 고객 확인 받기
	@ResponseBody
	@RequestMapping(value = "/api/delivery/{deliveryId}", method = RequestMethod.PATCH)
	public String complete() {
		// update
		// jobId의 open -> close
		// jobId의 signature에 값 넣기
		return "작업을 완료했습니다";
	}
}