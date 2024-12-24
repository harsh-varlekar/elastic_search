# frozen_string_literal: true

module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    mapping do
      indexes :title, type: 'text'
      indexes :content, type: 'text'
    end

    def self.search(query)
      params = {
        query: {
          multi_match: {
            query: query,
            fields: %w[title content],
            fuzziness: 'AUTO'
          }
        }
      }

      __elasticsearch__.search(params).records.to_a
    end
  end
end
