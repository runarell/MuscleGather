package jdbc;

public class UserDTO {
	private String user_no;
	private String user_name;
	private String user_pw;
	private String user_birth;
	private String user_zipcode;
	private String user_addr;
	private String user_addrdetail;
	private String user_gender;
	private String user_email;
	private String user_phone;
	private String user_admin;
	private String user_kakao;
	private String user_auth;
	private String user_status;
		
	public UserDTO() {
		
	}
	//loging cheack
	public UserDTO(String user_no, String user_pw, String user_email, String user_admin) {
		this.user_no = user_no;
		this.user_pw = user_pw;
		this.user_email = user_email;
		this.user_admin = user_admin;
	}
	//DB - DAO ( 전체 가자오기 )
	public UserDTO(String user_no, String user_name, String user_pw, String user_birth, String user_zipcode,
			String user_addr, String user_addrdetail, String user_gender, String user_email, String user_phone,
			String user_admin, String user_kakao, String user_auth, String user_status) {

		this.user_no = user_no;
		this.user_name = user_name;
		this.user_pw = user_pw;
		this.user_birth = user_birth;
		this.user_zipcode = user_zipcode;
		this.user_addr = user_addr;
		this.user_addrdetail = user_addrdetail;
		this.user_gender = user_gender;
		this.user_email = user_email;
		this.user_phone = user_phone;
		this.user_admin = user_admin;
		this.user_kakao = user_kakao;
		this.user_auth = user_auth;
		this.user_status = user_status;
	}
	//DAO - DB
		public UserDTO(String user_name, String user_pw, String user_birth, String user_zipcode,
				String user_addr, String user_addrdetail, String user_gender, String user_email, String user_phone,
				String user_admin, String user_kakao, String user_auth, String user_status) {

			this.user_name = user_name;
			this.user_pw = user_pw;
			this.user_birth = user_birth;
			this.user_zipcode = user_zipcode;
			this.user_addr = user_addr;
			this.user_addrdetail = user_addrdetail;
			this.user_gender = user_gender;
			this.user_email = user_email;
			this.user_phone = user_phone;
			this.user_admin = user_admin;
			this.user_kakao = user_kakao;
			this.user_auth = user_auth;
			this.user_status = user_status;
		}
	
	public String getUser_no() {
		return user_no;
	}
	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}
	public String getUser_zipcode() {
		return user_zipcode;
	}
	public void setUser_zipcode(String user_zipcode) {
		this.user_zipcode = user_zipcode;
	}
	public String getUser_addr() {
		return user_addr;
	}
	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}
	public String getUser_addrderail() {
		return user_addrdetail;
	}
	public void setUser_addrderail(String user_addrdetail) {
		this.user_addrdetail = user_addrdetail;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_admin() {
		return user_admin;
	}
	public void setUser_admin(String user_admin) {
		this.user_admin = user_admin;
	}
	public String getUser_kakao() {
		return user_kakao;
	}
	public void setUser_kakao(String user_kakao) {
		this.user_kakao = user_kakao;
	}
	public String getUser_auth() {
		return user_auth;
	}
	public void setUser_auth(String user_auth) {
		this.user_auth = user_auth;
	}
	public String getUser_status() {
		return user_status;
	}
	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}
	
	
	
	
}
