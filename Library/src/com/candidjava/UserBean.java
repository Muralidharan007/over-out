package com.candidjava;

public class UserBean {
	
	 private String username;
     private String password;
     private String urole;
     public boolean valid;	
     private int userid;
     public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public boolean checkRole() {
    	 if(urole.equals("student"))
         {
    		 return true;
         }
    	 if(urole.equals("admin"))
    	 {
    		 return false;
    	 }
		return valid;
 	}

     public String getPassword() {
        return password;
	}

     public void setPassword(String newPassword) {
        password = newPassword;
	}
	
			
     public String getUsername() {
        return username;
			}

     public void setUserName(String newUsername) {
        username = newUsername;
			}
     
     public String getRole() {
         return urole;
 			}

      public void setRole(String role) {
         urole = role;
 			}
				
     public boolean isValid() {
        return valid;
	}

     public void setValid(boolean newValid) {
        valid = newValid;
	}	

}
