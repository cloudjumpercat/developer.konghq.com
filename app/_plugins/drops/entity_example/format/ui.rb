# frozen_string_literal: true

require_relative './base'

module Jekyll
  module Drops
    module EntityExample
      module Format
        class UI < Base
          def option
            @option ||= 'Kong Manager/Gateway Manager'
          end

          def include_file
            @include_file ||= "/components/entity_example/format/ui/#{@type}.html"
          end

          def data
            @data
          end
        end
      end
    end
  end
end
