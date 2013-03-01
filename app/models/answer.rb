class Answer < ActiveRecord::Base
  attr_accessible :option_id, :quiz_id, :user_id, :confirmations_attributes

  belongs_to :user
  belongs_to :option
  has_many :confirmations, :dependent => :destroy
  accepts_nested_attributes_for :confirmations

  #returns the depth of the tree
  def self.depth(answer)
    option = answer.option
    depth = 1

    while !option.option.nil?
      option = option.option
      depth += 1
    end
    depth
  end

  amoeba do
    enable
  end
end
