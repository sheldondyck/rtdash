$(document).ready(function() {
		$("div.product_text_2").hide(); 
		$("div.product_text_3").hide(); 
		$("a.product_feature_1").click(function() { 
			$("div.product_text_2").hide(); 
			$("div.product_text_3").hide(); 
			$("div.product_text_1").show(); 
		});
		$("a.product_feature_2").click(function() { 
			$("div.product_text_1").hide(); 
			$("div.product_text_3").hide(); 
			$("div.product_text_2").show(); 
		});
		$("a.product_feature_3").click(function() { 
			$("div.product_text_1").hide(); 
			$("div.product_text_2").hide(); 
			$("div.product_text_3").show(); 
		});
});