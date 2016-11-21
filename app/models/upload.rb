class Upload < ApplicationRecord
  belongs_to :enterprise

  validates :name, presence: true
  validates :path, presence: true
  validates :enterprise, presence: true
end
