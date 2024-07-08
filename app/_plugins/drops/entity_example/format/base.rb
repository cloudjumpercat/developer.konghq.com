# frozen_string_literal: true

module Jekyll
  module Drops
    module EntityExample
      module Format
        class Base < Liquid::Drop
          MAPPING = {
            'admin-api' => 'Jekyll::Drops::EntityExample::Format::AdminAPI',
            'deck'      => 'Jekyll::Drops::EntityExample::Format::Deck',
            'konnect'   => 'Jekyll::Drops::EntityExample::Format::Konnect',
            'kic'       => 'Jekyll::Drops::EntityExample::Format::KIC',
            'ui'        => 'Jekyll::Drops::EntityExample::Format::UI'
          }

          def self.make_for(format:, type:, data:)
            klass = MAPPING[format]

            raise ArgumentError, "Unsupported entity example format: #{format}. Available formats: #{MAPPING.keys.join(', ')}" unless klass

            Object.const_get(klass).new(format:, type:, data:)
          end

          def initialize(format:, type:, data:)
            @format = format
            @type   = type
            @data   = data
          end

          def option
            raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
          end

          def include_file
            raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
          end

          def data
            raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
          end
        end
      end
    end
  end
end
