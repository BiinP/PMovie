package com.pmovie.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

public class test {
	public static void main(String[] args) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		String datefm = sdf.format(date);
//		String month = date.getMonth();
		String month = datefm.substring(3, 5);
		System.out.println(month);
	}
}

//i = 0 
//j = 0 a[0] = 5 != 0 giatri = 0 bieudo[0] = 0
//j = 1 a[1] = 1 == 1 bieudo[1] = 1
//j = 2 a[0] = 2