# frozen_string_literal: true

require_relative '../../../utils/hash_to_yaml'
require_relative './base'

module Jekyll
  module Drops
    module EntityExample
      module Format
        class Deck < Base
          ENTITIES = {
            'consumer' => 'consumers',
            'route'    => 'routes',
            'service'  => 'services'
          }.freeze

          def entity
            @entity ||= ENTITIES.fetch(@type)
          end

          def data
            @yaml_data ||= Jekyll::Utils::HashToYAML.run(@data)
          end

          def option
            @option ||= 'decK'
          end

          def include_file
            @include_file ||= '/components/entity_example/format/deck.html'
          end
        end
      end
    end
  end
end
