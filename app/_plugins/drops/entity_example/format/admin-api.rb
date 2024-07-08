# frozen_string_literal: true

require_relative './base'

module Jekyll
  module Drops
    module EntityExample
      module Format
        class AdminAPI < Base
          URLS = {
            'consumer' => 'http://localhost:8001/consumers/',
            'route'    => 'http://localhost:8001/routes/',
            'service'  => 'http://localhost:8001/services/'
          }.freeze

          def url
            @url ||= URLS.fetch(@type)
          end

          def option
            @option ||= 'Admin API'
          end

          def include_file
            @include_file ||= '/components/entity_example/format/admin-api.html'
          end

          def data
            @data
          end
        end
      end
    end
  end
end
