class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
    render json: @tickets
  end

  def show
    @ticket = Ticket.find_by_id(params[:id])
    render json: @ticket
  end

  def new
    @ticket = Ticket.new
  end

  def edit
  end

  def create
    @ticket = Ticket.new(params)
  end

  def update
    respond_to do |format|
      if @ticket.update(params)
        render json: @ticket
      else
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ticket.destroy
    render json: @ticket
  end
end
