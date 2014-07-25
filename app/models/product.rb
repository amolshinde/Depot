class Product < ActiveRecord::Base

  before_destroy :ensure_not_referenced_by_any_line_item
  has_many :line_items
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, :format => {:with => %r{([^\s]+(\.(?i)(jpg|png|gif|bmp))$)}, :message => 'must be a URL for GIF, JPG or PNG image.' }

  # default_scope :order => 'title'  # default_scope (:order => 'title')
  def self.default_scope
    Product.order 'title'
  end

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end

end
