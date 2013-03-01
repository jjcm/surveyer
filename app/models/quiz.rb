class Quiz < ActiveRecord::Base
  attr_accessible :name, :rating, :user_id
  has_many :options, :dependent => :destroy
  belongs_to :user

  amoeba do
    enable
  end
end
