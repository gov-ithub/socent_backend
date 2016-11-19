class Entrepreneur < ApplicationRecord
  has_many :enterprises, :dependent => :delete_all
end
