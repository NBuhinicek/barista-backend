module Api
  module V1
    class ApiController < ActionController::API
      include JsonApiResponders
    end
  end
end
