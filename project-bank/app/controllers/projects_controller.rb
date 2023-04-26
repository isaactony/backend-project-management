class ProjectsController < ApplicationController
    #before_action :set_course, only: [:index, :create]
    #before_action :set_project, only: [:show]

    #all projects unders each course

    def allprojects
        @projects = Project.all
        render json: @projects
    end

    def singleproject
        @project = Project.find(params[:id])
        render json: @project
    end
    
    def index
        @course = Course.find(params[:course_id])
        @projects = @course.projects
        render json: @projects
    end
    
    #single project under each course
    def show
        @course = Course.find(params[:course_id])
        @project = @course.projects.find(params[:id])
        render json: @project
    end
    
    #creating a new project under a course
    def create
        @course = Course.find(params[:course_id])
        @project = @course.projects.build(project_params)
        if @project.save
          render json: @project, status: :created
        else
          render json: { errors: @project.errors.full_messages }, status: :unprocessable_entity
        end
    end
    
    #updateing a project under a course
    def update
        @course = Course.find(params[:course_id])
        @project = @course.projects.find(params[:id])
        if @project.update(project_params)
          render json: @project
        else
          render json: @project.errors, status: :unprocessable_entity
        end
    end

    #deleting a project from a course
    def destroy
        @course = Course.find(params[:course_id])
        @project = @course.projects.find(params[:id])
        if @project.destroy
            render json: {message: 'Project deleted successfully'}
        else
            render json: {message: 'Project not found'}
        end
    end

    
    private
    
    def set_course
        @course = Course.find(params[:course_id])
    end
    
    def set_project
        @project = Project.find(params[:id])
    end
    
    def project_params
        params.permit(:name, :description, :github_link, :members)
    end
end
