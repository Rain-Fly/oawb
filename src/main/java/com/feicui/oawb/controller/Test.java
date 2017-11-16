package com.feicui.oawb.controller;

import org.apache.shiro.crypto.hash.Md5Hash;

public class Test {
	public static void main(String[] args) {
		String source = "111111";
		String salt = "byebye";
		int hashIterations = 10;
		Md5Hash md5Hash = new Md5Hash(source, salt, hashIterations);
		System.out.println(md5Hash.toString());
	}
}
