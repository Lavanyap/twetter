class TwetsController < ApplicationController
  # All actions in this controller require the presence of an authenticated user.
  before_filter :authenticate_user!

  # GET /twets
  #
  # This action uses the #get_twets method to set the @twets instance variable.
  #
  #   @twets # => All twets defaultly shown to the authenticated user.
  #
  def index
    get_twets
  end

  # POST /twets
  #
  # Used to create a new twet for the authenticated user based on the data passed
  # in params[:twet]. If the twet is created successfully, a success message is
  # set and we are directed to the index action. Otherwise, an error message is set,
  # the twets visible to the authenticated user are loaded into @twets and the index
  # view template is displayed.
  #
  #   @twet # => The newly created (or attempted) twet.
  #   @twets # => (only set if the twet was not created) All twets defaultly shown
  #                to the authenticated user.
  #
  #
  def create
    @twet = current_user.twets.create(twet_params)
    if @twet.valid?
      flash[:success] = "Your twet was shared"
      redirect_to :action => :index and return
    else
      get_twets
      flash[:error] = "Your twet could not be saved"
      render :action => :index and return
    end
  end

  def destroy

     
    if twet.exists? 
     twet.destroy_all
    else
      flash[:error] = "We're sorry. We could not find that retwet."
    end
    url_return
  end

  def show
    if params[:id]
    @user = User.find_by_username(params[:id])
    if @user 
      @twets = Twet.by_user_ids(@user.id) 
    end
    end
  end

def get_twets
 
    @twets = current_user.all_twets
end

  private

  def twet
    @twet ||= current_user.twets.where(:original_twet_id => params[:id])
  end

  def url_return
    if params[:return_to].present?
      redirect_to params[:return_to]
    else
      redirect_to root_path
    end
  end

  def get_twets
 
    @twets = current_user.all_twets
end

  # Sets the @twets instance variable to all twets viewable by the current user


  # http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # This method uses Strong Parameters to ensure that the data passed by the user
  # is appropriate. If params[:twet] does not exist or contains any key / value
  # pairs other then :content, an error will be raised and the page will return
  # a 400 'Bad Request' HTML response code.
  #
  def twet_params
    params.require(:twet).permit(:content, :original_twet_id,:original_user_id)
  end
end
