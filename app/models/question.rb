class Question < ActiveRecord::Base
    attr_accessor :answer
    
    # Gem for filtering
    filterrific(
        default_filter_params: { sorted_by: 'question asc' },
        available_filters: [
            :sorted_by,
            :sort_active,
            :sort_by_level
        ]
    )

    #relationships
    has_many :indicator_questions
    has_many :indicators, through: :indicator_questions

    #validations
    validates_presence_of :question

    #scopes
    scope :active, -> { where("active = ?", true) }
    scope :inactive, -> { where("active = ?", false) }
    scope :alphabetical, -> { order("question") }
    scope :by_competency, -> (id) { joins(:indicators).joins("INNER JOIN competencies ON indicators.competency_id = competencies.id").where('competencies.id = ?', id) }
    # scopes for filterrific
    scope :sort_active, -> (query) { where('questions.active = ?', query) }
    scope :sort_by_level, -> (query) { joins(:indicators).where('indicators.level = ?', query) }
    scope :sorted_by, lambda { |sort_option|
      direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
      case sort_option.to_s
      when /^question/
        order("LOWER(questions.question) #{ direction }")
      else
        raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
      end
    }

    # Private Functions

    def self.options_for_sorted_by
        [
          ['Question (a-z)', 'question asc'],
          ['Question (z-a)', 'question desc']
        ]
    end

    def self.options_for_sort_active
        [
            ["True", 't'],
            ["False", 'f']
        ]
    end

end
