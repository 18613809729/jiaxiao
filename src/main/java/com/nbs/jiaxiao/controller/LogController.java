package com.nbs.jiaxiao.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/log")
public class LogController {
	private static final Logger LOGGER = LoggerFactory.getLogger(LogController.class);

	@GetMapping("/{type}")
	public @ResponseBody String log(@PathVariable("type") String type, String msg) {
		switch (type) {
		case "info":
			LOGGER.info("LogController {}", msg);
			break;
		case "warn":
			LOGGER.warn("LogController {}", msg);
			break;
		case "error":
			LOGGER.error("LogController {}", msg);
			break;

		default:
			LOGGER.warn("LogController {}", msg);
			break;
		}
		return "";
	}
}
