class ReportPdf < Prawn::Document

	def initialize(competencies, indicators, resources, indicator_resources, questions, indicator_questions)
		super(top_margin: 70)
		@competencies = competencies
		@indicators = indicators
		@resources = resources 
		@indicator_resources = indicator_resources
		@questions = questions
		@indicator_questions = indicator_questions

		title
		style
		logo
		competency_table
		indicator_table
		resource_table
		indicator_resource_table
		question_table
		indicator_question_table
		
		page_numbers
	end

	def style
		font ("Times-Roman")
		font_size(10)
	end

	def logo
		img = "app/assets/images/logo.png"

		repeat :all do 
			image img, :at => bounds.bottom_left, :scale =>0.25
        end
    end


    def title
    	move_down 0
    	text "All Stored Data", size: 18, style: :bold
    end

    def competency_table
    	move_down 30
    	text "All Competencies", size: 16, style: :bold
    	table competency_rows do 
    		row(0).font_style = :bold
    		columns(1..2).align = :center
    		self.row_colors = ["D3D3D3","FFFFFF"]
    		self.header = true
    	end
    end

    def competency_rows
    	[["  #  ", "  Competency Name "]] + 
	    @competencies.map do |c|
	    
	      [c.id, c.name ]
	    end
    end

    def indicator_table
    	move_down 75
    	text "All Indicators", size: 16, style: :bold
    	table indicator_rows do 
    		row(0).font_style = :bold
    		columns(1..4).align = :center
    		self.row_colors = ["D3D3D3","FFFFFF"]
    		self.header = true
    	end
    end

    def indicator_rows
    	[["  #  ", "  Indicator Name  ", "  Associated Competency  ", "  Level  "]] + 
	    @indicators.map do |i|
	    
	      [i.id, i.description, i.competency_id, i.level ]
	    end
    end


    def resource_table
    	move_down 75
    	text "All Resources", size: 16, style: :bold
    	table resource_rows do 
    		row(0).font_style = :bold
    		columns(1..5).align = :center
    		self.row_colors = ["D3D3D3","FFFFFF"]
    		self.header = true
    	end
    end

    def resource_rows
    	[["  #  ", "  Resource Name  ", "  Category  ", "  Description  ", "  Link  "]] + 
	    @resources.map do |r|
	    
	      [r.id, r.name, r.resource_category, r.description, r.link ]
	    end
    end


    def indicator_resource_table
    	move_down 75
    	text "All Indicator-Resource Relationships", size: 16, style: :bold
    	table indicator_resource_rows do 
    		row(0).font_style = :bold
    		columns(1..3).align = :center
    		self.row_colors = ["D3D3D3","FFFFFF"]
    		self.header = true
    	end
    end

    def indicator_resource_rows
    	[["  #  ", "  Indicator ID  ", "  Resource ID  "]] + 
	    @indicator_resources.map do |ir|
	    
	      [ir.id, ir.indicator_id, ir.resource_id ]
	    end
    end


    def question_table
    	move_down 75
    	text "All Assessment Questions", size: 16, style: :bold
    	table question_rows do 
    		row(0).font_style = :bold
    		columns(1..2).align = :center
    		self.row_colors = ["D3D3D3","FFFFFF"]
    		self.header = true
    	end
    end

    def question_rows
    	[["  #  ", "  Question  "]] + 
	    @questions.map do |q|
	    
	      [q.id, q.question ]
	    end
    end



    def indicator_question_table
    	move_down 75
    	text "All Indicator-Question Relationships", size: 16, style: :bold
    	table indicator_question_rows do 
    		row(0).font_style = :bold
    		columns(1..3).align = :center
    		self.row_colors = ["D3D3D3","FFFFFF"]
    		self.header = true
    	end
    end

    def indicator_question_rows
    	[["  #  ", "  Indicator ID  ", "  Question ID  "]] + 
	    @indicator_questions.map do |iq|
	    
	      [iq.id, iq.indicator_id, iq.question_id ]
	    end
    end


    def page_numbers
    	string = "page <page> of <total>"
	    # Green page numbers 1 to 7
	    options = { :at => [bounds.right - 150, 0],
	                 :width => 150,
	                 :align => :right,
	                 :page_filter => (1..100),
	                 :start_count_at => 1,
	                 :color => "000000" }
	    number_pages string, options
    end



end





