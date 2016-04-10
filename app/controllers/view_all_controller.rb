class ViewAllController < ApplicationController

	# The first view when you begin the nested view all process
	def index
	end

	# Competency step of the view all process
	def choose_competency
		@competencies = Competency.all
	end

	#Process Flow
	def process_flow
	end

	#Report Format
	def report_format
	end

	# Choose Level step
	def choose_level
		@competency = Competency.find(params[:competency_id])
	end

	# The step where the user can view the indicators and resources associated with the chosen competency and level
	def view_indicators_and_resources
		@competency = Competency.find(params[:competency_id])
		@indicators = Indicator.by_level(params[:level]).by_competency(@competency.name)
		@resources = Resource.all
	end

end