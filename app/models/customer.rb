class Customer < ApplicationRecord
  validates :full_name, presence: true

  has_one_attached :image
  def self.ransackable_attributes(auth_object = nil)
    %w[
      id
      full_name
      phone_number
      email
      notes
      created_at
      updated_at
    ]
  end
end
