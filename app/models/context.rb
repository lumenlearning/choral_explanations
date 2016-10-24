class Context < ApplicationRecord
  belongs_to :parent_context, class_name: "Context", optional: true

  store_accessor :settings
end
