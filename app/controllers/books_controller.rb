class BooksController < ApplicationController

	#初期画面
	def top
	end
	# 投稿画面を表示
	def new
		@book = Book.new
	end
	# 投稿を保存
	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@book.save
		redirect_to @book
	end
	# 投稿のリストを表示する画面を作る
	def index
		@books = Book.page(params[:page]).reverse_order
	end
	# 投稿の詳細を表示する画面を作る
	def show
		@book = Book.find(params[:id])
	end

	def destroy
		@book =Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		book = Book.find(params[:id])
		book.update(book_params)
		redirect_to book_path(book.id)
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
