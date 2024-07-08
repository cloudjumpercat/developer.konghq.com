# frozen_string_literal: true

require_relative './base'

module Jekyll
  module Drops
    module EntityExample
      module Format
        class Konnect < Base
          URLS = {
            'consumer' => 'https://{us|eu}.api.konghq.com/v2/control-planes/{controlPlaneId}/core-entities/consumers/',
            'route'    => 'https://{us|eu}.api.konghq.com/v2/control-planes/{controlPlaneId}/core-entities/routes/',
            'service'  => 'https://{us|eu}.api.konghq.com/v2/control-planes/{controlPlaneId}/core-entities/services/'
          }.freeze

          def url
            @url ||= URLS.fetch(@type)
          end

          def data
            @data
          end

          def option
            @option ||= 'Konnect'
          end

          def include_file
            @include_file ||= '/components/entity_example/format/konnect.html'
          end
        end
      end
    end
  end
end
