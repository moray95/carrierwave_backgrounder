# frozen_string_literal: true
module CarrierWave
  module Backgrounder
    module ORM
      module Uploader
        extend ActiveSupport::Concern

        included do
          after :store, :enqueue_background_job_if_needed

          def enqueue_background_job_if_needed(_)
            model.send "enqueue_#{mounted_as}_background_job_if_needed"
          end
        end
      end
    end
  end
end
