package jdbc;

public class ChattingDTO {
	private String user_no;
	private String other_user_no;
	private String chatr_no;
	private String chatr_content;
	private String chatr_regdate;
	private String chatr_images;
	
	public ChattingDTO() {
		// TODO Auto-generated constructor stub
	}

	public ChattingDTO(String user_no, String other_user_no, String chatr_no, String chatr_content,
			String chatr_regdate, String chatr_images) {
		super();
		this.user_no = user_no;
		this.other_user_no = other_user_no;
		this.chatr_no = chatr_no;
		this.chatr_content = chatr_content;
		this.chatr_regdate = chatr_regdate;
		this.chatr_images = chatr_images;
	}

	public String getUser_no() {
		return user_no;
	}

	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}

	public String getOther_user_no() {
		return other_user_no;
	}

	public void setOther_user_no(String other_user_no) {
		this.other_user_no = other_user_no;
	}

	public String getChatr_no() {
		return chatr_no;
	}

	public void setChatr_no(String chatr_no) {
		this.chatr_no = chatr_no;
	}

	public String getChatr_content() {
		return chatr_content;
	}

	public void setChatr_content(String chatr_content) {
		this.chatr_content = chatr_content;
	}

	public String getChatr_regdate() {
		return chatr_regdate;
	}

	public void setChatr_regdate(String chatr_regdate) {
		this.chatr_regdate = chatr_regdate;
	}

	public String getChatr_images() {
		return chatr_images;
	}

	public void setChatr_images(String chatr_images) {
		this.chatr_images = chatr_images;
	}
	
}
