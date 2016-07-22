class School
  include Mongoid::Document
  include Mongoid::Timestamps

  # Callbacks
  after_create :spacial

  has_many :admins
  accepts_nested_attributes_for :admins, :autosave => true

  # Fields
  field :school_name, type: String
  field :latitude, type: Float
    field :longitude, type: Float
    field :radius, type: Float
    field :location

    # Indexes
    index({ location: "2dsphere" })

    # Validation

    validates :school_name, presence: true, uniqueness: true
    validates :latitude, presence: true
    validates :longitude, presence: true
    validates :radius, presence: true

    def spacial
      self.location = {
        type: 'Point',
        coordinates: [self.longitude, self.latitude]
      }
      self.save!
    end
end
