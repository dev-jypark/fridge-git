package com.kosmo.fridge.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface CommunityService {
	
	boolean insertFeed(MultipartHttpServletRequest mhsr);
	boolean updateMemberImg(MultipartHttpServletRequest mhsr);	
	MemberProfileDTO selectOneMemberProfile(String id);
}
