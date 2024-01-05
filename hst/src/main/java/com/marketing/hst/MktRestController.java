package com.marketing.hst;



import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.protobuf.Api;
import com.mchange.v2.lang.StringUtils;

import jakarta.servlet.http.HttpSession;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MktRestController {

@Autowired
ProfileDetailsRepository repo;
@Autowired
ProductRepository pdtRepo;
@Autowired
OrderDetailsRepository orderRepo;

    private final JavaMailSender javaMailSender;

    public MktRestController(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }

    private static final String UPLOAD_DIR = "E:/webData/";	
	private static final String EXTRA_DIR = "C:\\fakepath\\";	

    @PostMapping("/upload")
    public ResponseEntity<?> uploadFile(@RequestParam("fileUpload") MultipartFile file,HttpSession ht) {
        if (file.isEmpty()) {
            return ResponseEntity.badRequest().body("{\"success\": false, \"message\": \"Please select a file.\"}");
        }

        try {
        	Date dt= new Date();
        	String uploadBy=ht.getAttribute("login").toString();
        	String path=UPLOAD_DIR +dt.getYear()+"/"+dt.getMonth()+"/"+dt.getDate() +"/"+uploadBy;
            Files.createDirectories(Paths.get(path));
            
            Path filePath = Paths.get(path+"/"+file.getOriginalFilename());
            Files.write(filePath, file.getBytes());

            return ResponseEntity.ok("{\"success\": true, \"message\": \"File uploaded successfully!\"}");

        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.badRequest().body("{\"success\": false, \"message\": \"Failed to upload the file.\"}");
        }
    }
    
	@PostMapping("/updateStatus")
	public @ResponseBody ApiResponse updateStatus(@RequestBody ProfileDetails profile,HttpSession ht) {
		ApiResponse response = new ApiResponse();
		try {
			repo.updateStatusById(profile.getProfileDtlsId(), profile.getStatus());
			response.setValid(true);
			return response;
		} catch (Exception e) {
			e.printStackTrace();
			response.setValid(false);
			return response;
		}

    }

//	 @GetMapping("/searchOrders")
//	    public ResponseEntity<List<Order>> searchOrders(@RequestParam Map<String, String> params) {
//	        List<Order> orders = orderRepo.findByCriteria(params.get("brandName"), params.get("orderStatus"),params.get("reviewStatus") ,params.get("fromDate") ,params.get("toDate") ,params.get("orderId") ,params.get("product") );
//	        return ResponseEntity.ok(orders);
//	    }
	@GetMapping("/activeBrand")
	    public ArrayList<String> getAllActiveBrandsWithStopOrderForPlatform(@RequestParam String platform) {
	        return (ArrayList<String>) pdtRepo.findDistinctBrandNameByPlatformAndStopOrder(platform,0);
	    }
	 
	 @GetMapping("/activeProduct")
	    public ArrayList<Product> getAllActiveProductsWithStopOrderForPlatform( @RequestParam String brandName, @RequestParam String platform) {
	        return (ArrayList<Product>) pdtRepo.findByBrandNameAndStopOrderAndPlatform(brandName,0,platform);
	    }
	 
	 @GetMapping("/fetchProductDetails")
	    public Product fetchProductDetails(@RequestParam String productName, 
	                                                 @RequestParam String brandName,
	                                                 @RequestParam String platform) {
	        return pdtRepo.findByTitleAndBrandNameAndPlatformAndStopOrder(productName, brandName, platform,0);
	    }
	  @PostMapping("/ordersSave")
	    public  ResponseEntity<String> saveOrder(@RequestBody Order order,HttpSession ht) {
		  Order  od=new Order();
		  if(order.getId()!=null) {
		  od=orderRepo.findById(order.getId()).get();
		  }
		  try {
	        	if(order.getId()==null || order.getOrderStatus().equalsIgnoreCase("Rejected")) {
	        		order.setOrderStatus("Unchecked");
	        		if(order.getOrderScreenshot()!=null) {
	        			String recPath =order.getOrderScreenshot();
	        			Date dt= new Date();
	                	String uploadBy=ht.getAttribute("login").toString();
	                	String path=UPLOAD_DIR +dt.getYear()+"/"+dt.getMonth()+"/"+dt.getDate() +"/"+uploadBy+"/";
	                	recPath=recPath.replace(EXTRA_DIR, path);
	                	order.setOrderScreenshot(recPath);
	        		}
	        		else {
	    	        	order.setOrderScreenshot(od.getOrderScreenshot());	
	        		}
	        } else if(order.getId()!=null || order.getOrderStatus().equalsIgnoreCase("Accepted")) {
	        	order.setOrderScreenshot(od.getOrderScreenshot());
	        	if(order.getReviewScreenshot()!=null) {
        			String recPath =order.getReviewScreenshot();
        			Date dt= new Date();
                	String uploadBy=ht.getAttribute("login").toString();
                	String path=UPLOAD_DIR +dt.getYear()+"/"+dt.getMonth()+"/"+dt.getDate() +"/"+uploadBy+"/";
                	recPath=recPath.replace(EXTRA_DIR, path);
                	order.setReviewScreenshot(recPath);
        		} else {

    	        	order.setReviewScreenshot(od.getReviewScreenshot());	
    	        	
        			
        		}
	        	
	        	if(order.getSellerFdScreenshot()!=null) {
        			String recPath =order.getSellerFdScreenshot();
        			Date dt= new Date();
                	String uploadBy=ht.getAttribute("login").toString();
                	String path=UPLOAD_DIR +dt.getYear()+"/"+dt.getMonth()+"/"+dt.getDate() +"/"+uploadBy+"/";
                	recPath=recPath.replace(EXTRA_DIR, path);
                	order.setSellerFdScreenshot(recPath);
        		}else {
    	        	order.setSellerFdScreenshot(od.getSellerFdScreenshot());	
        		}
	        	
	        	
	        	
        }
	        	orderRepo.save(order); // Assuming you have a method in OrderService to save the order
	            return ResponseEntity.ok("Order saved successfully!");
	        } catch (Exception e) {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error saving order!");
	        }
	  }
	@PostMapping("/saveproduct")
	public @ResponseBody ApiResponse saveproduct(@RequestBody Product product,HttpSession ht) {
		ApiResponse response = new ApiResponse();
		Long profileId =Long.parseLong(ht.getAttribute("login").toString());
		product.setProfileDtlsId(profileId);
		product.setStopOrder(0);
		try {
			pdtRepo.save(product);
			response.setValid(true);
			return response;
		} catch (Exception e) {
			e.printStackTrace();
			response.setValid(false);
			return response;
		}

    }
	 @GetMapping("/checkOrder")
	    public   boolean checkOrder(@RequestParam String orderId) {
	        return orderRepo.findByOrderId(orderId).isPresent();
	    }
	 @PutMapping("/updateStatus/{productId}")
	    public ResponseEntity<Product> updateProductStatus(@PathVariable Long productId) {
	        // Fetch the product by ID
	        Product product = pdtRepo.findById(productId).get();

	        if (product == null) {
	            return ResponseEntity.notFound().build();
	        }

	        // Toggle the stopOrder status
	        product.setStopOrder(product.getStopOrder() == 1 ? 0 : 1);

	        // Update the product in the database
	        pdtRepo.save(product);

	        return ResponseEntity.ok(product);
	    }	
    @PostMapping("/sendEmail")
    public ApiResponse sendEmail(@RequestBody String encodedEmail) {
    	ApiResponse response = new ApiResponse();
     
    	try {
            String decodedEmail = URLDecoder.decode(encodedEmail, "UTF-8");
            
            // Extract the email from the decoded string (assuming encodedEmail is in the format "email=encodedEmailAddress")
            String email = decodedEmail.split("=")[1];
            
            // Generate a random password
            String autogeneratedPassword = RandomPasswordGenerator.generateRandomPassword(12);
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(email);
            message.setSubject("Password Recovery");
            message.setText("Your autogenerated password is: " + autogeneratedPassword);
            
            javaMailSender.send(message);
            updatePasswordAndEmail(autogeneratedPassword, email);
            response.setView("Sucess! Email sent successfully");
            return response;
        } catch (Exception e) {
            e.printStackTrace();
            response.setView("Failed! Please try again");
            return response;
        }
    }

    public void updatePasswordAndEmail(String newPassword, String loginMail) {
        List<ProfileDetails> existingProfileDetails = repo.findByloginMail(loginMail);

        if (existingProfileDetails!=null && existingProfileDetails.size()>0) {
            // If the email exists, update the newPassword for the existing record
            ProfileDetails profileDetails = existingProfileDetails.get(0);
            profileDetails.setNewPassword(newPassword);
            repo.save(profileDetails); // Update existing record
        } else {
            // If the email does not exist, create a new ProfileDetails entity
            ProfileDetails newProfileDetails = new ProfileDetails();
            newProfileDetails.setLoginMail(loginMail);
            newProfileDetails.setNewPassword(newPassword);
            newProfileDetails.setRole("Buyer");
            newProfileDetails.setStatus("Active");
            Date javaDate = new Date();
            
            java.sql.Date sqlDate = new java.sql.Date(javaDate.getTime());
            
            newProfileDetails.setJoinDate(sqlDate); 
            
            repo.save(newProfileDetails); // Create new entry
        }
    }
    
    @Autowired
    private BrandRepository brandRepository;  
    @PostMapping("/saveBrand")
    public ApiResponse saveBrand(@RequestBody Brand brand) {
    	ApiResponse ar= new ApiResponse();
    	brand.setStatus("Active");
    	try {
            brandRepository.save(brand);
            ar.setValid(true);
            return ar;
        } catch (Exception e) {
            e.printStackTrace();
            ar.setValid(false);
            return ar;
        }
    }
    @Autowired
    private PlatformRepository platformRepository;  
    @PostMapping("/saveplatform")
    public ApiResponse savePlatform(@RequestBody PlatformType brand) {
    	ApiResponse ar= new ApiResponse();
    	brand.setStatus("Active");
    	try {
    		platformRepository.save(brand);
            ar.setValid(true);
            return ar;
        } catch (Exception e) {
            e.printStackTrace();
            ar.setValid(false);
            return ar;
        }
    }
    //    @PostMapping("/sendEmail")
//    public ApiResponse sendEmail(@RequestBody String email) {
//        // Generate a random password
//        String autogeneratedPassword = "GeneratedPassword123"; // You can use a random password generator
//        
//        SimpleMailMessage message = new SimpleMailMessage();
//        message.setTo(email);
//        message.setSubject("Password Recovery");
//        message.setText("Your autogenerated password is: " + autogeneratedPassword);
//        
//        javaMailSender.send(message);
//        
//         ApiResponse response = new ApiResponse();
//         response.setView("Email sent successfully");
//        return response;
//    }
//	
	
//    @Autowired
//    private AmazonAdService amazonAdService;

   // @GetMapping("/getAmazonAd/{asin}")
//    public String getAmazonAd(@PathVariable String asin) {
//        return amazonAdService.getAmazonProductAd(asin);
//    }
}
