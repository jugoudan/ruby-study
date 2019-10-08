class BooksController < ApplicationController
  

  def my_create
    @book = Book.new(book_params)
    if @book.save
      render json: @book
     else
      render json: @book.errors
    end
  end
  
  
  def my_delete
    @book = Book.find(params[:id])
    if @book.destroy
      render json: @book
    else
      render json: @book.errors
    end
  end

  def my_update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors
    end
  end

  def my_retrieveall
    @books = Book.all
    render json: @books
  end
  
  def my_retrieve
    @book = Book.find(params[:id]) 
    render json: @book
  end


  def my_down_file
    # p params[:filename]
    send_file "public/files/"+params[:filename]+".txt"
    unless 
      params[:filename].blank?  
    end 
  end   


  # CarrierWave: https://github.com/carrierwaveuploader/carrierwave 
  #使用CarrierWave完成文件的上传
  def my_up_file_CarrierWave
    up_file = params[:localfile]
    myfile = AvatarUploader.new
    myfile.store!(up_file)
    render json: myfile
  end

  #完成对相关Model的上传以及下载
  def my_down_file_CarrierWave_with_Books
    @book = Book.find(params[:id])
    book_avatar = @book.avatar  #实例的附件
    #send_file "#{book_avatar.book_avatar.file}", :filename => file_name
    send_file "public/#{book_avatar.url}"
  end

  def my_up_file_CarrierWave_with_Books
    b = Book.new
    b.avatar = params[:localfile]
    b.save
    render json: b
  
    # b.avatar.url # => '/url/to/file.png' 相对路径
    # b.avatar.current_path # => 'path/to/file.png' 绝对路径
    # b.avatar_identifier # => 'file.png'
  end

  def sidekiq_only_job
    # TestSidekiqJob.perform_now(params[:count])
    # TestSidekiqJob.set(wait: 1.minute).perform_later(params[:count])
    TestSidekiqJob.perform_later(params[:count])
    render json: :"running......"
  end


  private
	def book_params
      	params.require(:book).permit(:name, :image_url)
  	end
end
