class BooksController < ApplicationController
	# 投稿画面を表示
	def new
		@book = Book.new
	end
	# 投稿を保存
	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@book.save
		redirect_to books_path
	end
	# 投稿のリストを表示する画面を作る
	def index
		@books = Book.all
	end
	# 投稿の詳細を表示する画面を作る
	def show
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
