package com.marketing.hst;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/api")
public class test {

    @PostMapping("/sendData")
    public ModelAndView sendData(@RequestBody FamilyData familyData) {
        // You can process the data if required
        // ...

        // Redirect to the new JSP page along with the data
        ModelAndView modelAndView = new ModelAndView("redirect:/showData");
        modelAndView.addObject("familyData", familyData);
        return modelAndView;
    }

    @GetMapping("/showData")
    public ModelAndView showData(@ModelAttribute("familyData") FamilyData familyData) {
        ModelAndView modelAndView = new ModelAndView("showData"); // showData.jsp
        modelAndView.addObject("familyData", familyData);
        return modelAndView;
    }

    public static class FamilyData {
        private String name;
        private String fatherName;
        private String sisterName;

        // Getters, Setters, and Constructors
        // ...
    }
}
