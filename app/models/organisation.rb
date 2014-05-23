class Organisation < ActiveRecord::Base
  has_many :users

  scope :by_name, ->(name) { where('name LIKE ?', "%#{name}%") }
  scope :by_address, ->(address) {
    joins(users: :addresses)
    .where('addresses.street LIKE ? OR addresses.city LIKE ? OR addresses.state LIKE ? OR addresses.zip LIKE ?',
     "%#{address}%","%#{address}%","%#{address}%","%#{address}%")
  }

  def self.filter_by(filter_type, filter_argument)
    # check if the filter_type is in the allowed filters list,
    # to lock down the send call
    if filtering_scopes.include?(filter_type)
      send("by_#{filter_type}",filter_argument)
    end
  end

  def self.filtering_scopes
    [:name, :address]
  end
end
