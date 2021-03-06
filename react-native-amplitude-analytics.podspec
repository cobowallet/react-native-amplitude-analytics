require "json"

json = File.read(File.join(__dir__, "package.json"))
package = JSON.parse(json).deep_symbolize_keys

Pod::Spec.new do |s|
  s.name = package[:name]
  s.version = package[:version]
  s.license = { type: "MIT" }
  s.homepage = "https://github.com/SudoPlz/react-native-amplitude-analytics"
  s.authors = package[:author][:name]
  s.summary = package[:description]
  s.source = { git: package[:repository][:url] }
  s.source_files = "ios/*.{h,m}"
  s.platform = :ios, "10.0"

  s.dependency "React-Core"
  
  s.dependency "Amplitude", "~> 5.1.0"
end
