module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    mapping do
      indexes :title, type: :text, analyzer: :english
      indexes :status, type: :boolean
    end

    def self.search(query)
      # build and run search
    end
  end

  def self.search(q)
    self.__elasticsearch__.search(q)
  end
end
