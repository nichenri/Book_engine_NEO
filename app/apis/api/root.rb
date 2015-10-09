module API
  class Root < Grape::API
    prefix 'api'
    mount API::Ver1::Root
    #mount API::Ver2::Root
  end
end
