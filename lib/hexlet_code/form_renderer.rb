# frozen_string_literal: true

module HexletCode
  module FormRenderer
    def self.render_html(form_body)
      Tag.build('form', form_body[:form_options]) do
        fields = form_body[:inputs].flat_map { |input| [input.label, input.to_html] }
        fields << Tag.build('input', form_body[:submit]) if form_body[:submit]
        fields.join
      end
    end
  end
end
