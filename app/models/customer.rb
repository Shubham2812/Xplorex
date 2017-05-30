class Customer < ActiveRecord::Base
	after_create :generate_access_token

	def generate_access_token
		token = SecureRandom.hex
    	while Customer.where(access_token: token).first
      		token = SecureRandom.hex
    	end
    	self.access_token = token
    	self.save!
	end
end
