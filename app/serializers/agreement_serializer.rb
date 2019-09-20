class AgreementSerializer
  include FastJsonapi::ObjectSerializer
	attributes :id, :first_name, :last_name, :days_out,
						 :business_name, :email, :reference

	attribute :date_created do |agreement|
		formatted_date(agreement.created_at)
	end

	attribute :status do |agreement|
		agreement.status.capitalize
	end

	attribute :date_accepted do |agreement|
		formatted_date(agreement.accepted_datetime)
	end

	attribute :expiration_date do |agreement|
		formatted_date(agreement.expiration_datetime)
	end

	def self.formatted_date(date)
		date&.strftime('%m/%d/%Y')
	end
end



