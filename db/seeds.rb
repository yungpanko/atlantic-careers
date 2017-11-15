users = [
  {name:"Jared", email:"jrjohns@mit.edu", password:"jared", admin:true}
]

User.create(users)
puts "Created users"

amazon = Company.create(name:"Amazon", industry:"retail")
amazon.creator = User.find_by(name:"Jared")

amazon.save

job = Job.create(title:"product manager", link:"link_to_job", company:amazon)

application = Application.new()
application.user = User.find_by(name:"Jared")
application.job = job
application.save
