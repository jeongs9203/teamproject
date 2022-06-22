package com.springProject.subProject.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.springProject.subProject.svc.ServiceImport;
import com.springProject.subProject.svc.ServicePayment;
import com.springProject.subProject.svc.ServiceScheduler;
import com.springProject.subProject.vo.BasketListVO;
import com.springProject.subProject.vo.Order_padVO;
import com.springProject.subProject.vo.PayInfoVO;

@Controller
public class ControllerPayment {
//결제에 관련된 이동
	@Autowired
	ServicePayment service;
	@Autowired
	ServiceImport serviceImport;
	@Autowired
	ServiceScheduler serviceScheduler;
	
	//정기결제
	@RequestMapping(value = "/Payment.pm", method = RequestMethod.POST)
	public String selectPay(@ModelAttribute Order_padVO order_padVO,String address,String address_detail ,HttpSession session,Model model) {
		String order_address = address + address_detail;
		String userId = (String)session.getAttribute("sId");
		order_padVO.setOrder_address(order_address);
		order_padVO.setOrder_mem_id(userId);
		System.out.println(order_padVO);
		System.out.println(userId);
		int insertCount = service.insertOrderPad(order_padVO);		//주문내역에 등록
		
		
		PayInfoVO payInfoVO = service.getPayInfo(order_padVO);		//등록된 주문내역으로 결제정보 가져오기
		System.out.println(payInfoVO);
		model.addAttribute("payInfoVO", payInfoVO);
		return "payment/paymentPeriod";
	}
	
	
	//빌링키 발급 후 반복 결제
	@RequestMapping(value = "/subResult.pm",method = RequestMethod.POST)
	public @ResponseBody void subResult(@RequestParam Map<String, Object> map,HttpSession session) {
		String customer_uid = (String) map.get("customer_uid");
		String price = (String) map.get("price");
		String merchant_uid = (String) map.get("merchant_uid");
		
		serviceScheduler.startSchedule(customer_uid, price, merchant_uid,session);
		
		
	}
	
	@RequestMapping(value = "/subPayResult.pm",method = RequestMethod.GET)
	public String subPayResult() {
		
		return "payment/subPayment_result";
	}
	
	@RequestMapping(value = "/paymentSubResultMove.pm", method = RequestMethod.GET)
	public String paySubResultMove(HttpSession session, String code,Model model) {

		//정기결제시
		String mem_id = (String)session.getAttribute("sId");
		service.updateStatus(mem_id);				//결제 성공 후 주문표에 상태 바꾸기
		if(code.equals("inquiry")) {
			return "redirect:inquiry.me";
		}else if(code.equals("home")){
			return "redirect:/";
		}else {
			model.addAttribute("msg", "잘못된 접근이거나 시스템 오류입니다");
			return "failback";
		}
	}
	
	
	//일반결제
	@RequestMapping(value = "/PaymentStore.pm", method = RequestMethod.POST)
	public String selectPayStore(HttpSession session,Model model) {
		ArrayList<BasketListVO> list = (ArrayList<BasketListVO>)session.getAttribute("basketlist");
		ArrayList<Order_padVO> orderPadList = new ArrayList<Order_padVO>();
	
		for(BasketListVO basketListVO : list) {
			service.insertBasketOrderPad(basketListVO);
		}		// 장바구니 상품을 주문표에 넣기
		
		for(BasketListVO basketListVO : list) {
			Order_padVO order_padVO = new Order_padVO(); 
			order_padVO = service.getOrderPad(basketListVO);
			System.out.println(order_padVO);
			orderPadList.add(order_padVO);
		}//주문표 가져오기 
		System.out.println(orderPadList);
		double amount = 0;
		for(BasketListVO basketListVO : list) {
			System.out.println(basketListVO.getTotalprice());
			amount += Double.parseDouble(basketListVO.getTotalprice()); 
		}
		System.out.println(amount);
		//결제정보세팅
		PayInfoVO payInfoVO = new PayInfoVO();
		payInfoVO.setPd_name(list.get(0).getPd_name()+" 외 " +list.size());
		payInfoVO.setAmount(Double.toString(amount));
		payInfoVO.setMem_name(list.get(0).getBk_mem_id());
		payInfoVO.setMem_phoneNum(orderPadList.get(0).getOrder_phoneNum()); 
		payInfoVO.setOrder_address(orderPadList.get(0).getOrder_address());
		payInfoVO.setOrder_postcode(orderPadList.get(0).getOrder_postcode());
		System.out.println(payInfoVO);
		model.addAttribute("payInfoVO", payInfoVO);
		
		return "payment/payment";
	}
	
	@RequestMapping(value = "/paymentResult", method = RequestMethod.GET)
	public String payResult() {
		return "payment/p ayment_result";
	}
	
	@RequestMapping(value = "/paymentResultMove.pm", method = RequestMethod.GET)
	public String payResultMove(HttpSession session, String code,Model model) {

		//일반결제시
		ArrayList<BasketListVO> list = (ArrayList<BasketListVO>)session.getAttribute("basketlist");
		System.out.println(list);
		for(BasketListVO basketListVO : list) {
		service.updateStatus(basketListVO);				//결제 성공 후 주문표에 상태 바꾸기
		service.deleteOrderCheck(basketListVO);			//장바구니 비우기 
		}
		if(code.equals("inquiry")) {
			return "redirect:inquiry.me";
		}else if(code.equals("home")){
			return "redirect:/";
		}else {
			model.addAttribute("msg", "잘못된 접근이거나 시스템 오류입니다");
			return "failback";
		}
	}
	
	
	
	
	
}
