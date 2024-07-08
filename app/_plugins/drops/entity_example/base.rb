# frozen_string_literal: true

module Jekyll
  module Drops
    module EntityExample
      class Base < Liquid::Drop
        MAPPING = {
          'consumer' => 'Jekyll::Drops::EntityExample::Consumer',
          'service'  => 'Jekyll::Drops::EntityExample::Service',
          'route'    => 'Jekyll::Drops::EntityExample::Route'
        }

        def self.make_for(example:)
          klass = MAPPING[example['type']]

          raise ArgumentError, "Unsupported entity example type: #{example['type']}. Available types: #{MAPPING.keys.join(', ')}" unless klass

          Object.const_get(klass).new(example:)
        end

        def initialize(example:)
          @example = example

          formats
        end

        def template
          @template ||= File.expand_path('app/_includes/components/entity_example.html')
        end

        def formats
          @formats ||= @example.fetch('formats').map do |format|
            Drops::EntityExample::Format::Base.make_for(format:, type:, data:)
          end
        end

        def data
          @data ||= @example.fetch('data')
        end

        def type
          @type ||= @example.fetch('type')
        end
      end
    end
  end
end
