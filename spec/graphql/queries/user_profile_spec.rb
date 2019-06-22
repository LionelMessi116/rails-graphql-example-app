RSpec.describe 'search user profile', type: :graphql do

  let(:query) { GQL::BuildQuery.call('fixtures/graphql/UserProfileQuery.gql')}
  let(:user) { create(:user) }

  context 'with current user' do
    subject { GQL::FetchData.call(
      query,
      context: { current_user: user })
    }

    it 'returns data' do
      data = subject.success.dig('userProfile')

      expect(data['name']).to eq(user.name)
    end
  end

  context 'without current user' do
    subject { GQL::FetchData.call(
      query,
      context: { current_user: nil })
    }

    it 'no have access' do
      expect(subject.success).to eq(nil)
      expect(subject.failure.present?).to be_truthy
    end
  end
end
