class FoodController < ApplicationController

	def food
		@offers = Offer.where(:category => "food")
		@booking = Booking.find_by(:outletID => params[:outletID], :customerID => session[:user_id])
		if params[:outletID]
			@food = Food.find(params[:outletID])
		end
		if params[:category] == "Bars"
			@bars = Food.where(:tag => "bar")
		elsif params[:category] == "Cafes"
			@cafes = Food.where(:tag => "cafe")
		elsif params[:category] == "Grocery"
			@grocery = Food.where(:tag => "grocery")
		elsif params[:category] == "Dessert"
			@dessert = Food.where(:tag => "dessert")
		elsif params[:category] == "Others"
			@others = Food.where(:tag => "other")
		else params[:category] == "Restaurants"
			@restaurants = Food.where(:tag => "restaurant")
		end
	end

	def addFood
	end

	def addFoodFinal
		original_filename = params["photo"].original_filename
		food = Food.create(
				:ownerID => session[:user_id],
				:name => params[:name],
				:tag => params[:tag],
				:location => params[:location],
				:description => params[:description],
				:photo => params["photo"].original_filename,
				:menu => params[:menu]
			)
		file_name = food.id.to_s + "_" + original_filename
    	temp_file = params["photo"]
    	File.open(Rails.root.join('public', 'uploads', 'outlets', file_name), 'wb') do |file|
    	file.write(temp_file.read)
    	end
		return redirect_to '/food'
	end

	def editFood
		@food = Food.find(params[:outletID])
	end

	def editfood
		food = Food.find(params[:outletID])
		if params[:name] != ""
			food.name = params[:name]
		end
		if params[:location] != ""
			food.location = params[:location]
		end
		if params[:description] != ""
			food.description = params[:description]
		end
		if params[:tag] != ""
			food.tag = params[:tag]
		end
		if params[:photo]
			if food.photo
				file_name = food.id.to_s + "_" + food.photo
				File.delete(Rails.root.join('public', 'uploads', 'outlets', file_name))
			end
			food.photo = params[:photo].original_filename
			file_name = food.id.to_s + "_" + params[:photo].original_filename
			temp_file = params["photo"]
			File.open(Rails.root.join('public', 'uploads', 'outlets', file_name), 'wb') do |file|
			file.write(temp_file.read)
			end
		end
		if params[:menu] != ""
			food.menu = params[:menu]
		end
		food.save
		return redirect_to controller: 'food', action: 'food', outletID: params[:outletID]
 	end

 	def delete
 		food = Food.find(params[:outletID])
 		food.destroy
 		return redirect_to '/food'
 	end

 	def offers
 		@outlet = Food.find(params[:outletID])
 	end

 	def addOffer
 		offer = Offer.create(
 				:outletID => params[:outletID],
 				:category => "food",
 				:content => params[:offer],
 				:from => params[:from],
 				:to => params[:to]
 			)
 		return redirect_to controller: 'food', action: 'food', outletID: params[:outletID]
 	end

 	def editOffer
 		@offer = Offer.find(params[:offerID])
 	end

 	def editOfferFinal
 		offer = Offer.find(params[:offerID])
 		if params[:offer] != ""
 			offer.content = params[:offer]
 		end
 		if params[:from] != ""
 			offer.from = params[:from]
 		end
 		if params[:to] != ""
 			offer.to = params[:to]
 		end
 		outletID = offer.outletID
 		offer.save
 		return redirect_to controller: 'food', action: 'food', outletID: outletID
 	end

 	def deleteOffer
 	end

 	def visited
 		review = Review.create(
 				:customerID => session[:user_id],
 				:category => params[:category],
 				:outletID => params[:outletID],
 				:visited => true
 			)
 		return redirect_to controller: 'food', action: 'food', outletID: params[:outletID]
 	end

 	def visitedAjax
 		review = Review.find_by(:outletID => params[:outletID], :customerID => session[:user_id])
 		status = nil
 		if review
 			review.destroy
 			status = true
 		else
	 		review = Review.create(
	 				:customerID => session[:user_id],
	 				:category => params[:category],
	 				:outletID => params[:outletID],
	 				:visited => true
	 			)
	 		status = false
	 	end
	 	object = Hash.new
	 	object["review"] = review
	 	object["userID"] = session[:user_id]
	 	object["status"] = status
 		render json: object
 	end

 	def notVisited
 		review = Review.find(params[:reviewID])
 		outletID = review.outletID
 		review.destroy
 		return redirect_to controller: 'food', action: 'food', outletID: outletID
 	end

 	def addReview
 		@outlet = Food.find(params[:outletID])
 	end

 	def confirmReview
 		review = Review.where("category = ? AND outletID = ? AND customerID = ?", "food", params[:outletID], session[:user_id]).first
 		review.content = params[:content]
 		review.rating = params[:rating]
 		if params[:recommend] == "yes"
 			review.recommend = true
 		else
 			review.recommend = false
 		end
 		review.save
 		return redirect_to controller: 'food', action: 'food', outletID: params[:outletID]
 	end

 	def deleteReview
 		review = Review.find(params[:reviewID])
 		review.content = nil
 		review.rating = nil
 		review.recommend = nil
 		outletID = review.outletID
 		review.save
 		return redirect_to controller: 'food', action: 'food', outletID: outletID
 	end

 	def deleteReviewAjax
 		review = Review.find(params[:reviewID])
 		review.destroy
 		render json: review
 	end

 	def editReview
 		@review = Review.find(params[:reviewID])
 		@outlet = Food.find(@review.outletID)
 	end

 	def confirmEditReview
 		review = Review.find(params[:reviewID])
 		if params[:content] != ""
 			review.content = params[:content]
 		end
 		if params[:recommend]
 			if params[:recommend] == "yes"
 			review.recommend = true
 			else
 			review.recommend = false
 			end
 		end
 		review.rating = params[:rating]
 		outletID = review.outletID
 		review.save
 		return redirect_to controller: 'food', action: 'food', outletID: outletID
 	end

 	def booking
 		@outlet = Food.find(params[:outletID])
 	end

 	def addBooking
 		booking = Booking.find_by(:outletID => params[:outletID], :customerID => session[:user_id])
 		if booking
 			booking.destroy
 		end
 		Booking.create(
 				:customerID => session[:user_id],
 				:category => "food",
 				:outletID => params[:outletID],
 				:numPersons => params[:numPersons],
 				:date => params[:date],
 				:time => params[:time],
 				:status => 0
 			)
 		return redirect_to controller: 'food', action: 'food', outletID: params[:outletID]
 	end

 	def confirmBooking
 		booking = Booking.find(params[:bookingID])
 		booking.status = 1;
 		booking.save
 		return redirect_to '/notifications'
 	end

 	def rejectBooking
 		booking = Booking.find(params[:bookingID])
 		booking.status = 2;
 		booking.save
 		return redirect_to '/notifications'
 	end

 	def cancelBooking
 		booking = Booking.find(params[:bookingID])
 		booking.destroy
 		return redirect_to '/myBookings'
 	end
end
