users = [
  {name:"Jared", email:"jrjohns@mit.edu", password:"jared", admin:true}
]

User.create(users)
puts "Created users"

amazon = Company.create(name:"Amazon", industry:"Tech")
amazon.creator = User.find_by(name:"Jared")

amazon.save

job = Job.create(title:"product manager", link:"https://www.amazon.jobs/en/jobs/533107/amazon-mba-master-s-level-opportunities-internship-amazon-jobs-posting", company:amazon, location:'Seattle, WA')
job.creator = User.find_by(name:"Jared")
# job.deadline = DateTime.new(2018,1,1)
job.save

application = Application.new()
application.user = User.find_by(name:"Jared")
application.job = job
application.save
