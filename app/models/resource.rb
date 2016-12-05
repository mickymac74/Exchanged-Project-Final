class Resource < ActiveRecord::Base
	ratyrate_rateable "picture"
  belongs_to :user
  validates :name, presence: true, length: {minimum: 3, maximum: 30}
  validates :resource_type, presence: true, length: {minimum: 3, maximum: 20}
  validates :description, presence: true, length: {minimum: 5, maximum: 100}
  validates :user_id, presence: true
  mount_uploader :picture, PictureUploader

  def calculate_average
  	rates = Rate.where(rateable_id: self.id, rateable_type: "Resource").map(&:stars)

  	return rates.present? ? (rates.sum / rates.size).round(1) : "0.0"
  end
end
