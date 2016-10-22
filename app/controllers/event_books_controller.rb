class EventBooksController < ApplicationController
  before_action :set_event_book, only: [:show, :edit, :update, :destroy]

  # GET /event_books
  # GET /event_books.json
  def index
    @event_books = EventBook.all
  end

  # GET /event_books/1
  # GET /event_books/1.json
  def show
  end

  # GET /event_books/new
  def new
    @event_book = EventBook.new
  end

  # GET /event_books/1/edit
  def edit
  end

  # POST /event_books
  # POST /event_books.json
  def create
    @event_book = EventBook.new(event_book_params)

    respond_to do |format|
      if @event_book.save
        format.html { redirect_to @event_book, notice: 'Event book was successfully created.' }
        format.json { render :show, status: :created, location: @event_book }
      else
        format.html { render :new }
        format.json { render json: @event_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_books/1
  # PATCH/PUT /event_books/1.json
  def update
    respond_to do |format|
      if @event_book.update(event_book_params)
        format.html { redirect_to @event_book, notice: 'Event book was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_book }
      else
        format.html { render :edit }
        format.json { render json: @event_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_books/1
  # DELETE /event_books/1.json
  def destroy
    @event_book.destroy
    respond_to do |format|
      format.html { redirect_to event_books_url, notice: 'Event book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_book
      @event_book = EventBook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_book_params
      params.fetch(:event_book, {})
    end
end
