package com.marketing.hst;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "order_dtls")
public class OrderDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long orderDetailsId;
    private Long profileDtlsId;
    private String orderStatus;
    private String refundStatus;
    private String dealType;
    private String mediator;
    private String reviewerName;
    private Date orderDate;
    private String orderId;
    private String brand;
    private String product;
    private Double orderAmount;
    private Double refundAmount;
    private String orderImageUrl;
    private String refundImageUrl;
    private String refundLink;
	
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getRefundStatus() {
		return refundStatus;
	}
	public void setRefundStatus(String refundStatus) {
		this.refundStatus = refundStatus;
	}
	public String getDealType() {
		return dealType;
	}
	public void setDealType(String dealType) {
		this.dealType = dealType;
	}
	public String getMediator() {
		return mediator;
	}
	public void setMediator(String mediator) {
		this.mediator = mediator;
	}
	public String getReviewerName() {
		return reviewerName;
	}
	public void setReviewerName(String reviewerName) {
		this.reviewerName = reviewerName;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public Double getOrderAmount() {
		return orderAmount;
	}
	public void setOrderAmount(Double orderAmount) {
		this.orderAmount = orderAmount;
	}
	public Double getRefundAmount() {
		return refundAmount;
	}
	public void setRefundAmount(Double refundAmount) {
		this.refundAmount = refundAmount;
	}
	public String getOrderImageUrl() {
		return orderImageUrl;
	}
	public void setOrderImageUrl(String orderImageUrl) {
		this.orderImageUrl = orderImageUrl;
	}
	public String getRefundImageUrl() {
		return refundImageUrl;
	}
	public void setRefundImageUrl(String refundImageUrl) {
		this.refundImageUrl = refundImageUrl;
	}
	public String getRefundLink() {
		return refundLink;
	}
	public void setRefundLink(String refundLink) {
		this.refundLink = refundLink;
	}
	public Long getOrderDetailsId() {
		return orderDetailsId;
	}
	public void setOrderDetailsId(Long orderDetailsId) {
		this.orderDetailsId = orderDetailsId;
	}
	public Long getProfileDtlsId() {
		return profileDtlsId;
	}
	public void setProfileDtlsId(Long profileDtlsId) {
		this.profileDtlsId = profileDtlsId;
	}

    // getters, setters, and other necessary methods
}