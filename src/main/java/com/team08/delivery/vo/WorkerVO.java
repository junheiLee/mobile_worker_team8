package com.team08.delivery.vo;

public class WorkerVO {

	private int workerId;
	private String workerEmail;
	private String workerCity;
	
	public WorkerVO() {
	}
	
	public WorkerVO(int workerId, String workerEmail, String workerCity) {
		this.workerId = workerId;
		this.workerEmail = workerEmail;
		this.workerCity = workerCity;
	}


	public int getWorkerId() {
		return workerId;
	}

	public void setWorkerId(int workerId) {
		this.workerId = workerId;
	}

	public String getWorkerEmail() {
		return workerEmail;
	}

	public void setWorkerEmail(String workerEmail) {
		this.workerEmail = workerEmail;
	}

	public String getWorkerCity() {
		return workerCity;
	}

	public void setWorkerCity(String workerCity) {
		this.workerCity = workerCity;
	}
	
}
