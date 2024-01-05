package com.marketing.hst;

import java.util.ArrayList;
import java.util.Date;
import java.util.Optional;
import java.util.TimeZone;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.hibernate.mapping.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.persistence.EntityManager;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class MktController {

	private static final String UPLOAD_DIR = "E:/webData/";	
	private static final String EXTRA_DIR = "C:\\fakepath\\";	
	
@Autowired
private EntityManager entityManager;	
@Autowired
ProfileDetailsRepository repo;
@Autowired
OrderDetailsRepository orderRepo;
@Autowired
private BrandRepository brandRepository;  // Assuming you have a repository for Brand

@Autowired
private PlatformRepository platformRepository;  


@Autowired
private ProductRepository prodRepository;  // Assuming you have a repository for Brand


	@RequestMapping("/home")
	public ModelAndView home(HttpSession ht) throws JsonProcessingException {
//	String login=ht.getAttribute("login").toString();
//		if(login.equalsIgnoreCase("1")) {
//			return	profile(ht);
//			
//		}
		 Date today = new Date();
		
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("productList", prodRepository.findActiveProducts(today));
		return mv;
		

	}
	@RequestMapping("/product")
	public ModelAndView product(HttpSession ht) throws JsonProcessingException {
		Product pdt= new Product();
		pdt.setSeller(ht.getAttribute("userName").toString());
		
		ModelAndView mv= new ModelAndView("product");
		
		mv.addObject("PlatformList", platformRepository.findAll());
		
		mv.addObject("brandList", brandRepository.findAll());
		mv.addObject("mktJson", pdt);
		return mv;
		

	}

	@GetMapping("/productDetail")
    public String getProductDetail(@RequestParam Long id, Model model,HttpSession ht) {
        // Fetch the product details from the database using the ProductService
        Optional<Product> productList = prodRepository.findById(id);
       Product product= productList.get();
        // Add the product object to the model to be displayed in the view

       product.setSeller(ht.getAttribute("userName").toString());

       	model.addAttribute("mktJson", product);
        model.addAttribute("PlatformList", platformRepository.findAll());
		
        model.addAttribute("brandList", brandRepository.findAll());
        // Return the view name (productDetail.jsp or productDetail.html)
        return "product";
    }
	
	
	@GetMapping("/orderDetailsFetch")
    public String getOrderDetails(@RequestParam Long id, Model model,HttpSession ht) {
        // Fetch the product details from the database using the ProductService
        Optional<Order> OrderList = orderRepo.findById(id);
        Order order= OrderList.get();
        // Add the product object to the model to be displayed in the view
        String personProfileId=ht.getAttribute("loginUser").toString();
        order.setViewer(personProfileId);
    	model.addAttribute("brandList", (ArrayList<String>) prodRepository.findDistinctBrandNameByPlatformAndStopOrder(order.getPlatform(),0));
    	model.addAttribute("productsList",(ArrayList<Product>) prodRepository.findByBrandNameAndStopOrderAndPlatform(order.getBrandName(),0,order.getPlatform()));
        
       	model.addAttribute("order", order);
        model.addAttribute("PlatformList", platformRepository.findAll());
		
        model.addAttribute("brandList", brandRepository.findAll());
        // Return the view name (productDetail.jsp or productDetail.html)
        return "orderDetails";
    }
	
	
	@RequestMapping("/managePdt")
	public String manageProducts(Model model) {
	    ArrayList<Product> productList = (ArrayList<Product>) prodRepository.findAll(); // Assuming you have this method in your service
	    model.addAttribute("productList", productList);
	    return "managePdt"; // This will resolve to your managePdt.jsp view
	}
	@RequestMapping("/")
	public ModelAndView homeBasic(HttpSession ht) throws IOException {
		String login=ht.getAttribute("login")!=null ?ht.getAttribute("login").toString():"0";
		
		if(login.equalsIgnoreCase("1")) {
			 Date today = new Date();
		 		
		 		ModelAndView mv = new ModelAndView("home");
		 		mv.addObject("productList", prodRepository.findActiveProducts(today));
		 		return mv;
			
		}
		return new ModelAndView("login");
		

	}

	@RequestMapping("/howTo")
	public String howTo() {
		//return "test";
		//return "login";
		return "howTo";
	}
//	@RequestMapping("/manageUser")
//	public String manageUser() {
//		//return "test";
//		//return "login";
//		return "manageUser";
//	}
	
	
	@RequestMapping("/navBarTest")
	public String navBarTest() {
		//return "test";
		//return "login";
		return "navBar";
	}
	@RequestMapping("/testNew")
	public String testNew() {
		//return "test";
		//return "login";
//		return "test";
		return "manageOrderBuyer";
//		return "orderForm";
	}
	
	
	@RequestMapping("/login")
	public String login() {
		//return "test";
		//return "login";
		return "login";
	}
	@RequestMapping("/profile")
	public ModelAndView profile(HttpSession ht) {
		String personProfileId=ht.getAttribute("loginUser").toString();
		String role=ht.getAttribute("userRole").toString();
				
		Optional<ProfileDetails> profileData=repo.findById(Long.parseLong(personProfileId));
		ModelAndView mv =new ModelAndView("profile");
		ProfileDetails pd=profileData.get();
		if(!pd.getProfilePicPath().isBlank()) {
		 byte[] imageData;
		try {
			imageData = readImageFile(pd.getProfilePicPath().toString());
			 String base64PP=Base64.encodeBase64String(imageData);
				profileData.get().setProfilePicView(base64PP);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mv.addObject("mktJson",profileData.get());
			mv.addObject("role",role);
			
			return mv;
		}
		
		}
		
	//	String json=getJsonFromObject(profileData.get());
		mv.addObject("mktJson",profileData.get());
		mv.addObject("role",role);
		
		return mv;
	}
	@RequestMapping("/fetchProfile")
    public ModelAndView fetchProfile(@RequestParam("profileId") String profileId, HttpSession ht) throws IOException {
		String userRole=ht.getAttribute("userRole").toString();
		if(!userRole.equalsIgnoreCase("Admin")) {
			profile(ht);
		}
		Optional<ProfileDetails> profileData=repo.findById(Long.parseLong(profileId));
		ModelAndView mv =new ModelAndView("profile");
		ProfileDetails pd=profileData.get();
		
		if(!pd.getProfilePicPath().isBlank()) {
			 byte[] imageData;
			try {
				imageData = readImageFile(pd.getProfilePicPath().toString());
				 String base64PP=Base64.encodeBase64String(imageData);
					profileData.get().setProfilePicView(base64PP);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				mv.addObject("mktJson",profileData.get());
				mv.addObject("role",userRole);
				
				return mv;
			}
			
			}
			
	//	String json=getJsonFromObject(profileData.get());
		mv.addObject("mktJson",profileData.get());
		mv.addObject("role",userRole);
		return mv;
	}
	
// for admin usermangement
	@RequestMapping("/manageUser")
	public ModelAndView manageUser(HttpSession ht) throws JsonProcessingException {
		String personProfileId=ht.getAttribute("loginUser").toString();
		ArrayList profileData=(ArrayList) repo.findAll();
		ModelAndView mv =new ModelAndView("manageUser");
		
	//	String json=getJsonFromObject(profileData.get());
		mv.addObject("mktJson",profileData);
		return mv;
	}

	
	
	@RequestMapping("/manageOrderBuyer")
	public ModelAndView manageOrderBuyer(HttpSession ht)  {
		String personProfileId=ht.getAttribute("loginUser").toString();
		//ArrayList orderData=(ArrayList) orderRepo.findAll();
		
		ModelAndView mv =new ModelAndView("manageOrderBuyer");
		
		
	//	String json=getJsonFromObject(profileData.get());
		mv.addObject("brands",prodRepository.findDistinctBrandName());
		mv.addObject("orderList",orderRepo.findAllByProfileDtlsId(personProfileId));
		return mv;
	}
	
	@RequestMapping("/manageOrder")
	public ModelAndView manageOrderAdmin(HttpSession ht)  {
		
		
		ArrayList orderData=(ArrayList) orderRepo.findAll();
		
		ModelAndView mv =new ModelAndView("manageOrderAdmin");
		
		
	//	String json=getJsonFromObject(profileData.get());
		mv.addObject("brands",prodRepository.findDistinctBrandName());
		mv.addObject("orderList",orderData);
		return mv;
	}
	
	
	@PostMapping("/searchOrders")
    public @ResponseBody  ArrayList<Order> searchOrders(@RequestBody SearchCriteria searchCriteria , HttpSession ht) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Order> criteriaQuery = criteriaBuilder.createQuery(Order.class);
        Root<Order> root = criteriaQuery.from(Order.class);
        String userRole=ht.getAttribute("userRole").toString();
        ArrayList<Predicate> predicates = new ArrayList<>();
        
		if(!userRole.equalsIgnoreCase("Admin")) {
        String personProfileId=ht.getAttribute("loginUser").toString();
        predicates.add(criteriaBuilder.equal(root.get("profileDtlsId"), personProfileId));}
        // Add conditions based on the provided search criteria
        if (searchCriteria.getBrandName() != null && !searchCriteria.getBrandName().isEmpty() && !searchCriteria.getBrandName().equalsIgnoreCase("-1")) {
            predicates.add(criteriaBuilder.equal(root.get("brandName"), searchCriteria.getBrandName()));
        }

        if (searchCriteria.getOrderStatus() != null && !searchCriteria.getOrderStatus().isEmpty() && !searchCriteria.getOrderStatus().equalsIgnoreCase("-1")) {
            predicates.add(criteriaBuilder.equal(root.get("orderStatus"), searchCriteria.getOrderStatus()));
        }

        if (searchCriteria.getReviewStatus() != null && !searchCriteria.getReviewStatus().isEmpty() && !searchCriteria.getReviewStatus().equalsIgnoreCase("-1")) {
            predicates.add(criteriaBuilder.equal(root.get("affiliateStatus"), searchCriteria.getReviewStatus()));
        }
        if (searchCriteria.getOrderId() != null && !searchCriteria.getReviewStatus().isEmpty()) {
            predicates.add(criteriaBuilder.equal(root.get("orderId"), searchCriteria.getOrderId()));
        }
        if (searchCriteria.getProduct() != null && !searchCriteria.getReviewStatus().isEmpty()) {
            predicates.add(criteriaBuilder.equal(root.get("product"), searchCriteria.getProduct()));
        }
        // Add range query for orderDate between fromDate and toDate
        if (searchCriteria.getFromDate() != null && searchCriteria.getToDate() != null) {
            Date fromDate = java.sql.Date.valueOf(searchCriteria.getFromDate());
            Date toDate = java.sql.Date.valueOf(searchCriteria.getToDate());
            predicates.add(criteriaBuilder.between(root.get("orderDate"), fromDate, toDate));
        }

        criteriaQuery.where(predicates.toArray(new Predicate[0]));
        ArrayList<Order> odList=(ArrayList<Order>) entityManager.createQuery(criteriaQuery).getResultList();
        return odList;
    }
	
	@PostMapping("/loginSubmit")

	public @ResponseBody ApiResponse loginSubmit(@RequestBody ProfileDetails profile,HttpSession ht) {
		
		ArrayList<ProfileDetails> result=(ArrayList<ProfileDetails>) repo.findByloginMailAndNewPassword(profile.getLoginMail(),profile.getNewPassword());
     System.out.println(result);
     ApiResponse respo= new ApiResponse();
	if(result!=null && result.get(0).getProfileDtlsId()!=null) {
		respo.setValid(true);
		ht.setAttribute("loginUser",result.get(0).getProfileDtlsId());
		ht.setAttribute("userRole", result.get(0).getRole() );
		ht.setAttribute("userName", result.get(0).getFirstName() );
		ht.setAttribute("login","1" );
	}else {
		respo.setValid(false);
	}
	
	
     return respo;
	}
	
	@PostMapping("/saveUserData")
	public String updateProfile(@RequestBody ProfileDetails profile, HttpSession ht) throws IOException {
		String personProfileId=ht.getAttribute("loginUser").toString();
		Optional<ProfileDetails> profileData=null;//repo.findById(Long.parseLong(personProfileId));
		String userRole=ht.getAttribute("userRole").toString();
		
		if(!userRole.equalsIgnoreCase("Admin")) {
			profileData=repo.findById(Long.parseLong(personProfileId));
			
			profile.setRole(profileData.get().getRole());
			profile.setStatus(profileData.get().getStatus());
			profile.setProfileDtlsId(Long.parseLong(personProfileId));
		}
		if(userRole.equalsIgnoreCase("Admin")) {
			profileData=repo.findById(profile.getProfileDtlsId());
			
			profile.setProfileDtlsId(profile.getProfileDtlsId());
		}
		
		if(profile !=null &&profile.getProfilePicPath()!=null && !profile.getProfilePicPath().isBlank())
		{ 
			String recPath =profile.getProfilePicPath();
			Date dt= new Date();
        	String uploadBy=ht.getAttribute("login").toString();
        	String path=UPLOAD_DIR +dt.getYear()+"/"+dt.getMonth()+"/"+dt.getDate() +"/"+uploadBy+"/";
        	recPath=recPath.replace(EXTRA_DIR, path);
        	profile.setProfilePicPath(recPath);
		// byte[] imageData = readImageFile(recPath.toString());
		// profile.setProfilePicture(imageData);
		}
		else {
			profile.setJoinDate(profileData.get().getJoinDate());
			
			profile.setProfilePicPath(profileData.get().getProfilePicPath());
		}
		repo.save(profile);
		
		return "login";
	}
	 private byte[] readImageFile(String filePath) throws IOException {
	        Path path = Paths.get(filePath);
	        return Files.readAllBytes(path);
	    }
	 @RequestMapping("/orderForm")
		public ModelAndView orderForm( HttpSession ht, ModelAndView mv) {
		 String login=ht.getAttribute("login")!=null ?ht.getAttribute("login").toString():"0";
			String personProfileId=ht.getAttribute("loginUser").toString();
			Order od= new Order();
			od.setProfileDtlsId(Long.parseLong(personProfileId));
			mv.addObject("order",  od);
	
		 if(login.equalsIgnoreCase("1")) {
			 mv.setViewName("orderDetails");
		 mv.addObject("PlatformList",  platformRepository.findByStatus("Active"));

		 
			return mv;
		 }
		 mv.setViewName("login");
		 return mv;
		}
	 @RequestMapping("/logout")
		public String logout(HttpSession ht) {
		 	ht.setAttribute("loginUser","");
			ht.setAttribute("userRole", "" );
			ht.setAttribute("login","" );
			ht.setAttribute("userName", "" );
			return "login";
		}
