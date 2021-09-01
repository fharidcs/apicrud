module Api
    module V1
        class ProductsController < ApplicationController

            def index
                products = Product.order('created_at');
                render json: {
                    status: 'Conexion Exitosa',
                    message: 'Productos cargados',
                    data:  products
                }, status: :ok
            end

            def show
                products = Product.find(params[:id])
                render json: {
                    status: 'Conexion Exitosa',
                    message: 'Productos cargado',
                    data:  products
                }, status: :ok
            end

            def create
                product = Product.new(product_params)
                if product.save
                    render json: {
                    status: 'Save True',
                    message: 'Productos creado',
                    data:  product
                }, status: :ok
                else
                    render json: {
                        status: 'Fail Save',
                        message: 'Productos no creado',
                        data:  product.errors
                    }, status: :unprocessable_entity
                end
            end

            def destroy
                product = Product.find(params[:id])
                if product.destroy
                    render json: {
                    status: 'Deleted',
                    message: 'Productos Eliminado',
                    data:  product
                }, status: :ok
                else
                    render json: {
                        status: 'Fail Deleted',
                        message: 'Productos no eliminado',
                        data:  product.errors
                    }, status: :unprocessable_entity
                end
            end

            def update
                product = Product.find(params[:id])
                if product.update(product_params)
                    render json: {
                        status: 'Existoso',
                        message: 'Producto Actualizado',
                        data: product
                    } , status: :ok
                else
                    render json: {
                        status: 'Fallido',
                        message: 'Producto No Actulizado',
                        data: product.errors
                    }, status: :unprocessable_entity
                end
            end

            private 
                def product_params
                    params.permit(:name, :description, :variants)
                end

        end
    end    
end