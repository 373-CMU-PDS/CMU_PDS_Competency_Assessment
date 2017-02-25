class AssessmentResultsPdf < Prawn::Document

	def initialize(competency_name, competent_indicators, competent_resources, developing_indicators, developing_resources, emerging_indicators, emerging_resources)
		super(top_margin: 70)
    
        @competency_name = competency_name
        @competent_indicators = competent_indicators
        @competent_resources = competent_resources
        @developing_indicators = developing_indicators
        @developing_resources = developing_resources
        @emerging_indicators = emerging_indicators
        @emerging_resources = emerging_resources
		

		title
		style
		logo
        competent_indicator_table
        competent_resource_table
        developing_indicator_table
        developing_resource_table
        emerging_indicator_table
        emerging_resource_table
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
    	text "Competency Assessment Results For: #{@competency_name}", size: 18, style: :bold
    end


    def competent_indicator_table
        move_down 30
        text "Your Competent Areas", size: 16, style: :bold
        text "Based on your repsonses to the assessment, you demonstrate competence in the following areas:", size: 14, style: :italic
        table competent_indicator_rows do 
            row(0).font_style = :bold
            columns(1..1).align = :center
            self.row_colors = ["D3D3D3","FFFFFF"]
            self.header = true
        end
    end

    def competent_indicator_rows
        [["  Indicator Name "]] + 
        @competent_indicators.map do |c|
          [ c ]
        end
    end


    def competent_resource_table
        move_down 30
        text "Improve Your Competent Areas More", size: 16, style: :bold

        table competent_resource_rows do 
            row(0).font_style = :bold
            columns(1..4).align = :center
            self.row_colors = ["D3D3D3","FFFFFF"]
            self.header = true
        end
    end

    def competent_resource_rows
        [["  Resource Name  ", "  Category  ", "  Description  ", "  Link  "]] +         

        @competent_resources.map do |cr|
        
          [cr.name, cr.resource_category, cr.description, cr.link ]
        end
    end


    def developing_indicator_table
        move_down 40
        text "Your Developing Areas", size: 16, style: :bold
        text "Based on your repsonses to the assessment, you are developing competence in the following areas:", size: 14, style: :italic
        table developing_indicator_rows do 
            row(0).font_style = :bold
            columns(1..1).align = :center
            self.row_colors = ["D3D3D3","FFFFFF"]
            self.header = true
        end
    end

    def developing_indicator_rows
        [["  Indicator Name "]] + 
        @developing_indicators.map do |d|
          [ d ]
        end
    end


    def developing_resource_table
        move_down 30
        text "Improve Your Developing Areas", size: 16, style: :bold
        table developing_resource_rows do 
            row(0).font_style = :bold
            columns(1..4).align = :center
            self.row_colors = ["D3D3D3","FFFFFF"]
            self.header = true
        end
    end

    def developing_resource_rows
        [["  Resource Name  ", "  Category  ", "  Description  ", "  Link  "]] +         

        @developing_resources.map do |dr|
        
          [dr.name, dr.resource_category, dr.description, dr.link ]
        end
    end




    def emerging_indicator_table
        move_down 40
        text "Your Emerging Indicators", size: 16, style: :bold
        text "Based on your repsonses to the assessment, your competence is emerging in the following areas:", size: 14, style: :italic

        table emerging_indicator_rows do 
            row(0).font_style = :bold
            columns(1..1).align = :center
            self.row_colors = ["D3D3D3","FFFFFF"]
            self.header = true
        end
    end

    def emerging_indicator_rows
        [["  Indicator Name "]] + 
        @emerging_indicators.map do |e|
          [e]
        end
    end


    def emerging_resource_table
        move_down 30
        text "Improve Your Emerging Areas", size: 16, style: :bold
        table emerging_resource_rows do 
            row(0).font_style = :bold
            columns(1..4).align = :center
            self.row_colors = ["D3D3D3","FFFFFF"]
            self.header = true
        end
    end

    def emerging_resource_rows
        [["  Resource Name  ", "  Category  ", "  Description  ", "  Link  "]] +         

        @emerging_resources.map do |er|
        
          [er.name, er.resource_category, er.description, er.link ]
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