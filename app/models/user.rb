class User < ActiveRecord::Base
  belongs_to :organisation
  has_many :addresses
end
