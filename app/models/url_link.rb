class UrlLink < ApplicationRecord
  include Hashid::Rails

  has_many :ip_address_users

  def increase_use_count!(ip_address)
    user = ip_address_users.find_by_ip_address(ip_address) ||
           ip_address_users.create(ip_address: ip_address)
    user.increment!(:number_of_visits)
  end
end
