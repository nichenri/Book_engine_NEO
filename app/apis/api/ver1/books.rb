module API
  module Ver1
    class Books < Grape::API
      resource :books do

        # GET /api/v1/books
        desc 'Return all books.'
        get do
          Book.all
        end

        # GET /api/v1/books/{:id}
        desc 'Return a book.'
        params do
          requires :id, type: Integer, desc: 'Book id.'
        end
        get ':id' do
          Book.find(params[:id])
        end
      end
    end
  end
end
