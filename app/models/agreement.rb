class Agreement < ApplicationRecord
	AGREEMENT_STATUSES = %w[ready sent viewed accepted cancelled expired].freeze
	enum status: AGREEMENT_STATUSES
end
