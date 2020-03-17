class Service < ApplicationRecord
  validates :hashed_id, presence: true, uniqueness: true
  
  scope :unpublished, -> { where(published_at: nil) }
  scope :published, -> { where.not(published_at: nil) }
  scope :for_category, -> (c) { c ? where('categories @> ?', "{#{ normalise_string(c) }}") : none }
  scope :for_area, -> (a) { a ? where('areas @> ?', "{#{ normalise_string(a) }}") : none }

  before_validation :generate_hashed_id, :normalise_areas, :normalise_categories

  def to_param
    hashed_id
  end

  def available_in?(area)
    self.areas.include?(self.class.normalise_string(area))
  end

  def self.normalise_string(str)
    str.downcase.strip.squeeze(' ')
  end

  def areas_str
    areas.join(', ')
  end

  def areas_str=(str)
    self.areas = str.split(',').map(&:strip)
  end

  def categories_str
    categories.join(', ')
  end

  def categories_str=(str)
    self.categories = str.split(',').map(&:strip)
  end

  private

  def normalise_categories
    self.categories = (self.categories || []).map { |s| self.class.normalise_string(s) }
  end

  def normalise_areas
    self.areas = (self.areas || []).map { |s| self.class.normalise_string(s) }
  end

  def generate_hashed_id
    return if hashed_id.present?
    self.hashed_id = Digest::SHA1.hexdigest([Time.now, rand].join).slice(0, 16)
  end
end