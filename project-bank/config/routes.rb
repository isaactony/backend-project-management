Rails.application.routes.draw do
    resources :students, only: [:index, :password_reset]

    #routes for course
    resources :courses
    
    #routes for cohorts
    resources :courses do
      resources :cohorts
    end
    get "/cohorts", to:"cohorts#allcohorts"

   
     


    #route for getting projects under each course

    resources :courses do
      resources :projects
    end
    get "/projects", to:"projects#allprojects"
    get "/project", to:"projects#singleproject"


    # route for loging in a student
    post "/studentlogin", to:"sessions#logStudent" 

    #get list of all students in the system
    get "/students", to:"students#index"

    #route for studnt signup
    post "/studentssignup", to:"students#create" 

    #get list of admins
    get "/admins", to:"admins#index"

    #route for admin signup
    post "/adminssignup", to:"admins#create" 

    # route to logout
    delete "/logout", to:"sessions#destroy"

    post '/password_reset', to: 'sessions#password_reset'
    
  end
  