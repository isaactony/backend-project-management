class CohortsController < ApplicationController

    #show all cohorts 
    def allcohorts
        @cohorts = Cohort.all
        render json: @cohorts
    end
    def index
        @course = Course.find(params[:course_id])
        @cohorts = @course.cohorts
        render json: @cohorts
    end
    
    #show single cohort
    def show
        @course = Course.find(params[:course_id])
        @cohort = @course.cohorts.find(params[:id])
        render json: @cohort
    end
    
    #create cohort
    def create
        @course = Course.find(params[:course_id])
        @cohort = @course.cohorts.build(cohort_params)
        if @cohort.save
          render json: @cohort, status: :created
        else
          render json: @cohort.errors, status: :unprocessable_entity
        end
    end
     
    #deletes a cohort
    def destroy
        @course = Course.find(params[:course_id])
        @cohort = @course.cohorts.find(params[:id])
        @cohort.destroy
        head :no_content
    end

    private    
    def set_course
        @course = Course.find(params[:course_id])
    end

    def cohort_params
        params.permit(:name, :number_of_students)
    end
    
end
