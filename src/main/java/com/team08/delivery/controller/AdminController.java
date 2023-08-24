package com.team08.delivery.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping(value = "/searchWorkersForm")
	public String searchWorkersForm() {
		return "admin/searchWorkers";
	}
}
