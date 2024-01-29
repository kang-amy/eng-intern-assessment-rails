class Article < ApplicationRecord
    # Ensure that every article has a title and content
    validates :title, presence: true
    validates :content, presence: true
    validates :author, presence: false
    validates :date, presence: false
  
    def self.search(query)
      if query.present?
        # Use SQLite-compatible case-insensitive search
        where('LOWER(title) LIKE LOWER(:query) OR LOWER(content) LIKE LOWER(:query)', query: "%#{query}%")
      else
        all
      end
    end
  end
