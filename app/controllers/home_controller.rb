class HomeController < ApplicationController

	def home
	end

	def profile
		if session[:identity] == "Customer"
			@user = Customer.find(session[:user_id])
		else
			@user = Owner.find(session[:user_id])
		end
	end

	def editProfile
		if session[:identity] == "Customer"
			@user = Customer.find(session[:user_id])
		else
			@user = Owner.find(session[:user_id])
		end
	end

	def editProfileFinal
		if session[:identity] == "Owner"
			user = Owner.find(session[:user_id])
		else
			user = Customer.find(session[:user_id])
		end

		if params[:name] != ""
			user.name = params[:name]
		end
		if params[:email] != ""
			user.email = params[:email]
		end
		if params[:password] != ""
			user.password = params[:password]
		end
		if params[:gender]
			user.gender = params[:gender]
		end
		if params[:phone] != ""
			user.phone = params[:phone]
		end
		if params[:address] != ""
			user.address = params[:address]
		end
		if params[:city] != ""
			user.city = params[:city]
		end
		if params[:photo]
			if user.photo
				file_name = user.id.to_s + "_" + sessionIdentity + "_" + user.photo
				File.delete(Rails.root.join('public', 'uploads', 'users', file_name))
			end
			user.photo = params[:photo].original_filename
			file_name = user.id.to_s + "_" + sessionIdentity + "_" + params[:photo].original_filename
			temp_file = params["photo"]
			File.open(Rails.root.join('public', 'uploads', 'users', file_name), 'wb') do |file|
			file.write(temp_file.read)
			end
		end
		user.save
		return redirect_to '/profile'
	end

	def notifications
		@myOutlets = Food.where(:ownerID => session[:user_id])
	end

	def myBookings
		@bookings = Booking.where(:customerID => session[:user_id])
	end
	
	def serviceMenu
	end

	def foodoutlet
		@food = Food.find(params[:outletID])
	end

	def timeline
		@reviews = Review.where(:customerID => session[:user_id])		
	end

	def services
		@services = Food.where(:ownerID => session[:user_id])
	end

	def search
		items = Food.where("name like '%#{params[:search]}%' ")
		render json: items
	end

	def search_result
		outlet = Food.find_by(name: params[:search])
		if outlet
			return redirect_to controller: 'food', action: 'food', outletID: outlet.id
		end
		return redirect_to '/'
	end
end
