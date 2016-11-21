class Entrepreneur < ApplicationRecord
  has_many :enterprises, :dependent => :destroy # :destroy because enterprise must cascade to uploads
end
