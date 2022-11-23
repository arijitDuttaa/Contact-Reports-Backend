package com.mnao.mfp.common.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@CrossOrigin(origins = "*")
@RequestMapping("/LandingPage/")

public class MFPLandipPageController {
    @GetMapping(value = "/Startup", produces = MediaType.TEXT_HTML_VALUE)
    @ResponseBody
    public String welcomeAsHTML() {
        return htmlStartup;
    }
    String htmlStartup = "<!DOCTYPE html>\r\n"
    		+ "<html>\r\n"
    		+ "<head>\r\n"
    		+ "<meta charset=\"ISO-8859-1\">\r\n"
    		+ "<title>Contact Reports</title>\r\n"
    		+ "<script type=\"text/javascript\">\r\n"
    		+ "	var callbackOnReady = function() {\r\n"
    		+ "		var hst = location.host;\r\n"
    		+ "		var crUrl = location.protocol + \"//\" + hst + \"/m220/mfpwebui\";\r\n"
    		+ "		var pth = location.pathname;\r\n"
    		+ "		if( hst.startsWith(\"localhost\") ) {\r\n"
    		+ "			crUrl = location.protocol + \"//\" + \"localhost:4200\";\r\n"
    		+ "		} else {\r\n"
    		+ "			var pthPrefix = pth.substr(0,6)\r\n"
    		+ "			crUrl = location.protocol + \"//\" + hst + pthPrefix + \"mfpwebui\";\r\n"
    		+ "		}\r\n"
    		+ "		// Look at arguments\r\n"
    		+ "		const queryString = window.location.search;\r\n"
    		+ "		console.log(queryString);\r\n"
    		+ "		const urlParams = new URLSearchParams(queryString);\r\n"
    		+ "		if( urlParams.has('viewCR')) {\r\n"
    		+ "			var viewCR = urlParams.get('viewCR')\r\n"
    		+ "			viewCR = viewCR.replace(/_/g, '/');\r\n"
    		+ "			crUrl += '/' + viewCR;\r\n"
    		+ "		}\r\n"
    		+ "		var txt = document.getElementById(\"txtUrl\");\r\n"
    		+ "		txt.value = crUrl;\r\n"
    		+ "		if( urlParams.has('waitms')) {\r\n"
    		+ "			const wms = urlParams.get('waitms')\r\n"
    		+ "			autoReload(wms);\r\n"
    		+ "		}\r\n"
    		+ "	};\r\n"
    		+ "	\r\n"
    		+ "	function sleep(ms) {\r\n"
    		+ "	   return new Promise(resolve => setTimeout(resolve, ms));\r\n"
    		+ "	}\r\n"
    		+ "	   \r\n"
    		+ "	 async function autoReload(wms) {\r\n"
    		+ "		console.log(\"Reloading in \" + wms + \" ms.\");\r\n"
    		+ "		if( wms > 0 ) {\r\n"
    		+ "			await sleep(wms);\r\n"
    		+ "			doRedirect();\r\n"
    		+ "		}\r\n"
    		+ "	\r\n"
    		+ "	}\r\n"
    		+ "	//\r\n"
    		+ "	function doRedirect() {\r\n"
    		+ "		var txt = document.getElementById(\"txtUrl\");\r\n"
    		+ "		var tgt = txt.value;\r\n"
    		+ "		if (tgt && tgt.trim().length > 0) {\r\n"
    		+ "			deleteAllCookies();\r\n"
    		+ "			location.replace(tgt);\r\n"
    		+ "		}\r\n"
    		+ "	}\r\n"
    		+ "	//\r\n"
    		+ "	function deleteAllCookies() {\r\n"
    		+ "		var cookies = document.cookie.split(\";\");\r\n"
    		+ "	\r\n"
    		+ "		for (var i = 0; i < cookies.length; i++) {\r\n"
    		+ "			var cookie = cookies[i];\r\n"
    		+ "			var eqPos = cookie.indexOf(\"=\");\r\n"
    		+ "			var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;\r\n"
    		+ "			if( name.toUpperCase() === \"MFPUSRTOK\") {\r\n"
    		+ "				console.log('Removing Cookie:' + name);\r\n"
    		+ "				document.cookie = name + \"=;expires=Thu, 01 Jan 1970 00:00:00 GMT\";\r\n"
    		+ "			}\r\n"
    		+ "		}\r\n"
    		+ "	}\r\n"
    		+ "	function doReload() {\r\n"
    		+ "		location.reload();\r\n"
    		+ "	}\r\n"
    		+ "	\r\n"
    		+ "	if (document.readyState === \"complete\"\r\n"
    		+ "			|| (document.readyState !== \"loading\" && !document.documentElement.doScroll)) {\r\n"
    		+ "		callbackOnReady();\r\n"
    		+ "	} else {\r\n"
    		+ "		document.addEventListener(\"DOMContentLoaded\", callbackOnReady);\r\n"
    		+ "	}\r\n"
    		+ "</script>\r\n"
    		+ "</head>\r\n"
    		+ "<body>\r\n"
    		+ "	<h1>Welcome to Dealer Contact Reports</h1>\r\n"
    		+ "	<div id=\"mainDiv\" style=\"display:none\">\r\n"
    		+ "		<input type=\"text\" style=\"min-width: 400px\" id=\"txtUrl\" />\r\n"
    		+ "		<br>\r\n"
    		+ "		<br> \r\n"
    		+ "		<input type=\"button\" id=\"redirect\" value=\"Click to proceed\"\r\n"
    		+ "			onClick=\"doRedirect()\" /> \r\n"
    		+ "		<br> \r\n"
    		+ "		<br> \r\n"
    		+ "		<input type=\"button\"\r\n"
    		+ "			id=\"reload\" value=\"document.reload()\"\r\n"
    		+ "			onClick=\"doReload()\" />\r\n"
    		+ "	</div>\r\n"
    		+ "</body>\r\n"
    		+ "</html>";
}