Category.destroy_all
['Networking', 'Graphics'].each do |category_name|
  Category.create! name: category_name
end

[{category: 'Networking', name: 'ASIHTTPRequest', url: 'http://allseeing-i.com/ASIHTTPRequest/',       github_path: 'pokeb/asi-http-request'},
 {category: 'Networking', name: 'AFNetworking',   url: 'https://github.com/AFNetworking/AFNetworking', github_path: 'AFNetworking/AFNetworking'},
 {category: 'Networking', name: 'RestKit',        url: 'http://restkit.org/',                          github_path: 'RestKit/RestKit'}].each do |project_attributes|
  Project.create! do |p|
    p.category    = Category.find_by_name! project_attributes[:category]
    p.name        = project_attributes[:name]
    p.url         = project_attributes[:url]
    p.is_reviewed = true
  end
end
