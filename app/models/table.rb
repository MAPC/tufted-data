class Table < ActiveRecord::Base
  after_initialize :readonly!
end
