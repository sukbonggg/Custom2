package com.CusTomSoft.demo.service;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.CusTomSoft.demo.dto.ApiDto;
import com.CusTomSoft.demo.mapper.BatchMapper;
import com.CusTomSoft.demo.mapper.BoardMapper;

@Service
public class BatchService {
   
	@Autowired
	private BatchMapper batchmapper;
	
	@Scheduled(cron ="0 0/5 * * * ?")
	public void show() {
		System.out.println("QQQQ");
		batchmapper.show();
	}
 
}
   

