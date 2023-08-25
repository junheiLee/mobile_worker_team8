package com.team08.delivery.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/worker")
public class WorkerController {

	@RequestMapping(value = "/loginForm")
	public String searchWorkersForm() {
		return "worker/login";
	}
}
