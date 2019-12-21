class BooksController < ApplicationController

	before_action :authenticate_user!

	# 投稿画面を表示
	def new
	end
	# 投稿を保存
	def create
		@book = Book.new(book_params)
		@book.user = current_user
		@user = current_user
		if @book.save
			redirect_to book_path(@book), notice: "Book was successfully created."
		else
			@books = Book.page(params[:page]).reverse_order
			render :index
		end
	end
	# 投稿のリストを表示する画面を作る
	def index
		@books = Book.page(params[:page]).reverse_order
		@book = Book.new
		@user = current_user
	end
	# 投稿の詳細を表示する画面を作る
	def show
		@book_new = Book.new
		@book = Book.find(params[:id])
		@user = @book.user
	end

	def destroy
		@book =Book.find(params[:id])
		if @book.destroy
			redirect_to books_path, notice: "Book was successfully destroyed."
		end
	end

	def edit
		@book = Book.find(params[:id])
		@user = @book.user
		if @book.user != current_user
			redirect_to books_path
		end
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to book_path(@book.id), notice: "Book was successfully updated."
		else
			@books = Book.page(params[:page]).reverse_order
			render :edit
		end
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
