package com.project.POJO;
/**
 * Câu hỏi, thắc mắc phản hồi của nhà hàng, người dùng tới website
 * @author VietAnh
 *
 */
public class Question {
	private String idQuestion;
	private String name;
	private String content;
	private String mailContact;
	private String timeCreate;
	private int subject; //Đối tượng người dùng gửi yêu cầu: 1 - khách hàng, 2 - nhà hàng, 0 chưa xác định
	public String getIdQuestion() {
		return idQuestion;
	}
	public void setIdQuestion(String idQuestion) {
		this.idQuestion = idQuestion;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMailContact() {
		return mailContact;
	}
	public void setMailContact(String mailContact) {
		this.mailContact = mailContact;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTimeCreate() {
		return timeCreate;
	}
	public void setTimeCreate(String timeCreate) {
		this.timeCreate = timeCreate;
	}
	public int getSubject() {
		return subject;
	}
	public void setSubject(int subject) {
		this.subject = subject;
	}
}
