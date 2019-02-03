# require 'rails_helper'
#
# RSpec.describe CoffeeShopsController, type: :controller do
#   # This should return the minimal set of attributes required to create a valid
#   # CoffeeShop. As you add validations to CoffeeShop, be sure to
#   # adjust the attributes here as well.
#   let(:valid_attributes) do
#     skip('Add a hash of attributes valid for your model')
#   end
#
#   let(:invalid_attributes) do
#     skip('Add a hash of attributes invalid for your model')
#   end
#
#   # This should return the minimal set of values that should be in the session
#   # in order to pass any filters (e.g. authentication) defined in
#   # CoffeeShopsController. Be sure to keep this updated too.
#   let(:valid_session) { {} }
#
#   describe 'GET #index' do
#     it 'returns a success response' do
#       CoffeeShop.create! valid_attributes
#       get :index, params: {}, session: valid_session
#       expect(response).to be_successful
#     end
#   end
#
#   describe 'GET #show' do
#     it 'returns a success response' do
#       coffee_shop = CoffeeShop.create! valid_attributes
#       get :show, params: { id: coffee_shop.to_param }, session: valid_session
#       expect(response).to be_successful
#     end
#   end
#
#   describe 'GET #new' do
#     it 'returns a success response' do
#       get :new, params: {}, session: valid_session
#       expect(response).to be_successful
#     end
#   end
#
#   describe 'GET #edit' do
#     it 'returns a success response' do
#       coffee_shop = CoffeeShop.create! valid_attributes
#       get :edit, params: { id: coffee_shop.to_param }, session: valid_session
#       expect(response).to be_successful
#     end
#   end
#
#   describe 'POST #create' do
#     context 'with valid params' do
#       it 'creates a new CoffeeShop' do
#         expect do
#           post :create, params: { coffee_shop: valid_attributes }, session: valid_session
#         end.to change(CoffeeShop, :count).by(1)
#       end
#
#       it 'redirects to the created coffee_shop' do
#         post :create, params: { coffee_shop: valid_attributes }, session: valid_session
#         expect(response).to redirect_to(CoffeeShop.last)
#       end
#     end
#
#     context 'with invalid params' do
#       it "returns a success response (i.e. to display the 'new' template)" do
#         post :create, params: { coffee_shop: invalid_attributes }, session: valid_session
#         expect(response).to be_successful
#       end
#     end
#   end
#
#   describe 'PUT #update' do
#     context 'with valid params' do
#       let(:new_attributes) do
#         skip('Add a hash of attributes valid for your model')
#       end
#
#       it 'updates the requested coffee_shop' do
#         coffee_shop = CoffeeShop.create! valid_attributes
#         put :update, params: { id: coffee_shop.to_param, coffee_shop: new_attributes },
#                      session: valid_session
#         coffee_shop.reload
#         skip('Add assertions for updated state')
#       end
#
#       it 'redirects to the coffee_shop' do
#         coffee_shop = CoffeeShop.create! valid_attributes
#         put :update, params: { id: coffee_shop.to_param, coffee_shop: valid_attributes },
#                      session: valid_session
#         expect(response).to redirect_to(coffee_shop)
#       end
#     end
#
#     context 'with invalid params' do
#       it "returns a success response (i.e. to display the 'edit' template)" do
#         coffee_shop = CoffeeShop.create! valid_attributes
#         put :update, params: { id: coffee_shop.to_param, coffee_shop: invalid_attributes },
#                      session: valid_session
#         expect(response).to be_successful
#       end
#     end
#   end
#
#   describe 'DELETE #destroy' do
#     it 'destroys the requested coffee_shop' do
#       coffee_shop = CoffeeShop.create! valid_attributes
#       expect do
#         delete :destroy, params: { id: coffee_shop.to_param }, session: valid_session
#       end.to change(CoffeeShop, :count).by(-1)
#     end
#
#     it 'redirects to the coffee_shops list' do
#       coffee_shop = CoffeeShop.create! valid_attributes
#       delete :destroy, params: { id: coffee_shop.to_param }, session: valid_session
#       expect(response).to redirect_to(coffee_shops_url)
#     end
#   end
# end
