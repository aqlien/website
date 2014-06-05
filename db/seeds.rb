# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

description = "This portfolio is a Rails application - rather than a static page, the content is generated dynamically."
Project.create(name: "Portfolio", technologies_used: "Ruby, Rails, Zurb Foundation, HTML5, CSS", link: "http://www.aqlien.com", description: description)

description = "Zoobit is a site where users can adopt and interact with virtual pets. The pet's mood will change over time, based on several other factors. This was a joint project with Sam Camus, at www.samcamus.com"
Project.create(name: "Zoobit", technologies_used: "Ruby, Rails, Zurb Foundation, HTML5, CSS", link: "http://www.zoobit.net", description: description)
