class Indicator < ActiveRecord::Base
    # The leves are hard coded because the client has confirmed that there
    # are only these three levels.
	LEVELS_LIST = ["Companion", "Contributor", "Champion"]

	# Relationships
	# --------------------------------
	belongs_to :competency
	has_many :indicator_resources
	has_many :resources, through: :indicator_resources
	accepts_nested_attributes_for :indicator_resources

	# Validations
	# --------------------------------
	validates_presence_of :competency_id, :level, :description
	validates_numericality_of :competency_id, only_integer: true


	# Scopes
	# --------------------------------
	scope :alphabetical, -> { order('description') }
	scope :by_level, -> (level) { where("level LIKE ?", level) }
	scope :by_description, -> (desc) { where("description LIKE ?", desc) }
	scope :by_competency, -> (competency) { joins(:competency).where("name LIKE ?", competency) }
	scope :active, -> { where(active: true) }

	# Private Methods
	# --------------------------------

    # This method is used by Filterrific for resources and questions
    # IMPORTANT NOTE: This method is a hack. This method can be solved in one
    # line: group(:level).map { |e| [e.level, e.level] }
    # This line only works when the database is sqlite3 (i.e., test and
    # development). However, when the database is postgresql (i.e., production),
    # there is an error stating that you must first group by id before you can
    # group by level. This does not produce the same results unfortunately. The
    # solution below is a hack, but it works.
	def self.options_for_sort_by_level
        levels = Indicator.all.group(:id, :level).map { |e| e.level }
        options = Array.new
        levels.each do |level|
        	if !options.include?([level, level])
        		options.push([level, level])
        	end
        end
        return options
    end

end
