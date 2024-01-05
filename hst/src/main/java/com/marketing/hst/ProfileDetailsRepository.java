package com.marketing.hst;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;


public interface ProfileDetailsRepository extends JpaRepository<ProfileDetails, Long> {
	
	 List<ProfileDetails> findByloginMailAndNewPassword(String loginMail, String newPassword);
	 List<ProfileDetails> findByloginMail(String loginMail);
	 
	 @Modifying
	    @Transactional
	    @Query("UPDATE ProfileDetails p SET p.newPassword = :newPassword WHERE p.loginMail = :loginMail")
	    void updatePasswordAndEmail(String newPassword, String loginMail);

	 @Modifying
	    @Transactional
	    @Query("UPDATE ProfileDetails pd SET pd.status = :status WHERE pd.profileDtlsId = :profileDtlsId")
	    void updateStatusById(Long profileDtlsId, String status);
	 
}
