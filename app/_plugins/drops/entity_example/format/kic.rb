# frozen_string_literal: true

require_relative '../../../utils/hash_to_yaml'
require_relative './base'

module Jekyll
  module Drops
    module EntityExample
      module Format
        class KIC < Base
          def data
            @yaml_data ||= Jekyll::Utils::HashToYAML.run(@data)
          end

          def option
            @option ||= 'KIC'
          end

          def include_file
            @include_file ||= '/components/entity_example/format/kic.html'
          end
        end
      end
    end
  end
end
