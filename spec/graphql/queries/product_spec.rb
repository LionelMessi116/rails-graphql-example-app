RSpec.describe 'search product', type: :graphql do

  let(:query) { GQL::BuildQuery.call('fixtures/graphql/ProductQuery.gql')}
  let(:user) { create(:user) }

  context 'with correct id' do
    subject { GQL::FetchData.call(
      query,
      variables: { productId: 1 },
      context: { current_user: user })
    }

    it 'finds product' do
      data = subject.success.dig('product')

      expect(data['name']).to eq('Product_1')
      expect(data['itemsCount']).to eq(2)
      expect(data['productItems'].present?).to be_truthy
    end
  end

  context 'with incorrect id' do
    subject { GQL::FetchData.call(
      query,
      variables: { productId: 0 },
      context: { current_user: user })
    }

    it 'no finds product' do
      expect(subject.success).to eq(nil)
      expect(subject.failure.present?).to be_truthy
    end
  end
end
