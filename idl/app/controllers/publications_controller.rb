class PublicationsController < ApplicationController
 def index
    @publications = Publication.all
  end

  def indexall
    @publications = Publication.all
  end

  def show
    @publications = Publication.find(params[:id])
  end

  def new
      @publication = Publication.new
  end

  def create
      @publication = Publication.create(publication_params)
      redirect_to @publication
  end

  def publication_params
    params.require(:publication).permit(:year, :citation)
  end

  def edit
      @publication = Publication.find(params[:id])
  end

  def update
      @publication = Publication.find(params[:id])
      respond_to do |format|
          if @publication.update(publication_params)
              format.html {redirect_to publications_path, notice: 'Publication was successfully updated.'}
              format.json {head :no_content}
          else
              format.html {render action: 'edit'}
              format.json {render json: @publication.errors, status: :unprocessable_entity}
          end
      end
  end

  def destroy
    @publication = Publication.find(params[:id])
    @publication.destroy
    flash[:success] = "Publication deleted"
    redirect_to publications_path
  end
end
