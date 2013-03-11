class Project < ActiveRecord::Base
  belongs_to :category
  has_many :projects_tags, :dependent => :destroy
  has_many :tags, :through => :projects_tags

  attr_protected :rating, :is_published
  attr_protected :rating, as: :admin

  validates :category_id, presence: true
  validates :name, presence: true
  validates :github_path, github_path: true

  scope :by_rating, order('rating desc')
  scope :in_review, where('is_published = ?', false)
  scope :published, where('is_published = ?', true)

  def update_rating
    self.rating = rating_provider.fetch
    save!
  end

  def source_code_url
    github_url || super
  end

  def github_url
    "https://github.com/#{github_path}" if github_path.present?
  end

  private

  def rating_provider
    @rating_provider ||= Rating::Github.new self
  end
end
