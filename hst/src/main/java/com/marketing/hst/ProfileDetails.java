package com.marketing.hst;


import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "profile_dtls")
public class ProfileDetails {

	private String profilePicPath;
	public String getProfilePicView() {
		return profilePicView;
	}

	public void setProfilePicView(String profilePicView) {
		this.profilePicView = profilePicView;
	}

	public String getQrView() {
		return qrView;
	}

	public void setQrView(String qrView) {
		this.qrView = qrView;
	}

	private String profilePicView;
	private String qrView;
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "profile_dtls_id")
    private Long profileDtlsId;

    @Column(name = "loginMail", length = 100)
    private String loginMail;

    @Column(name = "newPassword", length = 100)
    private String newPassword;

    @Column(name = "firstName", length = 50)
    private String firstName;

    @Column(name = "lastName", length = 50)
    private String lastName;

    @Column(name = "whatsappNumber", length = 20)
    private String whatsappNumber;

    @Lob
    @Column(name = "profilePicture")
    private byte[] profilePicture;

    @Column(name = "joinDate")
    @Temporal(TemporalType.DATE)
    private Date joinDate;

    @Column(name = "paidOrders")
    private Long paidOrders;

    @Column(name = "totalOrders")
    private Long totalOrders;

    @Column(name = "paytm", length = 20)
    private String paytm;

    @Column(name = "upi", length = 50)
    private String upi;

    @Lob
    @Column(name = "qrPicture")
    private byte[] qrPicture;

    @Column(name = "accHolderName", length = 50)
    private String accHolderName;

    @Column(name = "accNo", length = 50)
    private String accNo;

    @Column(name = "ifsc", length = 50)
    private String ifsc;

    @Column(name = "status", length = 20)
    private String status;

    @Column(name = "role", length = 20)
    private String role;

	public Long getProfileDtlsId() {
		return profileDtlsId;
	}

	public void setProfileDtlsId(Long profileDtlsId) {
		this.profileDtlsId = profileDtlsId;
	}

	public String getLoginMail() {
		return loginMail;
	}

	public void setLoginMail(String loginMail) {
		this.loginMail = loginMail;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getWhatsappNumber() {
		return whatsappNumber;
	}

	public void setWhatsappNumber(String whatsappNumber) {
		this.whatsappNumber = whatsappNumber;
	}

	public byte[] getProfilePicture() {
		return profilePicture;
	}

	public void setProfilePicture(byte[] profilePicture) {
		this.profilePicture = profilePicture;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public Long getPaidOrders() {
		return paidOrders;
	}

	public void setPaidOrders(Long paidOrders) {
		this.paidOrders = paidOrders;
	}

	public Long getTotalOrders() {
		return totalOrders;
	}

	public void setTotalOrders(Long totalOrders) {
		this.totalOrders = totalOrders;
	}

	public String getPaytm() {
		return paytm;
	}

	public void setPaytm(String paytm) {
		this.paytm = paytm;
	}

	public String getUpi() {
		return upi;
	}

	public void setUpi(String upi) {
		this.upi = upi;
	}

	public byte[] getQrPicture() {
		return qrPicture;
	}

	public void setQrPicture(byte[] qrPicture) {
		this.qrPicture = qrPicture;
	}

	public String getAccHolderName() {
		return accHolderName;
	}

	public void setAccHolderName(String accHolderName) {
		this.accHolderName = accHolderName;
	}

	public String getAccNo() {
		return accNo;
	}

	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}

	public String getIfsc() {
		return ifsc;
	}

	public void setIfsc(String ifsc) {
		this.ifsc = ifsc;
	}

	public String getProfilePicPath() {
		return profilePicPath;
	}

	public void setProfilePicPath(String profilePicPath) {
		this.profilePicPath = profilePicPath;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

    // Constructors, getters, setters, etc.
}
