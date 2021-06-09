package com.model2.mvc.web.product;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.user.UserService;


//==> 회원관리 Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
		
	public ProductController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	//@RequestMapping("/addProductView.do")
	@RequestMapping(value = "addProduct", method=RequestMethod.GET)
	public String addProductView() throws Exception {

		System.out.println("/product/addProduct : GET");
		
		return "forward:/product/addProductView.jsp";
	}
	
	//@RequestMapping("/addProduct.do")
		@RequestMapping(value="addProduct", method=RequestMethod.POST)
		public String addProduct(@ModelAttribute("product") Product product,
														Model model) throws Exception {
			
			System.out.println("/product/addProduct : POST");
			
			MultipartFile uploadfile = product.getUploadFile();
			if (uploadfile != null) {
				String fileName = uploadfile.getOriginalFilename();
				product.setFileName(fileName);
				try {
					File file = new File("C:\\Users\\woan2\\git\\11.MVC\\11.Model2MVCShop\\src\\main\\webapp\\images\\uploadFiles\\"+fileName);
					uploadfile.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			productService.addProduct(product);
			System.out.println(product);
			
			model.addAttribute("product", product);
			
			return "forward:/product/addProduct.jsp";
		}
		
		@RequestMapping(value="getProduct",  method=RequestMethod.GET)
		public String getProduct(@RequestParam("menu") String menu
								,@RequestParam("prodNo") int prodNo, Model model, HttpServletResponse response
								,HttpServletRequest request) throws Exception {
			
			System.out.println("/product/getProduct : GET");
			
			String prodNoStr = Integer.toString(prodNo);
			
			Product product = productService.getProduct(prodNo);
			
			model.addAttribute("product", product);
			model.addAttribute("menu",menu);
			/*
			 * 
			 * 중복제거 cookie로  수정예정
			 * 
			Cookie cookie = new Cookie("history", null);
			
			for(Cookie inCookie : request.getCookies()) {
				if(inCookie.getName().equals("history")) {
					cookie = inCookie;
					break;
				}
			}
			
			String history = cookie.getValue();
			String newHistory;
			
			if(history == null) {
				newHistory = prodNoStr;
			}else {
				List<String> historys = new ArrayList<String>();
				historys.addAll(Arrays.asList(history.split(",")));
				int dupleIndex = historys.indexOf(prodNoStr);
				historys.add(prodNoStr);
				if(dupleIndex > -1) {
					historys.remove(dupleIndex);
				}
				newHistory = String.join(",", historys);
			}
			
			cookie = new Cookie("history", newHistory);
			cookie.setPath("/");
			*/
			   Cookie[] cookies = request.getCookies();
			      
			      if(cookies != null ) {
			         for (int i = 0; i < cookies.length; i++) {
			            Cookie cookie = cookies[i];
			            if(cookie.getName().equals("history")) {
			               Cookie cookie2 = new Cookie("history",cookie.getValue()+","+Integer.toString(prodNo));
			               cookie2.setPath("/");
			               response.addCookie(cookie2);
			            }else {
			               Cookie cookie2 = new Cookie("history",Integer.toString(prodNo));
			               cookie2.setPath("/");
			               response.addCookie(cookie2);
			            }
			         }
			      }

			if(menu.equals("manage")) {
				return "forward:/product/updateProductView.jsp";
			}else {
				return "forward:/product/getProduct.jsp";
			}
		}
		
		@RequestMapping(value ="listProduct")
		public String listProduct(@ModelAttribute("search") Search search,
								@RequestParam("menu") String menu, Model model ) throws Exception {
			
			System.out.println("/product/listProduct");
			
			if(search.getCurrentPage() == 0) {
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
			
			Map<String , Object> map = productService.getProductList(search);
			
			Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue()
									,pageUnit,search.getPageSize());
			
			System.out.println(map.get("list"));
			
			model.addAttribute("list",map.get("list"));
			model.addAttribute("resultPage",resultPage);
			model.addAttribute("menu",menu);
			model.addAttribute("search", search);
			
				return "forward:/product/listProduct.jsp";
		}
		
		@RequestMapping( value = "updateProduct" , method=RequestMethod.GET )
		public String updateProductView( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{

			System.out.println("/product/updateProduct : GET ");
			//Business Logic
			Product product = productService.getProduct(prodNo);
			// Model 과 View 연결
			model.addAttribute("product", product);
			
			return "forward:/product/updateProductView.jsp";
		}

		@RequestMapping(value="updateProduct", method=RequestMethod.POST)
		public String updateProduct(@ModelAttribute("product") Product product, Model model, HttpSession session) throws Exception {
			
			System.out.println("/product/updateProduct : POST");
			
			productService.updateProduct(product);
		
			// return "redirect:/product/getProduct?prodNo="+product.getProdNo()+"&menu=manage";
			
			return "forward:/product/getProduct.jsp";
		}
	
	
}