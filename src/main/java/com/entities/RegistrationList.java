package com.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class RegistrationList {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int teamid;
	private String teamname;
	private String player1;
	private String player2;
	private String player3;
	private String player4;
	private String player1id;
	private String player2id;
	private String player3id;
	private String player4id;
	private int formid;
	private int userid;
	private String whatsapp;
	private String transactionid;
	private String referid;
	private String status;
	private String payment;

	public RegistrationList(String teamname, String player1, String player2, String player3, String player4,
			String player1id, String player2id, String player3id, String player4id, int formid, String whatsapp, int userid,
			String transactionid, String referid, String status, String payment) {
		super();
		this.teamname = teamname;
		this.player1 = player1;
		this.player2 = player2;
		this.player3 = player3;
		this.player4 = player4;
		this.player1id = player1id;
		this.player2id = player2id;
		this.player3id = player3id;
		this.player4id = player4id;
		this.formid = formid;
		this.whatsapp = whatsapp;
		this.userid = userid;
		this.transactionid = transactionid;
		this.referid = referid;
		this.status=status;
		this.payment=payment;
	}

	public RegistrationList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getTeamid() {
		return teamid;
	}

	public void setTeamid(int teamid) {
		this.teamid = teamid;
	}

	public String getTeamname() {
		return teamname;
	}

	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}

	public String getPlayer1() {
		return player1;
	}

	public void setPlayer1(String player1) {
		this.player1 = player1;
	}

	public String getPlayer2() {
		return player2;
	}

	public void setPlayer2(String player2) {
		this.player2 = player2;
	}

	public String getPlayer3() {
		return player3;
	}

	public void setPlayer3(String player3) {
		this.player3 = player3;
	}

	public String getPlayer4() {
		return player4;
	}

	public void setPlayer4(String player4) {
		this.player4 = player4;
	}

	public String getPlayer1id() {
		return player1id;
	}

	public void setPlayer1id(String player1id) {
		this.player1id = player1id;
	}

	public String getPlayer2id() {
		return player2id;
	}

	public void setPlayer2id(String player2id) {
		this.player2id = player2id;
	}

	public String getPlayer3id() {
		return player3id;
	}

	public void setPlayer3id(String player3id) {
		this.player3id = player3id;
	}

	public String getPlayer4id() {
		return player4id;
	}

	public void setPlayer4id(String player4id) {
		this.player4id = player4id;
	}

	public int getFormid() {
		return formid;
	}

	public void setFormid(int formid) {
		this.formid = formid;
	}

	public String getWhatsapp() {
		return whatsapp;
	}

	public void setWhatsapp(String whatsapp) {
		this.whatsapp = whatsapp;
	}

	public String getTransactionid() {
		return transactionid;
	}

	public void setTransactionid(String transactionid) {
		this.transactionid = transactionid;
	}

	public String getReferid() {
		return referid;
	}

	public void setReferid(String referid) {
		this.referid = referid;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}
	
}
