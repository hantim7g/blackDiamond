package com.marketing.hst;


import java.util.Date;
import java.util.List;

import jakarta.persistence.*;


@Entity
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "profile_dtls_id")
    private Long profileDtlsId;
    
    @Column(name = "viewer")
    private String viewer;

    @Column(name = "order_status")
    private String orderStatus;

    @Column(name = "affiliate_status")
    private String affiliateStatus;

    @Column(name = "buyer_name")
    private String buyerName;

    @Column(name = "platform")
    private String platform;

    @Column(name = "brand_name")
    private String brandName;

    @Column(name = "product")
    private String product;

    @Column(name = "deal_type")
    private String dealType;

    @Column(name = "order_id")
    private String orderId;

    @Column(name = "order_date")
    @Temporal(TemporalType.DATE)
    private Date orderDate;

    @Column(name = "order_amount")
    private Double orderAmount;
    @Column(name = "Refund_amount")
    private Double refundAmount;
    @Column(name = "Deal_Price")
    private Double dealPrice;
    
    

    @Column(name = "afflicate_Comment")
    private String afflicateComment;

    @Column(name = "order_ss_path")
    private String orderScreenshot;

    @Column(name = "review_ss_path")
    private String reviewScreenshot;

    
    private byte[] sellerFdScreenshotPreview;

    @Column(name = "seller_fd_ss_path")
    private String sellerFdScreenshot;

    
    private byte[] orderScreenshotPreview;
    
    private byte[] reviewScreenshotPreview;

    @Column(name = "review_link")
    private String reviewLink;

    @Column(name = "disclaimer_true")
    private boolean disclaimerCheckbox;
    
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getProfileDtlsId() {
		return profileDtlsId;
	}

	public void setProfileDtlsId(Long profileDtlsId) {
		this.profileDtlsId = profileDtlsId;
	}

	public String getViewer() {
		return viewer;
	}

	public void setViewer(String viewer) {
		this.viewer = viewer;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getAffiliateStatus() {
		return affiliateStatus;
	}

	public void setAffiliateStatus(String affiliateStatus) {
		this.affiliateStatus = affiliateStatus;
	}

	public String getBuyerName() {
		return buyerName;
	}

	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}

	public String getPlatform() {
		return platform;
	}

	public void setPlatform(String platform) {
		this.platform = platform;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getDealType() {
		return dealType;
	}

	public void setDealType(String dealType) {
		this.dealType = dealType;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Double getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(Double orderAmount) {
		this.orderAmount = orderAmount;
	}

	public String getOrderScreenshot() {
		return orderScreenshot;
	}

	public void setOrderScreenshot(String orderScreenshot) {
		this.orderScreenshot = orderScreenshot;
	}

	public String getReviewScreenshot() {
		return reviewScreenshot;
	}

	public void setReviewScreenshot(String reviewScreenshot) {
		this.reviewScreenshot = reviewScreenshot;
	}

	public byte[] getSellerFdScreenshotPreview() {
		return sellerFdScreenshotPreview;
	}

	public void setSellerFdScreenshotPreview(byte[] sellerFdScreenshotPreview) {
		this.sellerFdScreenshotPreview = sellerFdScreenshotPreview;
	}

	public String getSellerFdScreenshot() {
		return sellerFdScreenshot;
	}

	public void setSellerFdScreenshot(String sellerFdScreenshot) {
		this.sellerFdScreenshot = sellerFdScreenshot;
	}

	public byte[] getOrderScreenshotPreview() {
		return orderScreenshotPreview;
	}

	public void setOrderScreenshotPreview(byte[] orderScreenshotPreview) {
		this.orderScreenshotPreview = orderScreenshotPreview;
	}

	public byte[] getReviewScreenshotPreview() {
		return reviewScreenshotPreview;
	}

	public void setReviewScreenshotPreview(byte[] reviewScreenshotPreview) {
		this.reviewScreenshotPreview = reviewScreenshotPreview;
	}

	public String getReviewLink() {
		return reviewLink;
	}

	public void setReviewLink(String reviewLink) {
		this.reviewLink = reviewLink;
	}

	public boolean isDisclaimerCheckbox() {
		return disclaimerCheckbox;
	}

	public void setDisclaimerCheckbox(boolean disclaimerCheckbox) {
		this.disclaimerCheckbox = disclaimerCheckbox;
	}

	public Double getRefundAmount() {
		return refundAmount;
	}

	public void setRefundAmount(Double refundAmount) {
		this.refundAmount = refundAmount;
	}

	public Double getDealPrice() {
		return dealPrice;
	}

	public void setDealPrice(Double dealPrice) {
		this.dealPrice = dealPrice;
	}

	public String getAfflicateComment() {
		return afflicateComment;
	}

	public void setAfflicateComment(String afflicateComment) {
		this.afflicateComment = afflicateComment;
	}
    
    
}
