Category.destroy_all
['Networking', 'Graphics', 'Controls'].each do |category_name|
  Category.create! name: category_name
end

[
 {category: 'Networking', name: 'ASIHTTPRequest', url: 'http://allseeing-i.com/ASIHTTPRequest/',       github_path: 'pokeb/asi-http-request',    description: "ASIHTTPRequest is an easy to use wrapper around the CFNetwork API that makes some of the more tedious aspects of communicating with web servers easier. It is written in Objective-C and works in both Mac OS X and iPhone applications."},
 {category: 'Networking', name: 'AFNetworking',   url: 'https://github.com/AFNetworking/AFNetworking', github_path: 'AFNetworking/AFNetworking', description: "AFNetworking is a delightful networking library for iOS and Mac OS X. It's built on top of NSURLConnection, NSOperation, and other familiar Foundation technologies. It has a modular architecture with well-designed, feature-rich APIs that are a joy to use."},
 {category: 'Networking', name: 'RestKit',        url: 'http://restkit.org/',                          github_path: 'RestKit/RestKit',           description: "RestKit is an Objective-C framework for iOS that aims to make interacting with RESTful web services simple, fast and fun. It combines a clean, simple HTTP request/response API with a powerful object mapping system that reduces the amount of code you need to write to get stuff done."},
 {category: 'Graphics',   name: 'cocos2d',        url: 'http://www.cocos2d-iphone.org/',               github_path: 'cocos2d/cocos2d-iphone',    description: "cocos2d for iPhone is a framework for building 2D games, demos, and other graphical/interactive applications for iPod Touch, iPhone, iPad and Mac OS X. It is based on the cocos2d design but instead of using python it, uses objective-c."}
].each do |project_attributes|
  Project.create! do |p|
    p.category    = Category.find_by_name! project_attributes.delete(:category)
    p.attributes  = project_attributes
    p.is_reviewed = true
  end
end
