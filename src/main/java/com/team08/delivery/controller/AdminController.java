package com.team08.delivery.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team08.delivery.service.AdminService;
import com.team08.delivery.vo.DeliveryVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;

	@RequestMapping(value = "/searchWorkersForm")
	public String searchWorkersForm() {
		return "admin/searchWorkers";
	}
	
	@RequestMapping(value = "/listDelivery")
	public String listDelivery(@RequestParam("workerId") int workerId, Model model) {
		List<DeliveryVO> deliveryList = adminService.listDelivery(workerId);
		model.addAttribute("deliveryList", deliveryList);
		model.addAttribute("workerId", workerId);
		return "admin/workerDelivery";
	}
	
	@RequestMapping(value = "/addDeliveryForm")
	public String addDeliveryForm(@RequestParam("workerId") int workerId, Model model) {
		model.addAttribute("workerId", workerId);
		return "admin/deliveryForm";
	}
}
