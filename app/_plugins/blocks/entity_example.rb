# frozen_string_literal: true

require 'yaml'

module Jekyll
  class EntityExample < Liquid::Block
    def render(context) # rubocop:disable Metrics/MethodLength
      @context = context
      @site = context.registers[:site]
      @page = context.environments.first['page']

      contents = super

      entity_example = Drops::EntityExample::Base.make_for(example: YAML.load(contents))

      Liquid::Template
        .parse(File.read(entity_example.template))
        .render(
          { 'site' => @site.config, 'page' => @page, 'include' => { 'example' => entity_example } },
          { registers: @context.registers, context: @context }
        )
    end
  end
end

Liquid::Template.register_tag('entity_example', Jekyll::EntityExample)
