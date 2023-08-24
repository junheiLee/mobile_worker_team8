package com.team08.delivery.vo;

public class DeliveryVO {

	private int deliveryId;
	private int workerId;
	private String status;
	private String cSignature;
	private String cIdentifier;
	private String cAddress;
	private String cCity;
	private String cState;
	private String cZip;
	private String customer;
	private String product; 
	private String productUrl;
	private String comments;
	
	public DeliveryVO() {
	}

	public int getDeliveryId() {
		return deliveryId;
	}

	public void setDeliveryId(int deliveryId) {
		this.deliveryId = deliveryId;
	}

	public int getWorkerId() {
		return workerId;
	}

	public void setWorkerId(int workerId) {
		this.workerId = workerId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getcSignature() {
		return cSignature;
	}

	public void setcSignature(String cSignature) {
		this.cSignature = cSignature;
	}

	public String getcIdentifier() {
		return cIdentifier;
	}

	public void setcIdentifier(String cIdentifier) {
		this.cIdentifier = cIdentifier;
	}

	public String getcAddress() {
		return cAddress;
	}

	public void setcAddress(String cAddress) {
		this.cAddress = cAddress;
	}

	public String getcCity() {
		return cCity;
	}

	public void setcCity(String cCity) {
		this.cCity = cCity;
	}

	public String getcState() {
		return cState;
	}

	public void setcState(String cState) {
		this.cState = cState;
	}

	public String getcZip() {
		return cZip;
	}

	public void setcZip(String cZip) {
		this.cZip = cZip;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getProductUrl() {
		return productUrl;
	}

	public void setProductUrl(String productUrl) {
		this.productUrl = productUrl;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
	
}
