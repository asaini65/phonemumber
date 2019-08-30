class ContactNumber < ApplicationRecord

	START_RANGE = 1111111111
	END_RANGE = 9999999999
	validates :number, presence: {:message => 'please supply valid contact number'},
										 numericality: true,
										 uniqueness: true,
										 allow_blank: true
	
	validates_inclusion_of :number, :in => START_RANGE..END_RANGE

end
