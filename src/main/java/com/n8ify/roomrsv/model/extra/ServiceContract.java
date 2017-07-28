package com.n8ify.roomrsv.model.extra;

public class ServiceContract {
	private String location;
	private String officerTel;
	private String email;
	
	public ServiceContract() {
		this("Operating Address", "+66548044577", "example@mail.com");
	}

	public ServiceContract(String location, String officerTel, String email) {
		super();
		this.location = location;
		this.officerTel = officerTel;
		this.email = email;
	}

	public String getLocation() {
		return location;
	}



	public void setLocation(String location) {
		this.location = location;
	}



	public String getOfficerTel() {
		return officerTel;
	}



	public void setOfficerTel(String officerTel) {
		this.officerTel = officerTel;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	@Override
	public String toString() {
		return "ServiceCenter [location=" + location + ", officerTel=" + officerTel + ", email=" + email + "]";
	}
	
	
}
