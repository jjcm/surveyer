class Confirmation < ActiveRecord::Base
  attr_accessible :answer_id, :option_id, :response
  belongs_to :answer

end
