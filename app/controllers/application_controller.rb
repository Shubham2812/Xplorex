class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :currentUser, :sessionID, :sessionIdentity, :getCustomer, :getOwner, 
  :getFood, :getOffers, :getReviews, :getMyReview, :likes, :dislikes, :photo, :avatar, :bookings

  def currentUser
  	if not session[:user_id]
  		return nil
  	else
  		if session[:identity] == "Owner"
  			return Owner.find(session[:user_id])
  		end
  		if session[:identity] == "Customer"
  			customer = Customer.find(session[:user_id]) 
  			return customer
  		end
  	end
  end

  def sessionID
  	return session[:user_id]
  end

  def sessionIdentity
  	return session[:identity]
  end

  def getCustomer userID
  	return Customer.find(userID)
  end

  def getOwner userID
  	return Owner.find(userID)
  end

  def getFood outletID
    return Food.find(outletID)
  end

  def getOffers category, outletID
    return Offer.where("category = ? AND outletID = ?", category, outletID)
  end

  def getReviews category, outletID
    return Review.where("category = ? AND outletID = ?", category, outletID)
  end

  def getMyReview category, outletID
    return Review.where("category = ? AND outletID = ? AND customerID = ?", category, outletID, session[:user_id]).first
  end

  def likes outletID
    reviews = Review.where(:outletID => outletID)
    count = 0
    reviews.each do |review|
      if review.recommend == true
        count += 1
      end
    end
    return count
  end

  def dislikes outletID
    reviews = Review.where(:outletID => outletID)
    count = 0
    reviews.each do |review|
      if review.recommend == false
        count += 1
      end
    end
    return count
  end

  def photo outletID
    file = "/uploads/outlets/" + outletID.to_s + "_" + getFood(outletID).photo
    return file
  end

  def avatar
    if sessionIdentity == "Customer"
      user = Customer.find(sessionID)
    elsif sessionIdentity == "Owner"
      user = Owner.find(sessionID)
    end
    if user.photo
      file = "/uploads/users/" + user.id.to_s + "_" + sessionIdentity + "_" + user.photo
    return file
    end
  end

  def bookings outletID
    return Booking.where(:outletID => outletID)
  end

end
