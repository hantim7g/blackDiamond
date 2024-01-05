package com.marketing.hst;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface PlatformRepository extends JpaRepository<PlatformType, Long> {

	List<PlatformType> findByStatus(String status);
	
	
}
