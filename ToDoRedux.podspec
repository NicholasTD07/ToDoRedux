Pod::Spec.new do |s|
  s.name         = "ToDoRedux"
  s.version      = "1.0"
  s.summary      = "A framework for a ToDo app, powered by TDRedux."
  s.description  = <<-DESC
    A framework for a ToDo app, powered by TDRedux.
    Also an example framework to showcase TDRedux.
                   DESC

  s.homepage     = "https://github.com/NicholasTD07/ToDoRedux"


  s.license      = { :type => "MIT", :file => "LICENSE" }


  s.author             = { "Nicholas T." => "Nicholas.TD07@gmail.com" }
  s.social_media_url   = "https://twitter.com/NicholasTD07"

  s.source       = {
    :git => "https://github.com/NicholasTD07/ToDoRedux.git",
    :tag => "#{s.version}"
  }


  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"

  s.source_files  = "Sources", "Sources/**/*.{h,m}"
  s.requires_arc = true

  s.dependency "TDRedux.swift", "~> 2.0.1"

end
