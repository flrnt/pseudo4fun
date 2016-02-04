class Pseudo < ActiveRecord::Base
  validates :fake_name, presence: true
  validates :fake_name, uniqueness: true

end
