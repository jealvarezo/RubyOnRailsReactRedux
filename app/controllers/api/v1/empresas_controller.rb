class Api::V1::EmpresasController < ApplicationController

    before_action :set_empresa, only: [:show, :update, :destroy]
    before_action :set_models, only:[:index, :show]

    def index
        @empresas = Empresa.all
        render json: @empresas, include: @models #[:politica]
    end

    def show
        #@empresa = Empresa.find( params[:id] )
        render json: @empresa, include: @models #[:politica]
    end

    def create
        @empresa = Empresa.new( empresa_params )
        if @empresa.save
            render json: @empresa, status: :created
        else
            render json: @empresa.errors, status: :unprocessable_entity
        end
    end

    def update
        #@empresa = Empresa.find( params[:id] )
        if @empresa.update( empresa_params )
            render json: @empresa
        else
            render json: @empresa.errors, status: :unprocessable_entity
        end
    end

    def destroy
        #@empresa = Empresa.find( params[:id] )
        @empresa.destroy
    end

private 

    def empresa_params
        params.require(:empresa).permit(:name, :description)
    end

    def set_empresa
        @empresa = Empresa.find( params[:id] )
    end

    def set_models
        @models = [:politica]
    end
end
