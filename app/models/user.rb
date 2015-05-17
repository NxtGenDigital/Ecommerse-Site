class User < ActiveRecord::Base
  validates :name, :presence=> true, :length => {:minimum=>1,:maximum=>20}
  #validates :email, :presence=>true, :uniqueness=>true
  has_one :image ,as: :entity
  before_validation :check
  accepts_nested_attributes_for :image
  scope :date_wise_records, ->  { where("created_at >= ?","2015-03-15") }
  # Scope format
  #scope :scope_name, ->  { where("condition") }
  def check
    if name == "fucker" or name =="asshole"
	  self.name="Srishti"
    end
  end
 def self.omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.facebook_image = auth.info.image
      user.token = auth.credentials.token
      user.expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
