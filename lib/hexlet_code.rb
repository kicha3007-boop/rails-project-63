# frozen_string_literal: true

require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.setup

module HexletCode
  class Error < StandardError; end

  def self.form_for(entity, attributes = {})
    builder = FormBuilder.new(entity, **attributes)
    yield builder if block_given?
    FormRenderer.render_html(builder.form_body)
  end
end
