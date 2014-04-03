class EntriesController < ApplicationController

  def create
    @entry = current_user.entries.build(entry_params)
    if @entry.save
      flash[:success] = "Entry created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @entry = current_user.entries.find_by(id: params[:id])
    @entry.destroy
    redirect_to root_url
  end

  private

    def entry_params
      params.require(:entry).permit(:content)
    end

    def correct_user
      @entry = current_user.entries.find_by(id: params[:id])
      redirect_to root_url if @entry.nil?
    end

    
end