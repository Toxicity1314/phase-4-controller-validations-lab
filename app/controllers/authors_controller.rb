class AuthorsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :email_error
  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create!(author_params)

    render json: author, status: :created
  end

  private
  
  def author_params
    params.permit(:email, :name)
  end

  def email_error(test)
    render json:{errors: test.record.errors}, status: :unprocessable_entity

  end
  
end
