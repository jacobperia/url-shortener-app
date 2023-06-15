class UrlLink < ApplicationRecord
  include Hashid::Rails

  has_many :ip_address_users

  before_create :check_if_url_valid?

  def increase_use_count!(ip_address)
    user = ip_address_users.find_by_ip_address(ip_address) ||
           ip_address_users.create(ip_address: ip_address)
    user.increment!(:number_of_visits)
  end

  private

  def check_if_url_valid?
    return if original_url =~ URI::DEFAULT_PARSER.make_regexp

    errors.add(:original_url, 'is not a valid URL.')
    throw :abort
  end
end
