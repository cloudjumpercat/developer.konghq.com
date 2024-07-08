# frozen_string_literal: true

require_relative './base'

module Jekyll
  module Drops
    module EntityExample
      module Format
        class Terraform < Base
          def data
            @data
          end

          def option
            @option ||= 'terraform'
          end

          def include_file
            @include_file ||= '/components/entity_example/format/terraform.html'
          end
        end
      end
    end
  end
end
