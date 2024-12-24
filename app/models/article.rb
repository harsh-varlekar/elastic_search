# frozen_string_literal: true

class Article < ApplicationRecord
  include Searchable
end
