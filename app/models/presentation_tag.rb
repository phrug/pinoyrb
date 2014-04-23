class PresentationTag < ActiveRecord::Base
  belongs_to :presentation
  belongs_to :tag, touch: true
end
