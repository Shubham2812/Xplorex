class AuthenticationController < ApplicationController
	
	def signup
	end

	def home
		if session[:user_id]
			if session[:identity] == "Owner"
				@owner = Owner.find(session[:user_id])
			else
				@customer = Customer.find(session[:user_id])
			end
		else
			return redirect_to '/'
		end
	end

	def addUser
		if params[:identity] == "Owner"
			if(params['photo'])
				original_filename = params["photo"].original_filename
					file_name = ownwer.id.to_s + "_" + "Owner_" + original_filename
			    	temp_file = params["photo"]
			    	File.open(Rails.root.join('public', 'uploads', 'users', file_name), 'wb') do |file|
			    	file.write(temp_file.read)
			    	end
			end
			owner = Owner.find_by_email(params[:email])
			if not owner
				Owner.create(
					:name => params[:name],
					:email => params[:email],
					:password => params[:password],
					:gender => params[:gender],
					:phone => params[:phone],
					:address => params[:address],
					:city => params[:city],
					:photo => original_filename
				)
				flash[:signupSuccess] = "Signup Successful"
				return redirect_to '/login'
			else
				flash[:Owner] = "Owner Already Exists"
				return redirect_to '/signup'
			end
		elsif params[:identity] == "Customer"
			if(params['photo'])
				original_filename = params["photo"].original_filename
					file_name = customer.id.to_s + "_" + "Customer_" + original_filename
			    	temp_file = params["photo"]
			    	File.open(Rails.root.join('public', 'uploads', 'users', file_name), 'wb') do |file|
			    	file.write(temp_file.read)
			    	end
			end
			customer = Customer.find_by_email(params[:email])
			if not customer
				customer = Customer.create(
					:name => params[:name],
					:email => params[:email],
					:password => params[:password],
					:gender => params[:gender],
					:phone => params[:phone],
					:address => params[:address],
					:city => params[:city],
					:photo => original_filename
				)
				flash[:signupSuccess] = "Signup Successful"
				return redirect_to '/login'
			else
				flash[:Customer] = "Customer Already Exists"
				return redirect_to '/signup'
			end
		else
			flash[:type] = "Please Mention Your Identity!"
			return redirect_to '/signup'
		end
	end

	def login
	end

	def loginStatus
		if params[:identity] == "Owner"
			owner = Owner.find_by_email(params[:email])
			if not owner 
				flash[:email] = "You Need To Signup First"
				return redirect_to '/login'
			else
				if not owner.password == params[:password]
					flash[:password] = "Wrong Password"
					return redirect_to '/login'
				else
					session[:user_id] = owner.id
					session[:identity] = "Owner"
					return redirect_to '/'
				end
			end
		elsif params[:identity] == "Customer"
			customer = Customer.find_by_email(params[:email])
			if not customer 
				flash[:email] = "You Need To Signup First"
				return redirect_to '/login'
			else
				if not customer.password == params[:password]
					flash[:password] = "Wrong Password"
					return redirect_to '/login'
				else
					session[:user_id] = customer.id
					session[:identity] = "Customer"
					return redirect_to '/'
				end
			end
		else
			flash[:type] = "Please Mention Your Identity!"
			return redirect_to '/login'
		end
	end

	def logout
		session[:user_id] = nil
		session[:identity] = nil
		return redirect_to '/'
	end


end
