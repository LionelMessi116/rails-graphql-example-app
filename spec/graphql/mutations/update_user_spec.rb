RSpec.describe 'update user', type: :graphql do

  let(:query) { GQL::BuildQuery.call('fixtures/graphql/UpdateUserMutation.gql')}
  let(:user) { create(:user) }

  context 'with correct data' do
    subject { GQL::FetchData.call(
      query,
      variables: { userInput: { name: 'Test1' } },
      context: { current_user: user })
    }

    it 'updates user' do
      data = subject.success.dig('updateUser')

      expect(data['ok']).to eq(true)
      user.reload
      expect(user.name).to eq('Test1')
    end
  end

  context 'without user' do
    subject { GQL::FetchData.call(
      query,
      variables: { userInput: { name: 'Test1' } },
      context: { current_user: nil })
    }

    it 'no have access' do
      expect(subject.success).to eq(nil)
      expect(subject.failure.present?).to be_truthy
    end
  end
end
