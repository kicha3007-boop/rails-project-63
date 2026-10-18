# frozen_string_literal: true

module HexletCode
  module Inputs
    class TextInput < BaseInput
      DEFAULT_ATTRIBUTES = { cols: 20, rows: 40 }.freeze

      def to_html
        Tag.build('textarea', name: name, **DEFAULT_ATTRIBUTES, **attributes) { value }
      end
    end
  end
end
