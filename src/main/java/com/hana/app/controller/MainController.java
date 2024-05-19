package com.hana.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    @RequestMapping("/")
    public String main(Model model, @ModelAttribute("alert") String alertMessage) throws Exception {
        if (alertMessage != null && !alertMessage.isEmpty()) {
            model.addAttribute("alertMessage", alertMessage);
        }
        return "index";
    }

}
