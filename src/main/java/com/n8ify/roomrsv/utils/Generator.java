package com.n8ify.roomrsv.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.jdbc.core.JdbcTemplate;

public class Generator {
	private static Generator accessUtils;

	private JdbcTemplate jdbcTemplate;

	public static Generator getInstance() {
		if (accessUtils == null) {
			accessUtils = new Generator();
		}
		return accessUtils;
	}


	// In the beginning is the words and the words made the world when the word
	// end the world end.
	private final String SALT_SOME = "allKiNdoFEVeRyThINGs";

	public String genMd5(String str) {
		MessageDigest md5 = null;
		try {
			md5 = MessageDigest.getInstance("md5");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		md5.update(SALT_SOME.getBytes());
		StringBuilder pwdBuilder = new StringBuilder();
		for (byte b : md5.digest(str.getBytes())) {
			pwdBuilder.append(String.format("%02x", b & 0xff));
		}
		return pwdBuilder.toString();
	}

}
