class Alert
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  belongs_to :school

  scope :within_school, ->(school) {where(:school_id => school)}

  field :latitude, type: Float
  field :longitude, type: Float
  field :status, type: String
  field :admin_description, type: String
  field :user_description, type: String
end
