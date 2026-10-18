# frozen_string_literal: true

module HexletCode
  module Tag
    SINGLE_TAGS = %w[br hr img input meta link area base col embed source track wbr].freeze

    def self.build(name, attributes = {})
      opening = "<#{[name, *build_attributes(attributes)].join(' ')}>"
      return opening if SINGLE_TAGS.include?(name)

      body = block_given? ? yield : ''
      "#{opening}#{body}</#{name}>"
    end

    def self.build_attributes(attributes)
      attributes.map { |key, value| "#{key}=\"#{value}\"" }
    end
  end
end
