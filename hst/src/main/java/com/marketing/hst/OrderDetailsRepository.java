package com.marketing.hst;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderDetailsRepository extends JpaRepository<Order, Long> {
	
//	 List<ProfileDetails> findByloginMailAndNewPassword(String loginMail, String newPassword);
	 Optional<Order> findByOrderId(String orderId);
	 ArrayList<Order> findAllByProfileDtlsId(String profileDtlsId);

//	List<Order> findByCriteria(String string, String string2, String string3, String string4, String string5,
//			String string6, String string7);
//	 
	 

}
