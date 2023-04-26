class SessionsController < ApplicationController

 # logging the Admin in

    def logAdmin
        # insert code here
        
    end


# logging the student in

    def logStudent

        student = Student.find_by(email: login_params[:email])
        if student&.authenticate(login_params[:password])
            session[:user_id]= student.id
            render json: student, status: :accepted
        else
            render json: { error: "Invalid email or password"}, status: :not_found
        end
    end


# loging out for both the student and the admin

    def destroy
        session.delete :user_id
        head :no_content
    end

    def password_reset
        # Find the user by email
        user = if params[:type] == 'student'
                 Student.find_by(email: params[:email])
               elsif params[:type] == 'admin'
                 Admin.find_by(email: params[:email])
               end
    
        # Return an error if the user wasn't found
        return render json: { error: 'User not found' }, status: :not_found unless user
    
        # Generate a new password
        new_password = SecureRandom.hex(8)
    
        # Update the user's password
        user.update(password: new_password)
    
        # Send the new password to the user's email
        UserMailer.password_reset(user, new_password).deliver_now
    
        # Return a success message
        render json: { message: 'Password reset successful. Check your email for the new password.' }, status: :ok
    end
    
    private

    def login_params
        params.permit(:email, :password)
    end
end
