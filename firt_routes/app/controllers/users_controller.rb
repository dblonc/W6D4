require "byebug"
class UsersController < ApplicationController
    
    def index
        lists = User.all
        render json: lists
    end

    def create
        # binding.pry
        user = User.new(strong_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity #422
        end
    end

    def show
        person = User.find(params[:id])
        render json: person
    end

    def update
        person = User.find(params[:id])
        if person.update(strong_params)
            redirect_to person_url(person)
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        debugger
        person = User.find(params[:id])
        person.destroy
        redirect_to person_url
    end

    private

    def strong_params
        params.require(:user).permit(:name,:email)
    end

end