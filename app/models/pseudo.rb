class Pseudo < ActiveRecord::Base
  validates :fake_name, presence: true, uniqueness: true

end
