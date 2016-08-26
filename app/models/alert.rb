class Alert
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  belongs_to :school

  before_save :add_path
  before_validation :is_covered, on: :create

  scope :within_school, ->(school) {where(:school_id => school)}

  field :latitude, type: Float
  field :longitude, type: Float
  field :status, type: String
  field :admin_description, type: String
  field :user_description, type: String
  field :alert_path, type: Array

  def haversine_distance(lat1, lng1, lat2, lng2)

  	dtor = Math::PI/180
    r = 3959

    rlat1 = lat1 * dtor 
    rlong1 = lng1 * dtor 
    rlat2 = lat2 * dtor 
    rlong2 = lng2 * dtor
    dlon = rlong1 - rlong2
    dlat = rlat1 - rlat2 

    a = Math::sin(dlat/2) ** 2 + Math::cos(rlat1) * Math::cos(rlat2) * Math::sin(dlon/2) ** 2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    distance = r * c

  	return distance
  end
  def is_covered
  	schools = School.all

  	schools.each do |school|

  		distance = haversine_distance(school.latitude, school.longitude, self.latitude, self.longitude)

  		Rails.logger.info(distance)
  		if distance < school.radius  
  			self.school_id = school.id
  			self.status = "active"
  		return self 
  		else
  			self.errors.add(:error,"Not within school")
  		end
  	end
  end
  def add_path
    path = []
    array = []
    array.push(self.latitude, self.longitude)
    path.push(array)
    self.push(alert_path: path)
  end
end
