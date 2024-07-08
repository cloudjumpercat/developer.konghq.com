# frozen_string_literal: true

module Jekyll
  module Drops
    module EntityExample
      class Route < Base
        def template
          @template ||= File.expand_path('app/_includes/components/entity_example/route.html')
        end
      end
    end
  end
end
