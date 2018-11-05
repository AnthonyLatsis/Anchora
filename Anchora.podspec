
Pod::Spec.new do |spec|

	spec.name         			= "Anchora"
	spec.version 		 		    = "4.2.4"
	spec.license      			= { :type => "MIT", :file => "LICENSE" }

  spec.platform     			= :ios, "10.0"
  spec.swift_version      = "4.1"
 	spec.framework  			  = "UIKit" 
	spec.source_files  			= "Anchora/**/*.{swift}"

  spec.homepage    		 		= "https://github.com/AnthonyLatsis/Anchora/"
  spec.source       			= { :git => "https://github.com/AnthonyLatsis/Anchora.git", :tag => "#{spec.version}" }
  
  spec.author             = { "Anthony Latsis" => "aqamoss3fan2010@gmail.com" }
  spec.social_media_url   = "https://www.instagram.com/anthonylatsis/"
  
  spec.summary      			= "A small framework that abstracts over UIKit's Auto Layout engine in a native style to tidy up your constraints."

  spec.requires_arc 			= true

  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
end
