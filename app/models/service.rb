class Service < ApplicationRecord
  validates :hashed_id, presence: true, uniqueness: true
  
  scope :unpublished, -> { where(published_at: nil) }
  scope :published, -> { where.not(published_at: nil) }
  scope :for_category, -> (c) { c ? where('categories @> ?', "{#{ normalise_string(c) }}") : none }
  scope :for_area, -> (a) { a ? where('areas @> ?', "{#{ normalise_string(a) }}") : none }

  before_validation :normalise_areas, :normalise_categories

  def to_param
    hashed_id
  end

  def available_in?(area)
    self.areas.include?(self.class.normalise_string(area))
  end

  def self.normalise_string(str)
    str.downcase.strip.squeeze(' ')
  end

  private

  def normalise_categories
    self.categories = (self.categories || []).map { |s| self.class.normalise_string(s) }
  end

  def normalise_areas
    self.areas = (self.areas || []).map { |s| self.class.normalise_string(s) }
  end

  def generate_hashed_id
    self.hashed_id = Digest::SHA1.hexdigest([Time.now, rand].join).slice(0, 16)
  end
end