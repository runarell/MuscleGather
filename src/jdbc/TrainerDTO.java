package jdbc;

public class TrainerDTO extends UserDTO{
	private String trainer_no;
	private String trainer_title;
	private String trainer_content;
	private String trainer_secret;
	private String trainer_addr;
	private String trainer_regdate;
	private String trainer_images;
	
	public TrainerDTO() {}
	
	// DB - DAO
	public TrainerDTO(String user_no, String user_name, String user_pw, String user_birth, String user_zipcode,
			String user_addr, String user_addrderail, String user_gender, String user_email, String user_phone,
			String user_admin, String user_kakao, String user_auth, String user_status,
			
			String trainer_no, String trainer_title, String trainer_content, String trainer_secret,
			String trainer_addr, String trainer_regdate, String trainer_images) {
		
		super(user_no, user_name, user_pw, user_birth, user_zipcode,
				user_addr, user_addrderail, user_gender, user_email, user_phone,
				user_admin, user_kakao, user_auth, user_status);
		
		this.trainer_no = trainer_no;
		this.trainer_title = trainer_title;
		this.trainer_content = trainer_content;
		this.trainer_secret = trainer_secret;
		this.trainer_addr = trainer_addr;
		this.trainer_regdate = trainer_regdate;
		this.trainer_images = trainer_images;
	}
	// DAO - DB
	public TrainerDTO(String user_name, String user_pw, String user_birth, String user_zipcode,
			String user_addr, String user_addrderail, String user_gender, String user_email, String user_phone,
			String user_admin, String user_kakao, String user_auth, String user_status,
			
			String trainer_title, String trainer_content, String trainer_addr, String trainer_secret, String trainer_images) {
		
		super(user_name, user_pw, user_birth, user_zipcode,
				user_addr, user_addrderail, user_gender, user_email, user_phone,
				user_admin, user_kakao, user_auth, user_status);
		
		this.trainer_title = trainer_title;
		this.trainer_content = trainer_content;
		this.trainer_addr = trainer_addr;
		this.trainer_secret = trainer_secret;
		this.trainer_images = trainer_images;
	}

	public String getTrainer_no() {
		return trainer_no;
	}

	public void setTrainer_no(String trainer_no) {
		this.trainer_no = trainer_no;
	}

	public String getTrainer_title() {
		return trainer_title;
	}

	public void setTrainer_title(String trainer_title) {
		this.trainer_title = trainer_title;
	}

	public String getTrainer_content() {
		return trainer_content;
	}

	public void setTrainer_content(String trainer_content) {
		this.trainer_content = trainer_content;
	}

	public String getTrainer_secret() {
		return trainer_secret;
	}

	public void setTrainer_secret(String trainer_secret) {
		this.trainer_secret = trainer_secret;
	}

	public String getTrainer_addr() {
		return trainer_addr;
	}

	public void setTrainer_addr(String trainer_addr) {
		this.trainer_addr = trainer_addr;
	}

	public String getTrainer_regdate() {
		return trainer_regdate;
	}

	public void setTrainer_regdate(String trainer_regdate) {
		this.trainer_regdate = trainer_regdate;
	}

	public String getTrainer_images() {
		return trainer_images;
	}

	public void setTrainer_images(String trainer_images) {
		this.trainer_images = trainer_images;
	}

	
	
}
