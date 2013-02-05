Category.destroy_all

cat_networking = Category.create! name: 'Networking'
cat_graphics   = Category.create! name: 'Graphics'

project_asi    = cat_networking.projects.create! name: 'ASIHTTPRequest', url: 'http://allseeing-i.com/ASIHTTPRequest/'
