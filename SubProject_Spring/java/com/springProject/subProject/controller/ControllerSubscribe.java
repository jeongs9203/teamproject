package com.springProject.subProject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class ControllerSubscribe {
//구독에 관련된 모든 이동
   
   @RequestMapping(value = "/subscribePage.sub", method = RequestMethod.GET)
   public String scribe() {
      return "subscribe/sub_level";
   }
   
   @RequestMapping(value = "/sub_determine_st.sub", method = RequestMethod.GET)
   public String standard() {
      return "subscribe/subType/sub_standard";
   }
   
   @RequestMapping(value = "/sub_determine_pre.sub", method = RequestMethod.GET)
   public String premium() {
      return "subscribe/subType/sub_premium";
   }
   
   @RequestMapping(value = "/sub_order.sub", method = RequestMethod.GET)
   public String standardSub(HttpSession session, Model model) {
      String id = (String)session.getAttribute("userId");
      
      if(id == null) {
         model.addAttribute("msg", "잘못된 접근입니다");
         return "member/mem_loginForm"; // 로그인 정보 없을 시 로그인폼으로 이동
      }
      
      return "subscribe/sub_order";
   }
   
//   @RequestMapping(value = "/Payment.pm", method = RequestMethod.POST)
//   public String payment() {
//      return "payment/payment";
//   }

   
   
}