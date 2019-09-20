User.find_or_initialize_by(email: 'owner@affinipay.com').tap do |user|
	user.update(
		password: 'password',
		authentication_token: '8c394791f0506b249f27b3ad80cb1192'	
	)
end

1500.times do
	status = Agreement::AGREEMENT_STATUSES.sample
	created_at = (1..2000).to_a.sample.hours.ago
	accepted_datetime = created_at + (1..90).to_a.sample.days if status == 'accepted'
	expiration_datetime = (accepted_datetime ? accepted_datetime : created_at) + (1..60).to_a.sample.days  

	Agreement.create(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		status: status,
		days_out: ((Time.current - created_at).ceil / 3600),
		created_at: created_at,
		accepted_datetime: accepted_datetime,
		expiration_datetime: expiration_datetime,
		business_name: Faker::Company.name,
		email: Faker::Internet.email,
		reference: ['', 'Retainer Plan', 'Immigration Matter', 'Divorce Case'].sample
	)
end