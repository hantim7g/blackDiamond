package com.marketing.hst;
import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;


public interface ProductRepository extends JpaRepository<Product, Long> {
	
	@Query("SELECT p FROM Product p WHERE :today BETWEEN p.cmpStartDt AND p.cmpEndDt AND p.slots > 0 AND p.stopOrder =0 ORDER BY p.cmpStartDt DESC")
    List<Product> findActiveProducts(Date today);
	
	 // Fetch distinct brandName based on platform and stopOrder criteria
    @Query("SELECT DISTINCT p.brandName FROM Product p WHERE p.platform = :platform AND p.stopOrder = :stopOrderValue")
    List<String> findDistinctBrandNameByPlatformAndStopOrder(String platform, int stopOrderValue);

    @Query("SELECT DISTINCT p.brandName FROM Product p")
    List<String> findDistinctBrandName( );
    
	List<Product> findByBrandNameAndStopOrderAndPlatform(String brandName, int stopOrder,String platform);

	Product findByTitleAndBrandNameAndPlatformAndStopOrder(String title,String brandName,String platform, int stopOrder);

	
}
