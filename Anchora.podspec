
Pod::Spec.new do |spec|

	spec.name         			= "Anchora"
	spec.version 		 		    = "4.3.1"
	spec.license      			= { :type => "MIT", :file => "LICENSE" }

  spec.platform     			= :ios, "10.0"
  spec.swift_version    	= "4.2"
	spec.framework  			 	= "UIKit" 
	spec.source_files  			= "Anchora/**/*.{swift}"

  spec.homepage    		 		= "https://github.com/AnthonyLatsis/Anchora/"
  spec.source       			= { :git => "https://github.com/AnthonyLatsis/Anchora.git", :tag => "#{spec.version}" }
  
  spec.author             = { "Anthony Latsis" => "aqamoss3fan2010@gmail.com" }
  spec.social_media_url   = "https://www.instagram.com/anthonylatsis/"
  
  spec.summary      			= "An overlay on the UIKit Auto Layout engine for expressive and terse constraints."

  spec.requires_arc 			= true
end
