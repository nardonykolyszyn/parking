# frozen_string_literal: true

describe Api::V1::OwnersController, type: :controller do
  # Fixtures
  let(:payload) { { owner: { name: 'Nardo Nykolyszyn', document_type: 'CE', document: 4874435534} }}
  let(:payload_missing_document_type) { { owner: { name: 'Nardo Nykolyszyn', document_type: 43, document: 4874435534} }}

  context 'errors testing' do
    it 'should an unprocessable entity when payload is empty' do
      post :create
      expect(response.status).to eq(422)
    end

    it 'expect something' do
      post :create, params: payload
      expect(response.status).to eq(200)
    end

    it 'expect to throw an error with wrong document_type' do
      post :create, params: payload_missing_document_type
      expect(response.body).to include_json(
        errors: "'43' is not a valid document_type"
      )
    end
  end
end
