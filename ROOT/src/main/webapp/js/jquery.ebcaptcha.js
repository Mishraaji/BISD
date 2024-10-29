(function($){

	jQuery.fn.ebcaptcha = function(options){

		var element = this; 
		var submit = $(this).find('input[type=submit]');
		 
		$('<center><div class="panel callout radius" style="width:300px; margin: 0 0 0 0; padding: 5 5 5 5; margin-bottom: 10px;"><label>Please verify Captcha<br/></label><br/><label id="ebcaptchatext"></label></div></center>').insertBefore(submit);

		/*$('<label id="ebcaptchatext"></label>').insertBefore(submit);*/
		$('<center><input type="text" style="width:250px;tex-align:center;" id="ebcaptchainput" placeholder="sum of above numbers ? " autocomplete="off"/>').insertBefore(submit);
		$('<input type="reset" class="secondary button medium" /></center>').insertAfter(submit);

		var input = this.find('#ebcaptchainput'); 
		var label = this.find('#ebcaptchatext'); 
		
		$(element).find('input[type=submit]').attr('disabled','disabled'); 

		
		var randomNr1 = 0; 
		var randomNr2 = 0;
		var totalNr = 0;


		randomNr1 = Math.floor(Math.random()*10);
		randomNr2 = Math.floor(Math.random()*10);
		totalNr = randomNr1 + randomNr2;
		var texti = "What is "+randomNr1+" + "+randomNr2;
		$(label).text(texti);
		
	
		$(input).keyup(function(){

			var nr = $(this).val();
			if(nr==totalNr)
			{
				$(element).find('input[type=submit]').removeAttr('disabled');				
			}
			else{
				$(element).find('input[type=submit]').attr('disabled','disabled');
			}
			
		});

		$(document).keypress(function(e)
		{
			if(e.which==13)
			{
				if((element).find('input[type=submit]').is(':disabled')==true)
				{
					e.preventDefault();
					return false;
				}
			}

		});

	};

})(jQuery);