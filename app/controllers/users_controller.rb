class UsersController < ApplicationController
	def profile
		@user = User.find(params[:id])

		respond_to do |format|
			format.html
			format.json { render json: @user }
		end
	end

	def edit_profile
		@user = User.find(params[:id])

		respond_to do |format|
			format.html
			format.json { render json: @user }
		end			
	end

	def update_profile
		@user = User.find(params[:id])
	    respond_to do |format|
	      if @user.update_attributes(params[:user])
	        format.html { redirect_to user_profile_path(@user), notice: 'Profile was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { redirect_to edit_profile_path(@user) }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
	    # Rails.logger.info(@user)

	end
end
