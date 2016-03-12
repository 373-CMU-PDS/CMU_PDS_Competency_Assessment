
FactoryGirl.define do

  # Competencies factory set up
    factory :competency do
        name "Communication"
        active true
    end

  # Resources factory set up 
	factory :resource do
		name "Crocodile Dundee"
		type "MOVIE"
		description "Crocodile Dundee is a 1986 Australian comedy film set in the Australian Outback and in New York City."
		link "https://en.wikipedia.org/wiki/%22Crocodile%22_Dundee"
		active true
	end

  # Resource_Indicator factory set up
	factory :indicator_resource do
		association :resource
		association :indicator
	end

  # Indicators factory set up
  factory :indicator do
    association :competency
    level "Companion"
    description "Able to identify common nonverbal cues."
    active true
  end

end