//	o
	 
	 
	@RequestMapping("/reg")
	public ModelAndView reg(String s) throws JsonProcessingException {
		System.out.println(s);
		ModelAndView mv = new ModelAndView();
		TestBean t=new TestBean();
		t.setBrother("ram");
		t.setFather("fatre");
		t.setMother("werwe");
		t.setName("werqad");
		getJsonFromObject(t);
		mv.addObject("mktJson", t);
	//		mv.addObject("mktJson", StringEscapeUtils.escapeHtml(getJsonFromObject(t)));
		
		mv.setViewName("navBar");
		return mv;
	}

	@RequestMapping("/test")
	public ModelAndView test(@RequestBody TestBean person) throws JsonProcessingException {
		ModelAndView mv = new ModelAndView();
		TestBean t=new TestBean();
		t.setBrother("ram");
		t.setFather("fatre");
		t.setMother("werwe");
		t.setName("werqad");
		getJsonFromObject(t);
		mv.addObject("mktJson", t);
	//	mv.addObject("mktJson", StringEscapeUtils.escapeHtml(getJsonFromObject(t)));
		
		mv.setViewName("navBar");
		return mv;
	}

	
	@PostMapping("/api/endpoint") // Replace with your actual endpoint
    @ResponseBody
    public String handleJson(@RequestBody TestBean person) {
        // Process the received Person object
        System.out.println("Received Person: " + person.toString());

        // You can perform any logic with the received data here

        // Return a response (you can customize this based on your needs)
        return "Data received successfully!";
    }
	
	public String getJsonFromObject(Object object) throws JsonProcessingException {
		ObjectMapper oM = new ObjectMapper();
		oM.setTimeZone(TimeZone.getDefault());
		return oM.writeValueAsString(object);
	}



	    public static <T> T getJsonToObject(String jsonString, Class<T> valueType) {
	        try {
	            ObjectMapper objectMapper = new ObjectMapper();
	            return objectMapper.readValue(jsonString, valueType);
	        } catch (Exception e) {
	            e.printStackTrace(); // Handle the exception based on your needs
	            return null;
	        }
	    }

	  //Method to handle image upload in your service or controller
	    public String uploadImage(MultipartFile file) {
	     try {
	         String fileName = StringUtils.cleanPath(file.getOriginalFilename());
	         Path path = Paths.get("/path/to/your/directory/" + fileName);
	         Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
	         return fileName;
	     } catch (IOException e) {
	         throw new RuntimeException("Failed to store image", e);
	     }
	    }

}
