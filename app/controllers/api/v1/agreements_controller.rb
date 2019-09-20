module Api
  module V1
    class AgreementsController < Api::ApiController
			before_action :authenticate_user!
			
			def index
				agreements = Agreement.all
				agreements = agreements.order(field_name(params[:_sort]) => params[:_order])
				data = {
					agreements: AgreementSerializer.new(agreements).serializable_hash[:data].map { |a| a[:attributes] },
					count: agreements.count
				}
				return json_response(200, 'Success', data)
			end

			private

			COLUMNS = HashWithIndifferentAccess.new({
				date_created: 'created_at',
				date_accepted: 'accepted_datetime',
				expiration_date: 'expiration_datetime'
			}).freeze
			
			def field_name(field)
				COLUMNS[field] || field
			end
    end
  end  
end

