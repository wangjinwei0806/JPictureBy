Pod::Spec.new do |s|


  s.name         = "JPictureBy"
  s.version      = "1.0.0"
  s.summary      = "JPictureBy"

  s.description  = <<-DESC
                   图片轮播框架,耦合度小  
                   DESC

  s.homepage     = "https://github.com/wangjinwei0806/JPictureBy"

  s.license      = "MIT"

  s.author       = { "wangjinwei" => "21418925@qq.com" }
  s.platform     = :ios, "6.0"

  s.source       = { :git => "https://github.com/wangjinwei0806/JPictureBy.git", :tag => s.version.to_s }

  s.source_files = "JPictureBy/*"
  s.requires_arc = true

end