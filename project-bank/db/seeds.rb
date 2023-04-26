# Courses
Course.create(name: "Android", category: :android)
Course.create(name: "Fullstack", category: :fullstack)
Course.create(name: "Web", category: :web)
Course.create(name: "Data Science", category: :datascience)

# Cohorts
Cohort.create(name: "Android Cohort 1", course: Course.find_by(category: :android), number_of_students: 10)
Cohort.create(name: "Fullstack Cohort 1", course: Course.find_by(category: :fullstack), number_of_students: 12)
Cohort.create(name: "Web Cohort 1", course: Course.find_by(category: :web), number_of_students: 15)
Cohort.create(name: "Data Science Cohort 1", course: Course.find_by(category: :datascience), number_of_students: 8)

# Admins
Admin.create(username: "admin1", email: "admin1@example.com", password: "password1")
Admin.create(username: "admin2", email: "admin2@example.com", password: "password2")

# Students
Student.create(username: "student1", email: "student1@example.com", password: "password1")
Student.create(username: "student2", email: "student2@example.com", password: "password2")
Student.create(username: "student3", email: "student3@example.com", password: "password3")
Student.create(username: "student4", email: "student4@example.com", password: "password4")

# Projects
Project.create(name: "Project 1", description: "This is project 1", github_link: "https://github.com/project1", course: Course.find_by(category: :android), members: "student1, student2")
Project.create(name: "Project 2", description: "This is project 2", github_link: "https://github.com/project2", course: Course.find_by(category: :fullstack), members: "student2, student3")
Project.create(name: "Project 3", description: "This is project 3", github_link: "https://github.com/project3", course: Course.find_by(category: :web), members: "student3, student4")
Project.create(name: "Project 4", description: "This is project 4", github_link: "https://github.com/project4", course: Course.find_by(category: :datascience), members: "student1, student4")
