# require needed files
require 'helpers/builder'
require 'helpers/authentication'

# create PDSHelpers
module AssessmentHelpers
  include AssessmentHelpers::Builder
  include AssessmentHelpers::Authentication
end