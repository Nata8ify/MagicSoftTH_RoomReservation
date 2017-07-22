package com.n8ify.roomrsv.utils;

public class Attrs {

	public static enum getAdminDestinationAttr {
		dashboard, report, roommng, facilimng, setting
	}
	
	public static enum getOptionAttr {
		to, include, formObj
	};
	
	public static enum getPathAttr {
		to, include, formObj
	};

	public static String ADMIN_SIGNIN = "adm/admlogin";
	public static String ADMIN_HOME = "adm/admhome";
	public static String HOME = "redirect:/";
	
	public static String ROLE_ADMIN = "a";
	public static String ROLE_NO = null;
}
