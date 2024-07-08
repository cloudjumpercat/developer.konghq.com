# frozen_string_literal: true

module Jekyll
  module Drops
    module EntityExample
      class Service < Base
        def template
          @template ||= File.expand_path('app/_includes/components/entity_example/service.html')
        end
      end
    end
  end
end
