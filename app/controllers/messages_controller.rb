class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :update, :destroy]

  # GET /messages
  def index
    if params[:from].present? && params[:to].present? then
      @messages = Message.scope(params[:from], params[:to])
    else 
      @messages = Message.all
    end

    render json: @messages
  end

  # GET /messages/1
  def show
    render json: @message
  end

  # POST /messages
  def create    
    @message = Message.new(from: params[:from], to: params[:to], text: params[:text])

    if @message.save
      render json: @message, status: :created, location: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def message_params
      params.require(:message).permit(:from, :to, :text)
    end
end
