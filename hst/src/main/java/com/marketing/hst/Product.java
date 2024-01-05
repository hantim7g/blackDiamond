package com.marketing.hst;


import java.util.Date;
import java.util.List;

import jakarta.persistence.*;

@Entity
@Table(name = "products")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Long profileDtlsId;
    private String title;
    private String imageURL;
    private Double price;
    private String buyNowUrl;
    private String asin;
    private String seller;
    private int slots;
    private int stopOrder=0;
    private int totalSlots;
    private String brandName;
    private String platform;
    private String dealType;
  
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "product_id", referencedColumnName = "id")
    private List<PairDataDto> description;
    @Temporal(TemporalType.DATE) // Optional if you want only date without time
    private Date cmpStartDt;
    
    @Temporal(TemporalType.DATE) // Optional if you want only date without time
    private Date cmpEndDt;
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getBuyNowUrl() {
		return buyNowUrl;
	}

	public void setBuyNowUrl(String buyNowUrl) {
		this.buyNowUrl = buyNowUrl;
	}

	public String getAsin() {
		return asin;
	}

	public void setAsin(String asin) {
		this.asin = asin;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public int getSlots() {
		return slots;
	}

	public void setSlots(int slots) {
		this.slots = slots;
	}

	public List<PairDataDto> getDescription() {
		return description;
	}

	public void setDescription(List<PairDataDto> description) {
		this.description = description;
	}

	public Long getProfileDtlsId() {
		return profileDtlsId;
	}

	public void setProfileDtlsId(Long profileDtlsId) {
		this.profileDtlsId = profileDtlsId;
	}

	public int getTotalSlots() {
		return totalSlots;
	}

	public void setTotalSlots(int totalSlots) {
		this.totalSlots = totalSlots;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public Date getCmpStartDt() {
		return cmpStartDt;
	}

	public void setCmpStartDt(Date cmpStartDt) {
		this.cmpStartDt = cmpStartDt;
	}

	public Date getCmpEndDt() {
		return cmpEndDt;
	}

	public void setCmpEndDt(Date cmpEndDt) {
		this.cmpEndDt = cmpEndDt;
	}

	public int getStopOrder() {
		return stopOrder;
	}

	public void setStopOrder(int stopOrder) {
		this.stopOrder = stopOrder;
	}

	public String getPlatform() {
		return platform;
	}

	public void setPlatform(String platform) {
		this.platform = platform;
	}

	public String getDealType() {
		return dealType;
	}

	public void setDealType(String dealType) {
		this.dealType = dealType;
	}

    // Getters, setters, and other methods
}
