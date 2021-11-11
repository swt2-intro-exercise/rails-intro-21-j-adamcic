class AuthorsController < ApplicationController
    
    def show
        @author = Author.find(params[:id])
    end
    
    def new
    end

    def create
        #render plain: params[:author].inspect
        @author = Author.new(author_params)

        @author.save
        #redirect_to root_path, notice: 'Success!'
        redirect_to @author
    end

    private
        def author_params
            params.require(:author).permit(:first_name, :last_name, :homepage)
        end
end
