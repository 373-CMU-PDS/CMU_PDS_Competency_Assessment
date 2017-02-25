class IndicatorResource < ActiveRecord::Base
	attr_accessor :indicator_description
	
	#Resource temp vars
	# These attr_accessors are used in the competency creation process. They are
	# used for associating indicators to resources.
	# --------------------------------------------------------------------------
	# uploaded_resource_name is filled when a user attaches an uploaded resource
	# to the indicator; the name of that new resource is saved in this field
	attr_accessor :uploaded_resource_name
	# this next four resource attributes are filled when a user attaches a newly
	# created resource to an indicator 
	attr_accessor :resource_name
	attr_accessor :resource_description
	attr_accessor :resource_category
	attr_accessor :resource_link
	# if none of these attr_accessor are filled during the competency creation
	# process, then it must be the case that resource_id is filled by the id of
	# the resource already in the system that was choosen


	belongs_to :resource
	belongs_to :indicator
	validates_presence_of :resource_id, :indicator_id

	def name
		return resource.name
	end
end
