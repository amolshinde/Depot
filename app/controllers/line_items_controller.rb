class LineItemsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :update, :destroy]
  after_action :set_path, only: [:index, :show, :new ]

  def index
    @line_items = LineItem.all
  end

  def show
  end

  def new
    @line_item = LineItem.new
  end

  def edit
  end

  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to(store_url) }
        format.js { @current_item = @line_item }
        format.xml  { render :xml => @line_item, :status => :created, :location => @line_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @line_item.errors,       :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to(@line_item, :notice => 'Line item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @line_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to(line_items_url) }
      format.xml  { head :ok }
    end
  end

  private

  def set_item
    @line_item = LineItem.find(params[:id])
  end

  def set_path
    respond_to do |format|
      format.html
      format.xml  { render :xml => @line_items }
    end
  end

  # def lineitem_param
  #   params.require(:line_items).permit(:product_id, :cart_id )
  # end

end
